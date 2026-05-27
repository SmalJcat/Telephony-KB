---
quality: curated
doc_type: case
domain: Call
rat: LTE/NR
feature: ECC / no-SIM emergency call / eUICC slot selection
platform: UNISOC
layer: AP Telephony / UnisocCallManager / RIL / Modem ATC
symptom: "双卡无实体卡场景拨打 112/911 失败或闪退，进飞行模式后再拨打紧急号码反而正常"
cause: "AP 侧紧急呼叫选卡逻辑优先选择了存在 eUICC 的卡槽，导致无卡紧急呼叫下发到非预期协议栈；后续补丁在选择有卡槽位时过滤 eUICC"
project: "GH67A1"
chipset: "UMS9621S"
source_log: "CQWeb SPCSS01593707"
first_bad_point: "Modem 侧看到无卡紧急呼叫 ATD112/ATD911 被下发到 sim:1，AP 侧 getProperPhoneForEcc 需要区分实体 SIM 与 eUICC"
confidence: high
status: summarized
tags:
  - cqweb
  - ecc
  - emergency-call
  - esim
  - slot-selection
---

# 无卡紧急呼叫选到 eSIM 卡槽失败

## 用户现象

双卡无实体卡测试时，拨打 `112` / `911` 失败或出现闪退；同一版本在开启飞行模式后再拨打紧急号码可以成功。现场一开始容易怀疑是紧急呼叫域选择或网络回退问题。

## 结论

第一坏点在 AP 侧紧急呼叫选卡/选 phone 逻辑。测试宣称“无卡”，但设备上仍存在 eUICC 信息，AP 侧优先选择“有卡”的卡槽后，把 emergency dial 下发到了非预期协议栈。后续补丁方向是在 `getProperPhoneForEcc` 里选择有卡槽位时过滤 eUICC，避免无实体卡紧急呼叫被 eSIM 槽位劫持。

## 关键证据

```text
ATC_RecNewLineSig, link_id:5, sim:1, len:12, line:ATD112@,#i;
ATC_RecNewLineSig, link_id:5, sim:1, len:12, line:ATD911@,#i;
```

CP 侧结论是无卡紧急呼叫命令收在 SIM2/`sim:1` 上，需要 AP 确认当前协议栈开启状态以及拨号时为什么选择该 phone。

补丁方向是对 AP 侧选择逻辑增加 eUICC 过滤：

```java
if (mTelephonyManager.hasIccCard(phone.getPhoneId()) && !iSEuicc(phone)) {
    return phone;
}
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| 测试前置 | “无卡”要确认无实体 SIM，同时确认是否存在 eSIM/eUICC |
| AP 选卡 | 看 emergency dial 选择的 `phoneId/subId/slotId` |
| RIL/AT 下发 | 看 `RIL_IMS_REQUEST_EMERGENCY_DIAL` 或 ATD 命令实际下发到哪个栈 |
| CP 证据 | `ATC_RecNewLineSig ... sim:x ... ATD112/ATD911` 是选栈关键证据 |
| 对比场景 | 开关飞行模式前后若行为不同，重点看 radio/phone/subInfo 重新同步后选卡是否变化 |

## 处理建议

1. 无卡 ECC 失败时不要只看号码是否为紧急号码，还要确认 AP 最终选择的 phone/slot。
2. 双卡、eSIM、开机向导、飞行模式恢复这几类入口都要单独复测。
3. 如果存在 eUICC，确认平台策略是把它当“可用于紧急呼叫的卡”，还是需要按无实体卡处理。
4. 修复后复测 `112`、`911`，并保留 AP log、RIL log、modem ATC 收命令证据。

## 来源

- CQWeb：`SPCSS01593707`

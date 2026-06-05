---
quality: curated
doc_type: case
domain: SIM
rat: LTE/3G/GSM
feature: SimLock / SubInfo / MCCMNC
platform: UNISOC
layer: Framework/Subscription / RIL / SIMLock
symptom: "SimLock 卡槽依赖配置下，锁卡状态 SubInfo 中 mcc/mnc 和 gsm.sim.operator.numeric 为空"
cause: "SIM 处于 NETWORK_LOCKED / PH-NET PIN，未进入 READY，平台不会继续读取 IMSI、MCC/MNC 等卡信息"
project: "GH6571"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01329406"
first_bad_point: "AP 在 NETWORK_LOCKED 状态下期望读取完整 SubInfo MCC/MNC"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - simlock
  - subinfo
---

# SimLock 锁卡状态下 MCC/MNC 为空

## 结论

CQWeb `SPCSS01329406` 的结论是：锁卡状态下平台读卡逻辑和 AOSP 保持一致，只有解锁后 SIM 进入 READY 才会继续读取卡信息。卡仍处于 `NETWORK_LOCKED` / `PH-NET PIN` 时，SubInfo 中 `mcc/mnc` 为空、`gsm.sim.operator.numeric` 为空是预期现象，不能依赖 AP 侧 SubInfo 再判断白名单或黑名单。

## 现象

- 平台：UNISOC UMS9230。
- 配置：SimLock 依赖设置为卡槽依赖 1，`dummy2=0x2`。
- 表现：卡二锁卡状态下，`SimLockController` 拿不到 `mSimNumeric`，`SubscriptionInfoInternal` 中 `mcc/mnc` 为空。

## 关键日志

```text
updateSimState: slot 1 NETWORK_LOCKED
updateSubscription: phoneId=1, simState=NETWORK_LOCKED
+CPIN: PH-NET PIN
SubscriptionInfoInternal ... mcc= mnc= ...
gsm.sim.operator.numeric = ""
```

## 判断要点

| 现象 | 判断 |
|---|---|
| `NETWORK_LOCKED` 且 `+CPIN: PH-NET PIN` | 卡还没有解锁，不能按 READY 卡处理 |
| SubInfo 有 iccid 但无 `mcc/mnc` | 只能说明识别到卡，不代表已读 IMSI/运营商信息 |
| 先插卡读到 SubInfo，再做安全部署 | 可能复用历史订阅信息，不能代表冷启动锁卡状态 |
| 需要判断白名单/黑名单 | 应从 modem 锁网结果、锁网配置或解锁流程取证，不应依赖 AP SubInfo MCC/MNC |

## 排查步骤

1. 先确认当前 SIM state：`ABSENT`、`PIN_REQUIRED`、`NETWORK_LOCKED`、`READY`。
2. 若处于 `NETWORK_LOCKED`，不要把 `mcc/mnc` 为空当成 AP 订阅 bug。
3. 查看 RIL/AT 是否有 `+CPIN: PH-NET PIN` 或对应 lock cause。
4. 对白名单/黑名单判断需求，回到 SIMLock NV/配置和 modem 判定结果，而不是等 AP 读完整 SIM 文件。
5. 复测时必须用冷启动/清订阅缓存后的流程，避免历史 SubInfo 干扰。

## 复用边界

该案例只说明锁卡未 READY 状态下无法依赖 SubInfo MCC/MNC；不代表锁网 UI 不需要显示，也不代表 modem 锁网配置一定正确。UI 是否弹出仍要看 AP 是否收到锁网状态。

## 来源

- CQWeb：`SPCSS01329406`

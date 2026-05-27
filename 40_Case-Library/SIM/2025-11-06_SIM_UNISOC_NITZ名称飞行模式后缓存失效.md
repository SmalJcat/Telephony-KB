---
quality: curated
doc_type: case
domain: SIM
rat: LTE
feature: Operator name / NITZ / airplane mode
platform: UNISOC
layer: AP/Framework/Telephony/RIL
symptom: "驻网后状态栏显示 NITZ 下发的运营商名称，开启飞行模式后 DUT 名称失效或回退，对比机仍保留 NITZ 名称"
cause: "飞行模式或网络不可用后，AP 侧运营商名称显示链路重新计算，NITZ 缓存可能被清除或被 SPN/PNN/operator XML fallback 覆盖"
operator: "Smartfren / 51009"
project: "KN3"
chipset: "UMS9230E"
source_log: "CQWeb index SPCSS01575486; related NITZ config cases SPCSS01266529/SPCSS01638776"
first_bad_point: "radio off / out of service 后 updateSpnDisplayLegacy 是否继续使用 s_nitzOperatorInfo 缓存未先确认"
confidence: medium
status: summarized
tags:
  - cqweb
  - sim
  - operator-name
  - nitz
  - airplane-mode
---

# NITZ 名称：飞行模式后缓存失效

## 用户现象

使用 Smartfren SIM 驻网后，状态栏 SIM 卡名称显示网络侧通过 NITZ 下发的名称。开启飞行模式后，DUT 的 NITZ 名称失效或回退；对比机仍显示此前的 NITZ 名称。

## 结论

这类问题的第一坏点不一定在 `numeric_operator.xml` 或 TS.25 数据库。驻网阶段能显示 NITZ 名称，说明网络名称至少到达过 AP/RIL；飞行模式后名称变化，需要看 radio off / out of service 时 AP 是否清理 NITZ 缓存，或者 `updateSpnDisplayLegacy()` 是否重新按 SPN、PNN/OPL、operator XML fallback 计算名称。

如果产品要求飞行模式后继续显示上一次网络侧名称，应把它归到 UI/Telephony 显示策略；如果产品要求网络不可用时不显示旧网络名称，则清理 NITZ 缓存可能是预期行为。

## 关键证据

优先确认驻网阶段是否收到 NITZ 名称：

```text
s_nitzOperatorInfo
operatorNumeric = 51009
NitzStateMachineImpl
```

再确认飞行模式或网络不可用后的显示链路：

```text
handleNetworkUnavailable
updateSpnDisplayLegacy
updateSpnDisplay: radio is off
updateSpnDisplay: radio is on but out of service
rawPlmn
rawSpn
showPlmn
showSpn
```

如果配置要求忽略网络侧名称，还要查：

```text
oem_key_ignore_operator_name_from_net_bool
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| NITZ 是否收到 | 有 `s_nitzOperatorInfo` 才能讨论缓存策略；没有则先回到网络下发或 modem/RIL 上报 |
| radio 状态变化 | 飞行模式、out of service、limited service 会触发名称重新计算 |
| fallback 来源 | 回退后名称来自 SPN、PNN/OPL、NITZ 缓存还是 `numeric_operator.xml` |
| 产品期望 | 明确飞行模式后应保留旧网络名，还是应显示 No service / SIM 名称 |
| 对比机差异 | 对比机保留名称时，重点对比缓存清理和 `updateSpnDisplay` 策略，不要只比较 XML |

## 处理建议

- 先用日志证明 NITZ 是否已收到，不要直接改 PLMN 表。
- 对比飞行模式前后 `rawPlmn/rawSpn/showPlmn/showSpn`，确认最终 UI 名称来源。
- 若需要保留 NITZ 缓存，应在 AP 显示策略中处理 radio off / network unavailable 分支。
- 若配置了忽略 NITZ 的开关，先确认该开关是否按 MCC/MNC 生效，再判断显示差异。

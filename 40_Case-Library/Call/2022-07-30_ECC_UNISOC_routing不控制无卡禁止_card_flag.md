---
quality: curated
doc_type: case
domain: Call
rat: 2G/3G/LTE
feature: ECC / without SIM / card_flag
platform: UNISOC
layer: Framework/Telephony/EmergencyNumberTracker
symptom: "eccdata 中配置 routing=2 后，UGANDA 919 无卡仍可作为紧急号码拨出"
cause: "routing 控制的是有卡/无卡时普通拨号或真紧急拨号方式，不等价于无卡禁止；若要求仅有卡加载，需要增加 card_flag=with_card 之类的卡状态条件"
operator: "UGANDA"
project: "BD1"
chipset: "SC7731E"
source_log: "CQWeb SPCSS01017433"
first_bad_point: "把 routing=2 误理解为 Without SIM 不能拨打"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - ecc
  - without-sim
  - emergency-number
  - card-flag
---

# ECC `routing=2` 不等于无卡禁止

## 用户现象

UGANDA 紧急号码 919 在 `eccdata` 中配置了 `routing=2`，预期无卡不能拨打；实际无卡拨 919 仍按紧急号码拨出。

## 结论

`routing=2` 不是“无卡不能拨打”的开关。该配置控制有卡/无卡时以普通拨号还是真紧急拨号方式下发；紧急号码默认有无卡都可能加载。若需求是“仅插卡时加载该紧急号码”，需要增加卡状态条件，例如 `card_flag=with_card`。

## 关键证据

CQ 沟通结论：

```text
routing 的配置不影响紧急号码无卡状况能否拨打。
routing=2: 有卡时以假紧急下发，无卡时以真紧急下发。
紧急号码除非额外配置，否则有无卡都要能拨打。
解决方向：919 增加 card_flag 配置，使其仅在有卡时加载。
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| 是否识别为 ECC | 先看 `EmergencyNumberTracker` / ECC list 是否加载该号码 |
| routing | 判断拨号路由方式，不要当作无卡禁止开关 |
| card_flag | 判断号码是否受卡状态控制 |
| 平台差异 | Q/R/S 之后路径和类名可能不同，注意 `EmergencyNumberTrackerEx`、`UniEmergencyNumberTracker` 等差异 |

## 处理建议

- 写需求表时把“Without SIM Can Call”单独作为卡状态条件，不要只映射到 routing。
- 修改后必须分别验证插卡、无卡、PIN 未解锁、飞行模式下的识别和拨出行为。
- 无卡禁止类需求要同时验证 UI 是否识别为紧急号码，以及底层拨号是否仍按紧急路径发出。

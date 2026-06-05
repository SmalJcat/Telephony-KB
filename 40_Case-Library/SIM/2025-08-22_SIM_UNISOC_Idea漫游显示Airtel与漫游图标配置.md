---
quality: curated
doc_type: case
domain: SIM
rat: LTE
feature: Operator name / roaming display / CarrierConfig
platform: UNISOC
layer: AP/Framework/CarrierConfig
symptom: "Idea SIM 漫游到 Airtel 网络时不显示漫游图标，但状态栏运营商名仍显示 Airtel"
cause: "non_roaming 配置只解决漫游状态/漫游图标；显示名称仍由 PLMN/PNN/SPN/NITZ/operator XML 和 updateSpnDisplay 规则决定"
operator: "Idea / Airtel"
project: "GH6751"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01545940"
first_bad_point: "updateSpnDisplay 中 simNumeric=405799、operatorNumeric=40492，rawPlmn 从 XML 命中 Airtel，showPlmn=true、showSpn=false"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - operator-name
  - roaming
  - carrierconfig
---

# Idea漫游显示Airtel与漫游图标配置

## 用户现象

印度 Idea SIM 漫游到 Airtel 网络时，客户要求不显示漫游图标，并且状态栏仍显示 Idea。实际表现是不显示漫游图标后，运营商名称仍显示 Airtel。

## 结论

漫游图标和运营商显示名是两条链路。`non_roaming_operator_string_array` 可以把某个 VPLMN 识别为非漫游，从而影响漫游状态和图标；但显示名仍由 `updateSpnDisplay` 的 `spn/plmn/showSpn/showPlmn` 决定。若 `rawPlmn` 从 `numeric_operator.xml` 命中 Airtel 且 `showPlmn=true`，最终仍会显示 Airtel。

## 关键证据

```text
UniOperatorNameHandler: get name from xml: airtel
SST: updateSpnDisplay: rawPlmn = airtel
SST: updateSpnDisplay: rawSpn =
SST: updateSpnDisplay: simNumeric = 405799 operatorNumeric = 40492
SST: updateSpnDisplay: rule=2, showPlmn=true, plmn=airtel, showSpn=false, spn=
```

## 配置判断

| 目标 | 配置/代码 | 注意 |
|---|---|---|
| 不显示漫游图标 | `non_roaming_operator_string_array` | 影响 roaming 判断，不等价于显示名覆盖 |
| 强制显示 SIM 归属名 | `carrier_name_string`、SPN/PNN/OPL、`updateSpnDisplayLegacy()` | 需要让 `showSpn/showPlmn` 与目标显示一致 |
| 修改 VPLMN 名称 | `numeric_operator.xml` 中 `40492=...` | 会影响所有直接使用 40492 SIM 或注册到 40492 的场景，风险高 |
| 判断当前来源 | `UniOperatorNameHandler`、`SST updateSpnDisplay` | 先证明名称来自 XML、NITZ、PNN/OPL 还是 SPN |

## 排查顺序

1. 记录 `simNumeric` 和 `operatorNumeric`，确认是 HPLMN 还是 VPLMN。
2. 看 `Telephony: isRoaming` 是否被 CarrierConfig 覆盖为 false。
3. 搜 `UniOperatorNameHandler: get name from xml`，确认是否从 `numeric_operator.xml` 命中 VPLMN 名称。
4. 搜 `updateSpnDisplay`，确认 `rawPlmn/rawSpn/showPlmn/showSpn`。
5. 如果需求是“漫游到某 VPLMN 仍显示 HPLMN/SPN”，优先改 CarrierConfig/SPN 显示规则，不要直接把 VPLMN 的全局名称改成 HPLMN。

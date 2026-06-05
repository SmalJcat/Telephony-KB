---
quality: curated
doc_type: case
domain: SIM
rat: LTE/3G/GSM
feature: manual network scan / operator name
platform: UNISOC
layer: Framework/Telephony/RIL
symptom: "手动搜网列表中同一张卡不同卡槽显示的运营商名称不一致，部分 PLMN alphaL/alphaS 为空"
cause: "numeric_operator.xml 中 MCC/MNC key 位数与 RIL 上报的 mnc_digit 不匹配，导致 operator XML 未命中"
project: "GH6551L"
chipset: "SC9863A"
source_log: "CQWeb SPCSS01007822"
first_bad_point: "processNetworkName 拼出的 PLMN key 未命中 numeric_operator.xml"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - operator-name
  - manual-search
---

# 手动搜网列表运营商名与 MNC 位数不匹配

## 结论

CQWeb `SPCSS01007822` 的结论是重新配置 `numeric_operator.xml` 后验证通过。该案例的复用价值在于：手动搜网列表显示的运营商名依赖实际上报的 `mcc/mnc/mnc_digit`，XML 中 5 位或 6 位 key 不匹配会导致名称为空、显示 MCC/MNC，或者不同卡槽显示不一致。

## 现象

- 平台：UNISOC SC9863A。
- 场景：同一环境、同一张卡，分别在不同卡槽手动搜网。
- 表现：`manually network search list` 显示的运营商名称不一致，部分 PLMN `alphaL/alphaS` 为空。

## 关键日志

```text
NetworkSelectSettings: CellInfoList display:
{CellType = CellInfoLte, mcc = 334, mnc = 020, alphaL = ..., alphaS = ...}
{CellType = CellInfoLte, mcc = 334, mnc = 140, alphaL = , alphaS = }

processNetworkName get network mcc = ..., mnc = ...
getOperatorName plmn = ...
processNetworkName getOperatorName_err = ...
```

## 判断要点

| 上报值 | XML key 检查 |
|---|---|
| `mcc=334, mnc=020` | 应确认是否配置 `334020`，不要只配 `33420` |
| `mcc=334, mnc=140` | 应确认是否配置 `334140` |
| `alphaL/alphaS` 为空 | 先查 operator XML 是否命中，再查 NITZ/ONS fallback |
| 不同卡槽结果不同 | 先排除配置不完整，再看卡槽缓存、socket、RIL 上报差异 |

## 排查步骤

1. 从 `NetworkSelectSettings` 中取实际搜到的 `mcc/mnc`。
2. 对照 `mnc_digit` 判断 key 是 5 位还是 6 位。
3. 检查 `numeric_operator.xml` 是否存在目标 key。
4. 在 RIL 中补 `processNetworkName` / `getOperatorName` 日志，确认拼出来的 PLMN key。
5. 配置修正后重新验证两个卡槽的手动搜网列表。

## 来源

- CQWeb：`SPCSS01007822`

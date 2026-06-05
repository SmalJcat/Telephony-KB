---
quality: curated
doc_type: case
domain: SIM
rat: LTE/NR
feature: PNN/OPL/EONS / manual network scan name
platform: UNISOC
layer: Framework/Telephony/RIL/SIMRecords
symptom: "Vodafone AU SIM 手动搜网列表中 505-03 显示为 Optus，而期望显示 Vodafone AU R"
cause: "设备未注册 5G 时仍按 EFOPL5G 获取 PNN record number，导致手动搜网名称未按当前 RAT/SIM PNN 规则取值"
operator: "Vodafone AU / Optus AU roaming"
project: "GH6571"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01345931"
first_bad_point: "UniOperatorNameHandler 取 PNN record 时未按当前注册 RAT 区分 EFOPL/EFOPL5G"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - operator-name
  - pnn
  - opl
---

# 手动搜网名称：未注册 5G 时误用 EFOPL5G

## 用户现象

Vodafone AU SIM 手动搜网时，Optus 505-03 应显示为 `Vodafone AU R`，实际显示为 `Optus`。

需求背景：Vodafone AU 和 Optus 有漫游协议，手动搜网列表应遵从 SIM 中 EF PNN/OPL 的 display condition，而不是硬编码 XML 名称。

## 结论

根因在 PNN record number 获取逻辑：DUT 未注册 5G 网络时，不应按 `EFOPL5G` 获取 PNN record。修复方向是未注册 5G 时不从 `EFOPL5G` 取 PNN record number，避免把 5G OPL 规则误用于当前搜网结果。

## 关键证据

```text
Root cause:
DUT not register 5G network, but get pnn according to EFOPL5G file.

Change:
Not get pnn record number from EFOPL5G if DUT not register 5G.

异常路径:
RIL match plmn: 50502, longName: Optus, shortName: Optus
UNSOL_NETWORK_SCAN_RESULT ... mAlphaLong=Optus

期望路径:
UniOperatorNameHandler: getPnn return Vodafone AU R
UNSOL_NETWORK_SCAN_RESULT ... mAlphaLong=Vodafone AU R
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| SIM 文件 | 是否有 EF_PNN、EF_OPL、EFOPL5G，record number 是否从 1 开始 |
| 当前 RAT | 未注册 5G 时不要套用 5G OPL 规则 |
| 手动搜网结果 | 看 `UNSOL_NETWORK_SCAN_RESULT` 的 `mAlphaLong/mAlphaShort` |
| ROM fallback | 若 PNN/OPL 未命中，才看 `spn-conf`/operator XML 名称 |

## 处理建议

- 手动搜网名称问题要同时抓 SIM PNN/OPL 读取 log 和 RIL scan result。
- 不要只修改 `spn-conf.xml` 或硬编码运营商名；先确认 SIM EONS 规则是否应优先。
- 5G PNN/OPL 与 LTE/3G/2G OPL 的适用条件需要按当前注册/搜网 RAT 区分。

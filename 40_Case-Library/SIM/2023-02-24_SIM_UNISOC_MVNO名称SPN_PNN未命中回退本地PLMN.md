---
quality: curated
doc_type: case
domain: SIM
rat: LTE/3G/GSM
feature: MVNO operator name / SPN / PNN
platform: UNISOC
layer: Modem/MMI phone / Framework operator display
symptom: "Lebara MVNO 卡状态栏和网络列表显示 Vodafone AU，客户期望显示 Lebara"
cause: "SIM 无可用 SPN，PNN/OPL 未命中，平台按协议回退到本地存储的 PLMN 名称"
operator: "Lebara / Vodafone AU"
project: "GX2421"
chipset: "UMS9117"
source_log: "CQWeb SPCSS01124358"
first_bad_point: "GetNetworkNameString 中 spn_len、pnn_len、ons_len、opn_len 均为 0"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - mvno
  - operator-name
---

# MVNO 名称 SPN/PNN 未命中回退本地 PLMN

## 结论

CQWeb `SPCSS01124358` 的结论是：当前 Lebara 测试卡没有 SPN，PNN 未命中，所以按协议显示本地存储的 PLMN 名称。平台没有通用接口直接判断“是否虚拟运营商”；APN 中的 `MVNO Type` / `MVNO Value` 是 APN 匹配条件，不等价于全局 MVNO 名称显示规则。

## 现象

- 平台：UNISOC UMS9117。
- 场景：澳大利亚 Vodafone 网络下使用 Lebara 虚拟运营商卡。
- 表现：状态栏/网络列表显示 `vodafone AU`，客户期望显示 `Lebara`。

## 关键日志

```text
GetNetworkNameString ... is_spn_support = 0, spn_len = 0
GetNetworkNameString ... pnn_len = 0, ons_len = 0, opn_len = 0
SelectOPNString ... pnn_len = 0, ons_len = 0, opn_len = 0
MMIAPIBT_SetOperatorName name <vodafone AU>
```

## 判断要点

| 证据 | 判断 |
|---|---|
| `is_spn_support=0` / `spn_len=0` | SIM 未提供可用 SPN |
| `pnn_len=0` / `ons_len=0` / `opn_len=0` | EONS/ONS 未命中 |
| 最终 `SetOperatorName` 为本地 PLMN | 走 ROM / 本地 PLMN fallback |
| APN 有 `MVNO Type/Value` | 只能说明 APN 匹配条件，不代表 UI 名称应强制使用 MVNO 名 |

## 处理方向

1. 向运营商确认 MVNO 名称识别条件：MCC/MNC、IMSI range、GID、SPN、PNN/OPL 或其他规则。
2. 如果 SIM 文件没有提供 SPN/PNN，不能仅凭“这是 MVNO 卡”要求平台自动显示 MVNO 品牌。
3. 如果项目要强制区分，需要在客户定制逻辑中明确匹配条件和显示优先级。
4. 手动搜网列表和状态栏名称要分别验证，因为一个来自 network scan 结果，一个来自注册后显示规则。

## 来源

- CQWeb：`SPCSS01124358`

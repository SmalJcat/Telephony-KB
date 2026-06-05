---
quality: curated
doc_type: case
domain: Signal
rat: LTE/3G/2G
feature: RF front-end / cell search
platform: UNISOC
layer: Modem/RF/L1
symptom: "插卡无信号，手动选网找不到任何网络"
cause: "LTE cell select fail 后连续 PLMN_SEL_FAILURE_IND，分析指向前端射频能量较低；应优先按 RF 接收链路/天线/校准补证"
project: "P662L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01363092 search summary"
first_bad_point: "MSG_ID_LTEAS_CELL_SELECT_CNF status=0x3 后上报 PLMN_SEL_FAILURE_IND"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - signal
  - rf
  - plmn-selection
---

# 搜网失败：前端射频能量低样例

## 用户现象

售后客诉插卡无信号，手机找不到任何网络，手动选网失败。

## 当前结论

log 中 LTE 小区选择失败后上报 PLMN selection failure，分析方向为前端射频能量较低。该 case 不能只按“注册失败”处理，因为首坏点发生在可驻留小区搜索/接收阶段，早于 NAS attach reject。

该 case 的复用价值是：插卡无信号、手动搜网也找不到网络时，先把“网络拒绝”和“RF 接收链路搜不到小区”分开。

## 关键证据

```text
10:42:49.663 MSG_ID_LTEAS_CELL_SELECT_CNF status = 0x3
10:42:49.664 MSG_ID_RR_PLM_PLMN_SEL_FAILURE_IND
10:42:50.362 MSG_ID_RR_PLM_PLMN_SEL_FAILURE_IND
结论摘要：前端射频能量较低
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| `CELL_SELECT_CNF status=0x3` | 继续看 L1/RF 测量，不要只停在 PLMN failure |
| 手动选网失败 | 如果完全找不到网，RF/天线/校准优先级高 |
| 对比机 | 同卡同位置对比，确认不是覆盖问题 |
| 工具 | 可结合 Logel/射频工具看测量值、RSSI、前端器件状态 |

## 定位口径

| 判断点 | 结论 |
|---|---|
| 所有 RAT 都搜不到 | RF/天线/校准/RFFE 优先级高于 AP/RIL |
| 手动搜网无列表 | 优先看 L1/RF 测量，不先查 APN 或 IMS |
| `PLMN_SEL_FAILURE_IND` 之前有 cell select fail | 失败点在小区搜索，不是网络侧 reject |
| 对比机同地可搜网 | 优先查单机硬件、天线连接、RF 校准/NV |
| 对比机也搜不到 | 先判断现场覆盖/屏蔽环境 |

## 补证要求

| 证据 | 用途 |
|---|---|
| 同卡同地点 REF 对比 | 排除现场覆盖 |
| LTE/3G/2G 搜网全流程 modem log | 判断是否全 RAT 失败 |
| RSSI/RSRP/RSRQ/SINR 或 RSCP/ECN0 | 判断接收能量 |
| 校准 CRC / RF NV / RFFE 在位 | 判断 RF 前端和校准 |
| 天线、弹片、同轴线、PA/RFIC 检查 | 判断单机硬件 |

## 处理建议

- 对“搜不到任何网络”的 case，先分清是网络拒绝、无 suitable cell，还是 RF 前端能量低。
- 若同环境对比机可搜到网络，优先检查天线、RF 前端、校准/NV 和单机硬件状态。

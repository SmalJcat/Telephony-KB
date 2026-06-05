---
quality: curated
doc_type: case
domain: Registration
rat: LTE/3G/2G
feature: all-RAT search / RF receive path
platform: UNISOC
layer: Modem/RF/L1
symptom: "赞比亚售后单机双卡无信号，重启和飞行模式后仍无法驻网"
cause: "测试机主辅接收 RSSI 长时间掉底，导致所有制式搜网失败；优先怀疑天线扣线、接收链路或 RFFE/PA/RFIC 在位问题"
operator: "Zambia field issue"
project: "KN3"
chipset: "UMS9230E"
source_log: "CQWeb SPCSS01643005"
first_bad_point: "ASM select cell 后 LTE/3G/GPRS 搜网均失败，RSSI 主辅通路持续异常低"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - registration
  - no-service
  - rf
  - all-rat-search
---

# 赞比亚双卡全制式无信号：RF 接收掉底

## 用户现象

赞比亚售后反馈单机双卡无信号。视频显示测试机开关飞行模式、重启后始终搜网无信号，对比机搜网正常。

## 结论

第一坏点不在 SIM、AP ServiceState 或运营商配置，而是 RF 接收链路：log 中主辅接收 RSSI 始终处于掉底状态，导致 LTE/3G/2G 全制式无法驻网。

## 关键证据

```text
MSG_ID_CMD_ASM_SELECT_CELL_REQUEST
MSG_ID_LTE_CPHY_BAND_SWEEP_REQ
MSG_ID_PLM_AS_3G_PLMN_SEL_REQ
MSG_ID_PLM_AS_GPRS_PLMN_SEL_REQ
MSG_ID_LTEAS_CELL_SELECT_CNF

RSSI:
D334 0140 / 320
D335 0144 / 324
D334 013D / 317
D335 00FA / 250
```

CQ 沟通结论：测试机主辅接收 RSSI 始终掉底，导致所有制式无法驻网。

## 排查要点

| 检查项 | 判断 |
|---|---|
| 是否所有 RAT 都失败 | LTE/3G/2G 都失败时，优先怀疑 RF/天线/校准，不要只追 NAS |
| RSSI 是否掉底 | 主辅通路长期异常低，比 reject cause 更靠前 |
| 对比机 | 同卡同地对比机正常，增强单机硬件/RF 链路嫌疑 |
| 飞行模式/重启 | 重启和飞行模式都不恢复，说明不是一次性状态机卡死的概率更高 |

## 处理建议

- 先拆机确认天线扣线、天线弹片、射频链路装配是否异常。
- 若装配无异常，再用 Pandora/射频工具读取 TXM、PA、RFIC/RFFE 是否在位。
- 注册日志中只看到 `PLMN_SEL_REQ` 和 `CELL_SELECT_CNF` 不够，需要同步看 L1/RF 测量值和 RSSI 轨迹。

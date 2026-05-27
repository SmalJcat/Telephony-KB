---
quality: curated
doc_type: case
domain: SIM
rat: LTE/NR
feature: VSIM / physical SIM recovery
platform: UNISOC
layer: Framework/Telephony/VSIM/SIM
symptom: "VSIM 退出后物理 SIM 卡不显示，重启后恢复"
cause: "VSIM 退出时设置模式失败，物理卡槽未恢复到正确显示/可用状态"
project: "A665L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01257378 search summary"
first_bad_point: "ATCI_VSIM: vsim_set_nv 返回 CME ERROR，随后物理卡未显示"
confidence: high
status: summarized
tags:
  - cqweb
  - sim
  - vsim
  - slot
---

# VSIM 退出后物理卡不显示

## 用户现象

双卡场景下，断开 VSIM 后物理卡不显示，重启后可以恢复。

## 结论

分析指向 VSIM 退出流程：退出 VSIM 时设置模式失败，导致物理卡没有重新显示出来。第一坏点不是 SIM ATR，也不是卡座硬件，而是 VSIM 模式切回物理卡时 NV/模式切换命令失败，后续 slot mapping 和 AP 卡状态没有恢复。

## 关键证据

```text
CQWeb SPCSS01257378:
vsim 退出的时候设置模式失败，导致物理卡没有显示出来。

ATCI_VSIM:
vsim_set_nv resp:+CME ERROR
```

## 排查路径

| 步骤 | 检查项 |
|---|---|
| 1 | 记录 VSIM 连接、占用卡槽、断开 VSIM 的完整时间线 |
| 2 | 查 `ATCI_VSIM` / `vsim_set_nv` 返回值 |
| 3 | 查 slot mapping 是否恢复到物理卡 |
| 4 | 查 `GET_SIM_STATUS` 中 `CARDSTATE`、`APPTYPE`、ICCID 是否恢复 |
| 5 | 重启恢复时，对比冷启动的 slot 初始化流程 |

## 定位口径

| 判断点 | 结论 |
|---|---|
| 重启后物理卡恢复 | 说明硬件卡座/卡片大概率不是首坏点 |
| `vsim_set_nv resp:+CME ERROR` | 优先查 VSIM 退出时的 NV/模式切换命令 |
| `GET_SIM_STATUS` 无物理卡 | 继续查 slot mapping 是否被 VSIM 状态占用 |
| 只有断开 VSIM 后复现 | 不按普通热插拔 / No ATR 模板直接处理 |
| AP 与 modem 状态不一致 | 对齐 ATCI、RIL `SIM_STATUS`、UiccController 和 SubscriptionInfo |

## 处理建议

- 遇到 VSIM 退出后不识卡，不要直接按硬件/ATR 问题处理。
- 先确认 VSIM 模式是否成功退出，以及物理 slot 是否重新上报。
- 如果 `vsim_set_nv` 返回错误，需要继续查 NV/模式切换命令链路和失败后的恢复策略。

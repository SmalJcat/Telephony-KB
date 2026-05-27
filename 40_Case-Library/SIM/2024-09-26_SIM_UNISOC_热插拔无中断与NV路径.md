---
quality: curated
doc_type: case
domain: SIM
rat: LTE/NR
feature: SIM hot plug
platform: UNISOC
layer: SIM/Modem/NV/HW
symptom: "插卡开机不识卡，热插拔 SIM 后仍不识别"
cause: "热插拔时间点 modem log 未看到 SIM 中断/plug-in 流程，优先指向热插拔 NV 未生效、GPIO/中断触发或硬件设计问题；同时需先排除 modem assert 干扰"
operator:
project: "CC51"
chipset: "UMS9620"
source_log: "CQWeb SPCSS01407737"
first_bad_point: "热插拔时间点 modem log 未出现 SIM interrupt / plug-in 相关流程"
confidence: medium
status: summarized
tags:
  - cqweb
  - sim
  - hotplug
  - nv
---

# SIM 热插拔无中断：先确认 NV 路径和硬件触发

## 用户现象

插入 SIM 开机后不识卡，拔出再插入新卡仍不识别。客户尝试配置 `sim_hot_pulg` 为 `0x3` 或 `0x303`，现象未改善。

## 结论

该 CQ 未完全闭环，超时关闭；但其中有两个可沉淀的排查点：

1. SIM 热插拔配置的 NV 路径应检查 `cust_nvitem/ProductionParam/sim_hot_plug_cfg`。
2. 从 modem log 看不到 SIM 卡中断日志时，应先查硬件热插拔设计、GPIO/中断触发和 SIM 配置，而不是直接改 AP 订阅逻辑。

同时，记录中还出现过 modem assert。平台建议先回退本身改动，保证 modem 不 assert，再继续调试 SIM 热插拔。

## 关键证据

```text
现象:
插入 sim 卡开机 -> 不识卡
热插拔 sim 卡 -> 不识别

平台反馈:
modem log 看不到 SIM 卡中断日志
SIM 热插拔配置 NV 路径:
cust_nvitem/ProductionParam/sim_hot_plug_cfg
```

相关 assert 需要单独处理：

```text
HAL:ASSERT:RFIC:V1
GenerateValidPath LTE band 42 2RX no valid Path
```

## 排查路径

| 步骤 | 检查项 | 判断 |
|---|---|---|
| 1 | modem 是否稳定 | 有 assert 先处理 assert，避免干扰 SIM 流程 |
| 2 | 热插拔 NV 路径 | 确认写入 `cust_nvitem/ProductionParam/sim_hot_plug_cfg` |
| 3 | 插拔时间点 log | 查 SIM interrupt / plug in / plug out |
| 4 | 硬件触发 | 查卡座 detect、电平极性、防抖、GPIO mux |
| 5 | SIM 上电 | 查 VSIM/RST/CLK/IO 和 ATR |

## 处理建议

- 如果插拔时间点完全没有 SIM 中断日志，优先按硬件触发或 NV 生效问题处理。
- 如果有插拔中断但无 ATR，再转入卡接触、卡座、电气波形排查。
- 如果 ATR 正常但 AP 不更新，再进入 `UiccController`、`SubscriptionInfoUpdater`、slot mapping 链路。

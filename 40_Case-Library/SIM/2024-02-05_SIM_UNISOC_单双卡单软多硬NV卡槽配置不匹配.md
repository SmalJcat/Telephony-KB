---
quality: curated
doc_type: case
domain: SIM
rat: LTE/NR
feature: single/dual SIM SKU / slot mapping / NV
platform: UNISOC
layer: Modem/NV/SIM
symptom: "单双卡单软多硬项目中，仅支持单卡的设备不识卡"
cause: "历史项目 SIM 接反，当前项目未接反，但仍沿用旧 NV 配置，导致 singlesim SKU 的卡槽映射与硬件不一致"
project: "GH6691"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01287405"
first_bad_point: "ro.boot.product.hardware.sku=singlesim，但 NV 卡槽配置仍按旧接反项目处理"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - nv
  - slot-mapping
  - singlesim
---

# 单双卡单软多硬：NV 卡槽配置不匹配导致不识卡

## 用户现象

客户希望减少版本树，实现单双卡单软件多硬件。单卡设备使用 SIM2，合入对应 patch 后，仅支持单卡的设备不识卡。

设备属性：

```text
adb shell getprop | grep ro.boot.product.hardware.sku
[ro.boot.product.hardware.sku]: [singlesim]
```

## 结论

根因不是 SIM 卡本身，也不是 ATR 阶段硬件必然异常，而是项目历史配置继承错误：之前项目 SIM 接反，当前项目未接反，但 NV 仍按旧项目配置，导致单卡设备卡槽映射不符合当前硬件。

## 排查要点

| 检查项 | 判断 |
|---|---|
| SKU | `ro.boot.product.hardware.sku` 是否为 `singlesim` / `dualsim` |
| 单卡用哪个物理槽 | 确认硬件设计是 SIM1 还是 SIM2 |
| NV 卡槽配置 | 是否沿用了旧项目接反配置 |
| patch 行为 | patch 是否只处理 AP SKU，未同步 modem/NV slot mapping |

## 处理建议

- 单软多硬项目要把 AP SKU、硬件卡槽、modem NV 三者放在同一张表里校验。
- 对历史项目复用时，重点检查“SIM 接反”这类硬件差异是否仍存在。
- 不识卡问题若只在 singlesim SKU 复现，应优先查 slot mapping/NV，而不是直接判 SIM 驱动。

---
quality: curated
doc_type: case
domain: Stability
rat: 2G/3G/LTE
feature: A/B OTA / fixnv / nvmerge / IMEI
platform: UNISOC
layer: update_engine / postinstall / NV partition
symptom: "A/B OTA 过程中在 nvmerge 前中断，再刷机可能引入 fixnv 个体化参数丢失风险"
cause: "目标 slot 的 fixnv 已被 OTA 写入，但 postinstall 阶段 nvmerge 尚未执行，目标 slot fixnv 还未合并原机参数"
project: "GH6311"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01234705"
first_bad_point: "update_engine 写入 l_fixnv1/l_fixnv2 后，在 Running /postinstall/bin/nvmerge 之前被打断"
confidence: high
status: summarized
tags:
  - cqweb
  - stability
  - ota
  - fixnv
  - nvmerge
  - imei
---

# A/B OTA 在 nvmerge 前中断的 fixnv 风险

## 用户现象

客户询问 A/B OTA 场景中，系统从 A slot 升级到 B slot 后，再从 B slot 升级到 A slot。如果在目标 slot 的 `fixnv` 合并前使用 ResearchDownload 或 DeviceKit 刷机，是否可能导致 IMEI 丢失。

## 结论

关键窗口不在“提示重启”之后，而在 `update_engine` 已经把 `l_fixnv1/l_fixnv2` 写入目标 slot、但 `postinstall` 里的 `nvmerge` 尚未开始前。此时目标 slot 的 fixnv 还不是完成个体化合并后的有效数据，如果在这个窗口掉电、强制关机或切到刷机流程，需要按 fixnv 风险处理。

## 关键日志

fixnv 分区被 OTA 写入：

```text
update_engine: Applying 1 operations to partition "l_fixnv1"
update_engine: Applying 1 operations to partition "l_fixnv2"
update_engine: Hash of l_fixnv1: ...
update_engine: Hash of l_fixnv2: ...
```

`nvmerge` 开始执行：

```text
update_engine: Running "/postinstall/bin/nvmerge 1 3"
```

如果要复现或验证，应在两段日志之间的 `postinstall` 前窗口中断；若已经提示重启，通常说明 `nvmerge` 已完成，风险点不在同一个阶段。

## 排查要点

| 检查项 | 判断 |
|---|---|
| 当前 slot / 目标 slot | 确认是否经历 A->B->A 或 B->A->B 的连续升级 |
| `update_engine` 日志 | 查 `Applying ... l_fixnv1/l_fixnv2` 和 `Running "/postinstall/bin/nvmerge ..."` 的相对顺序 |
| 中断时间 | 掉电/关机/刷机是否发生在 `nvmerge` 之前 |
| 刷机动作 | 是否在 OTA 未完成时接入 ResearchDownload、DeviceKit 或其他线刷流程 |
| 现场证据 | 回读目标 slot fixnv 主备分区，验证 IMEI/校准 NV 是否合并完成 |

## 处理建议

- OTA/FOTA 问题不要只看最终是否提示重启；必须保留完整 `update_engine` 日志。
- 测试 A/B OTA 中断时，明确中断点：fixnv 写入前、fixnv 写入后但 nvmerge 前、nvmerge 后。
- 如果现场已经进入异常窗口，先回读 fixnv 主备分区，再决定是否恢复原机参数或重新走完整升级。
- 客户现场流程避免在 OTA postinstall 未完成时接入线刷工具；必须做异常断电测试时，单独建立用例和证据包。

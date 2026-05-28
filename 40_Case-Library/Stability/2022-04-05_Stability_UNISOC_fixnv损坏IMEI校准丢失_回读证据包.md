---
quality: curated
doc_type: case
domain: Stability
rat: 2G/3G/LTE
feature: fixnv / IMEI / calibration data
platform: UNISOC
layer: NV / Download tool / Field return
symptom: "售后多台机器 IMEI 丢失，校准参数丢失，怀疑 fixnv 损坏"
cause: "仅靠 bugreport 无法确认 fixnv 是否损坏，需要回读 fixnv 主备分区做数据状态判断"
project: "GH6511W"
chipset: "SC7731E"
source_log: "CQWeb SPCSS00977064"
first_bad_point: "IMEI 回到展锐原始值、工模校准参数丢失，但缺少 fixnv 分区回读证据"
confidence: medium
status: summarized_with_log_gap
tags:
  - cqweb
  - stability
  - fixnv
  - imei
  - calibration
---

# fixnv 损坏怀疑：必须回读主备分区

## 用户现象

售后多台故障机 IMEI 丢失，显示为展锐原始 `86xxx` 值；工模下校准参数也丢失，怀疑 `fixnv` 损坏。

## 结论

这类问题不能只靠 bugreport 定性。需要使用 ResearchDownload 等工具回读手机中的 fixnv 主备分区，再判断 NV 数据状态。

## 最小证据包

CQ 要求回读并提供：

```text
l_fixnv1_a  0x100000  d:\fixnv1_a.bin
l_fixnv1_b  0x100000  d:\fixnv1_b.bin
l_fixnv2_a  0x100000  d:\fixnv2_a.bin
l_fixnv2_b  0x100000  d:\fixnv2_b.bin
```

## 下次复现补证清单

| 证据 | 目的 |
|---|---|
| 异常机完整 bugreport、radio log、工模截图 | 确认 IMEI 默认值、校准项丢失和 AP 侧可见现象 |
| `l_fixnv1_a/b`、`l_fixnv2_a/b` 主备分区回读 | 判断主备 fixnv 是否为空、错版本、校验失败或被覆盖 |
| 同批正常机 fixnv 主备分区回读 | 区分个体损坏、批量刷机流程问题和版本结构差异 |
| ResearchDownload / FactoryDownload 操作记录 | 确认是否执行过 format、erase、重分区、强制写入 fixnv |
| 升级前后 PAC、分区表和 NV merge 相关产物 | 判断是否存在刷机脚本或 OTA 流程覆盖个体化参数 |
| 掉电、返修、重刷、写号时间线 | 还原 fixnv 损坏发生在产线、升级、售后还是用户现场 |

判定口径：只有 bugreport 或 IMEI 截图时，最多判为“NV/产物链路可疑”；拿到主备 fixnv 回读并能与正常机或升级前备份对比后，才能升级为 `summarized` 或 `closed`。

## 排查要点

| 检查项 | 判断 |
|---|---|
| IMEI 是否默认值 | 默认值只说明 NV/产线参数未正确保留，不等价于已证明 fixnv 坏 |
| 校准参数 | 工模校准参数丢失时，fixnv/产线参数优先级高 |
| 主备分区 | 必须同时看 `fixnv1/fixnv2` 和 A/B 分区 |
| 批量性 | 多台售后出现时，需要追刷机、升级、掉电、存储和产线写参流程 |

## 处理建议

- 现场先保留异常机，不要直接格式化或重刷覆盖证据。
- 回读主备 fixnv 后再决定是数据恢复、刷机流程修正还是存储/掉电稳定性排查。
- 这类问题和“不识卡/无信号/紧急号码失败”可能是同一个 NV 根因的连带表现。

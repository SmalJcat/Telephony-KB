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
status: evidence_requirement
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

---
quality: curated
doc_type: case
domain: Stability
rat: 3G/LTE
feature: RF calibration NV / WSRCH assert / IMEI lost
platform: UNISOC
layer: Modem/RF/NV
symptom: "售后机无信号、IMEI null，RIL 反复提示 Modem is not alive"
cause: "modem dump 显示 WSRCH 读取 WCDMA calibration NV 时索引越界，现场判断疑似校准 NV 被擦除或 NV 分区损坏"
project: "A665L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01379783"
first_bad_point: "Modem Assert WSRCH Task in drv_rf_nv_comanche_calibration_wcdma_iram.c while read rssi"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - stability
  - nv
  - calibration
  - modem-assert
---

# 售后 IMEI 丢失与 WSRCH 校准 NV 损坏

## 现象

售后反馈设备突然无信号，检测发现 `IMEI null`。AP log 中反复出现：

```text
RIL: Modem is not alive, return radio_not_avaliable
```

modem log 中已有 `md_memory_*.mem`，说明不是单纯 AP 状态同步问题，需要继续看 modem assert。

## 结论

该类问题的第一坏点在 modem/RF/NV 侧。CQWeb `SPCSS01379783` 中的 dump 显示 WSRCH 任务在读取 WCDMA calibration NV 时索引越界，历史沟通判断“像是校准 NV 被擦除”。后续售后导出 NV 和回读 NV 分区均失败，进一步指向 NV 分区或硬件损坏。

## 关键日志

```text
Modem Assert WSRCH Task in file drv_rf_nv_comanche_calibration_wcdma_iram.c
line 512
exp=again < COMANCHE_NV_WCDMA_XDSP_RX_NUM_TBL_ENTRIES
info=[when read rssi, Again_index:... exceed XDSP_RX_NUM_TBL_ENTRIES:25]
```

## 排查步骤

1. 先确认是否有 `md_memory_*.mem` 或 full dump，不能只看 AP `radio_not_available`。
2. 从 assert info 判断任务、文件名和表达式；看到 `drv_rf_nv_*calibration*` 时优先查校准 NV。
3. 导出 running NV；如果失败，继续回读 NV/fixnv 分区。
4. 若 NVTool 导出和分区回读都失败，记录为 NV 分区/硬件疑似损坏，不要继续按普通不识卡问题排查。
5. 保留工模 IMEI、校准参数状态、modem dump、NV 导出错误和分区回读结果。

## 复用边界

这个案例适合判断“IMEI 丢失 + modem assert + RF calibration 文件名”的售后故障。它不能替代硬件检测，最终是否硬件损坏要结合分区回读和售后检测结果。

## 来源

- CQWeb：`SPCSS01379783`

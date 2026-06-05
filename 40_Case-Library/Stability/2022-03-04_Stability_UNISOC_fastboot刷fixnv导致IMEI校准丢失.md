---
quality: curated
doc_type: case
domain: Stability
rat: 2G/3G/LTE/NR
feature: fastboot / fixnv / IMEI / calibration data
platform: UNISOC
layer: Bootloader fastboot / NV partition / Field flashing
symptom: "fastboot 直接刷 l_fixnv1_a 或 w_fixnv1_a 后，IMEI、校准参数等丢失"
cause: "原生 fastboot flash 对 fixnv 分区不做 NV backup/merge，直接写入 base/customer nvitem 会覆盖现场参数"
project: "GH6551W / GH6581"
chipset: "SC7731E / UMS9230"
source_log: "CQWeb SPCSS00766912 / SPCSS00967511"
first_bad_point: "fastboot flash fixnv 分区前未备份并合并原机 IMEI/校准 NV"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - stability
  - fastboot
  - fixnv
  - imei
  - calibration
---

# fastboot 刷 fixnv 导致 IMEI/校准参数丢失

## 用户现象

客户使用 fastboot 直接更新 fixnv 分区后，IMEI 和校准参数丢失。历史 CQ 中出现过两类命令：

```text
fastboot flash w_fixnv1_a pike2_pubcp_PLD_base_nv_nvitem.bin
fastboot flash l_fixnv1_a qogirl6_pubcp_customer_nvitem.bin
```

## 结论

第一坏点不在 RIL 或业务层，而在刷机动作：原生 fastboot 写 fixnv 时没有自动备份并合并原机 NV。把 base/customer `nvitem.bin` 直接写入现场机 fixnv 分区，会覆盖原机 IMEI、RF 校准等产线参数。

历史处理方向是提供 fastboot 支持 NV backup/merge 的 sample code / patch；若项目已经量产或风险较高，应申请正式 patch 或正式版本。

## 关键证据

| 证据 | 判断 |
|---|---|
| 复现命令 | `fastboot flash l_fixnv1_a/w_fixnv1_a ...nvitem.bin` |
| 复现结果 | 写入后 IMEI、校准参数丢失 |
| RootCause | 当前平台 fastboot flash 不支持 NV 备份 |
| Patch 方向 | 在 fastboot 写 NV 镜像时支持 backup flag、NV merge，并同步写主备分区 |

## 排查要点

1. 先确认是否执行过 `fastboot flash *fixnv*`，尤其是 `l_fixnv1_a`、`w_fixnv1_a`。
2. 对比刷入文件是否为 base/customer `nvitem.bin`，而不是从同一台机器备份出来的完整 fixnv 镜像。
3. 现场机不要继续格式化或重刷，先回读 `fixnv1/fixnv2` 主备分区。
4. 查看 bootloader/fastboot 是否已有 `backupnv` 或 NV merge 相关 patch。
5. 如果只是业务侧看到不识卡、IMEI null、无信号，先追刷机动作和 fixnv 状态，不要直接按 SIM/RF 独立问题处理。

## 处理建议

- 现场恢复优先使用原机备份、产线参数恢复或正式售后工具链，不要把公共 base nvitem 当成现场 fixnv 备份。
- 量产/售后流程如果必须使用 fastboot 刷 fixnv，需要先集成并验证 NV backup/merge patch。
- 更推荐使用 OTA 或下载工具完成带参数保留能力的刷机流程；fastboot 只适合明确不会覆盖个体化参数的分区或已做完整保护的流程。
- 问题归档时同时记录刷机命令、刷入文件来源、fastboot 版本、是否支持 `backupnv`、刷前/刷后 fixnv 回读结果。

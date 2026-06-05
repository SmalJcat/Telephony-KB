---
doc_type: index
domain: Stability
rat: Mixed
feature: NVRAM / modem image / RF parameter
platform: MTK/Mixed
layer: Modem/NVRAM/BSP/Product
symptom: 写码、升级、IMEI unknown、Meta 连接或 modem EE / assert
cause: NVRAM/SML LID、加密宏控、modem image、RF parameter 或硬件版本链路不一致
source_log: Old Outline SIM import consolidation
first_bad_point: AP 侧 SIM/IMEI/META 表象之前，先出现 modem/NVRAM/产物链路不一致
confidence: high
search_tier: main_entry
status: active
quality: curated
---

# NVRAM与产物链路问题索引

## 阅读入口

这篇把旧 SIM 导入区里的“写码 / 升级 / IMEI unknown / Meta 连接 / Modem Assert”合并成 Stability 视角。它们的共同点不是 SIM 卡异常，而是 NVRAM、SML、RF parameter、modem image 或产物链路不一致。

## 快速分组

| 场景 | 首坏点 | Case |
|---|---|---|
| 有锁网升级无锁网 modem assert | MTK NVRAM/SML 保护机制，`0x0000ef11` | [[Imported_SIM_03_WM58从有锁网升级下载到无锁网_Modem_Assert]] |
| Mini 写 IMEI 后升级 CU，IMEI 不显示 | `NVRAM_BIND_TO_CHIP_CIPHER` 宏控不一致导致 NV 解密失败 | [[Imported_SIM_06_civic项目BSP生成的Mini软件使用MBW开发的工具写入IMEI后_升级到CU软件_IMEI无法显示]] |
| Mini 校准写码后刷 CU modem EE | SML LID size mismatch，`para1=0x644` / `para2=0xa28` | [[Imported_SIM_07_civic项目_试产前_内部发现Mini软件校准写码后_使用flashtool下载CU软件_modem出现EE]] |
| CU 刷回 Mini，IMEI unknown | SML file 丢失或被注释，证据需补齐 | [[Imported_SIM_08_civic项目_CU刷回Mini软件_IMEI显示unknown]] |
| 升级后 IMEI unknown | `custom_modem` 配置错误，机器中 modem 不是当前编译产物 | [[Imported_SIM_09_Civic_Plus_VK7L版本升级Vk1J版本后_IMEI显示unknown]] |
| E 配置机器 META 无法连接 | `custom_nvram_extra.c` SML data 为空 | [[Imported_SIM_10_Model3_Proto试产_出现E配置机器meta无法连接]] |
| 音频无声及卡 logo 问题 | `nvram_main.c` EF31 LID 类 assert，缺少最终 root cause | [[Imported_SIM_11_Model3_生产_出现音频无声及卡logo问题]] |
| OTA 跨版本 modem assert | `RF_PARA_CUSTOM` 宏用错，加载错误 RF parameter | [[Imported_SIM_13_WM58_OTA跨版本升级_出现Modem_Assert]] |
| NUU 单机 modem assert | 硬件频段组合与软件/RF 参数不匹配，未做单软多硬 | [[Imported_SIM_15_NUU单机出现Modem_Assert]] |

## 统一排查顺序

1. 先确认是否有 modem EE / assert dump，不要只看 IMEI unknown、SIM 不识别或 META 连接失败。
2. 看 assert 文件和参数：`nvram_main.c`、`custom_nvram_extra.c`、`el1d_rf_error_check.c` 分别指向 NV/SML、SML 数据、RF 参数/频段。
3. 对比写码版本、最终版本、升级版本的 modem image、LID size、LID verno、加密宏控和 RF parameter。
4. 核对机器中的实际 modem image：`md1img` build 时间戳必须和编译产物一致。
5. 已校准机器处理前先备份 RF / IMEI / NVRAM / NVDATA，避免格式化导致个体化参数丢失。

## 结论模板

```text
该问题不是 SIM 卡状态异常。AP 侧看到 IMEI unknown / META 无法连接 / 不识卡只是结果。
第一坏点在 modem/NV 产物链路：xxx。
需要补齐：modem assert dump、目标版本和来源版本的 LID/NV/RF 参数对比、机器实际 modem image 时间戳、修复后复测。
```

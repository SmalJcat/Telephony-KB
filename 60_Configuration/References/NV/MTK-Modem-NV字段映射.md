---
doc_type: reference
domain: Configuration
status: active
quality: generated
platform: MTK
layer: Modem NV
mapping_type: NV parameter mapping index
generated_on: 2026-05-27
---

# MTK Modem NV字段映射

本文档只作为 MTK modem NV 参数映射入口，目标是支持“运营商需求 -> NV/LID/字段”的快速定位；不放 SBP 统计、OTA 文件索引、代码结构说明。

## 映射表入口

| 需求类型                                     | 映射表                                         | 字段数 |
| ---------------------------------------- | ------------------------------------------- | --: |
| IMS/VoLTE/VoWiFi/SIP/SDP/codec/emergency | [MTK-IMS-NV字段映射](MTK-IMS-NV字段映射.md)         | 575 |
| UT/XCAP/补充业务                             | [MTK-UT-XCAP-NV字段映射](MTK-UT-XCAP-NV字段映射.md) |  48 |
| 网络选择/LTE能力/NAS/C2K/UMTS/RF能力             | [MTK-网络能力-NV字段映射](MTK-网络能力-NV字段映射.md)       | 516 |

## 使用口径

1. 先按需求关键词在三张映射表里搜索字段名或参数作用。
2. 表里的 `NV/LID` 和 `字段路径` 只是候选配置点，最终值仍要结合目标分支默认值、运营商匹配条件、生成产物和设备端运行值确认。
3. 不把 APN、ECC、SMS、运营商名等非当前范围内容放进 MTK NV 映射表。

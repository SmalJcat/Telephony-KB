---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_record_index_v1
status: active
last_updated: 2026-06-08
---

# 运营商参数备份

## 文档定位

本目录只保存运营商需求表整理结果，定位为 `reference_only`。

这里不做数据库，不维护解析脚本，也不写平台配置方案。单个运营商页面用于回查需求来源、MCCMNC、业务域和原表字段；真正配置落地时，再回到 `60_Configuration` 下对应配置方法文档、平台默认值和目标代码/产物确认。

## 记录索引

| 运营商 | 国家/地区 | MCCMNC | 涉及范围 | 待确认状态 | 文档 |
|---|---|---|---|---|---|
| UNITEL | Angola | 63102 | IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、EVS、ViLTE、媒体/Codec | 原表部分 URI 似乎把 MCC/MNC 写成 `mnc631.mcc02`，与标准 `mnc002.mcc631` 不一致；配置前必须复核域名。 | [Angola_UNITEL_63102.md](Angola_UNITEL_63102.md) |
| Optus | Australia | 50502 | APN、IMS、VoLTE、VoWiFi、Emergency、SMS、LTE、5G NR、NB-IoT/Cat-M1 | MCCMNC 已按 `50502` 记录；UT APN、Emergency APN 和 ECC 号码仍需回查原表或运营商确认 | [Australia_Optus_50502.md](Australia_Optus_50502.md) |
| Mascom | Botswana | 65201 | IMS/VoLTE、ViLTE、UT/XCAP、Emergency、VoWiFi not support、媒体/Codec | 因原表没有独立 MCC/MNC 行，配置前建议向运营商资料再确认 `65201`。VoWiFi 多处写 Not support。 | [Botswana_Mascom_65201.md](Botswana_Mascom_65201.md) |
| MOD | Egypt | 60210 | IMS/VoLTE、ViLTE、UT/XCAP、Emergency、APN、Qualcomm NV 参考列 | Carrier Name 只有 `mod`，国家由 MCC `602` 推定为 Egypt；不要把本文直接当成公开运营商配置结论。 | [Egypt_MOD_60210.md](Egypt_MOD_60210.md) |
| Safaricom | Kenya | 63902 | APN、MMS、IMS/VoLTE、VoWiFi/ePDG、IKE/IPSec、Emergency、5G phone capability | ePDG FQDN 行疑似写成 `epdg.epc.mnc639.mcc002`，与 MCC/MNC 常规格式不一致，配置前必须回查运营商确认。 | [Kenya_Safaricom_63902.md](Kenya_Safaricom_63902.md) |
| Ooredoo | Kuwait | 41903 | APN、MMS、IMS/VoLTE、VoWiFi/ePDG、Emergency、SMS、5G/NR 网络信息 | `OKW` 与 `Ooredoo Kuwait` 两份表合并记录；如果值冲突，应优先回查更新时间更近或项目指定文件。 | [Kuwait_Ooredoo_41903.md](Kuwait_Ooredoo_41903.md) |
| STC Kuwait | Kuwait | 41904 | APN、IMS/VoLTE、VoWiFi/ePDG、Emergency、SMS、5G/NR 网络信息、媒体/EVS | `STC Operator X` 实际也写 STC Kuwait/41904，本文合并为同一运营商记录；后续如发现它是匿名模板，可从 source_files 中拆出。 | [Kuwait_STC_41904.md](Kuwait_STC_41904.md) |
| Orange | Morocco | 60400 | APN、IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、EVS、媒体/Codec | MNC 为 `00`，配置文件命名/匹配时必须保留两位 MNC，不要写成 `6040`。 | [Morocco_Orange_60400.md](Morocco_Orange_60400.md) |
| Vodafone | Oman | 42206 | APN、IMS/VoLTE、ViLTE、VoWiFi/ePDG、UT/XCAP、Emergency、SMS、EVS | Emergency Call Support & APN 写 `CSFB`，不要误配置成 ECC over IMS；ViLTE 支持为 Yes。 | [Oman_Vodafone_42206.md](Oman_Vodafone_42206.md) |
| Ooredoo | Qatar | 42701 | APN、IMS/VoLTE、Emergency、SMS、SRVCC、UT/XCAP、网络信息 | 原表是三列表格，本文按 `Sheet1` 的 Parameter/Description/Value 保留；MCCMNC 主要依赖文件名和公网确认。 | [Qatar_Ooredoo_42701.md](Qatar_Ooredoo_42701.md) |
| Mobily | Saudi Arabia | 42003 | IMS/VoLTE、VoWiFi/ePDG、APN、UT/XCAP、Emergency、SRVCC、媒体/Codec | Emergency APN 行写 `no APN. 380 CS fallback`，配置前需确认紧急呼叫是否走 CSFB。 | [SaudiArabia_Mobily_42003.md](SaudiArabia_Mobily_42003.md) |
| STC | Saudi Arabia | 42001 | APN、IMS/VoLTE、ViLTE、VoWiFi/ePDG、UT/XCAP、Emergency、RCS、SRVCC | Emergency Call over IMS 在 Feature 表写 `NO/CSFB`，不要直接配置 ECC over IMS。RCS 多处写 Not Commercial launch。 | [SaudiArabia_STC_42001.md](SaudiArabia_STC_42001.md) |
| Zain | Saudi Arabia | 42004 | APN、IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、SRVCC、媒体/Codec | 文件名明确为 Zain KSA；配置前重点回查 Network Config 的 live 列和备注列。 | [SaudiArabia_Zain_42004.md](SaudiArabia_Zain_42004.md) |
| Orange | Senegal | 60801 | IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、SMS、SRVCC、媒体/Codec | Operator information 的 IMS vendor 字段为空/模板化，配置前需以具体 IMS 网络资料为准。 | [Senegal_Orange_60801.md](Senegal_Orange_60801.md) |
| MTN | South Africa | 65510 | APN、MMS、IMS/VoLTE、VoWiFi/ePDG、Emergency、SMS、LTE/NR 能力、SIM/eSIM | 这是 MTN SA 最小设备规格，包含大量终端能力要求；本文已过滤 CA 明细，配置前仍需区分“设备能力”与“运营商参数”。 | [SouthAfrica_MTN_65510.md](SouthAfrica_MTN_65510.md) |
| Rain | South Africa | 65519 / 65538 / 65573 / 65574 | APN、IMS/VoLTE、VoWiFi disabled、Emergency、SMS、SRVCC、网络频段、PLMN 锁网说明 | 同一文件中主表和 APN 表 MCCMNC 范围不同，后续配置时需明确目标 SIM/PLMN 是否覆盖 `65519`。 | [SouthAfrica_Rain_65519_65538_65573_65574.md](SouthAfrica_Rain_65519_65538_65573_65574.md) |
| du | United Arab Emirates | 42403 | Carrier bundle、IMS/VoLTE、UT/XCAP、Emergency、P-CSCF、媒体/Codec、Network information | 文件名没有运营商名，但 Network information sheet 明确写 `du` 和 `42403`。 | [UAE_Du_42403.md](UAE_Du_42403.md) |
| Antel | Uruguay | 74801 | IMS APN、VoLTE、VoWiFi/ePDG、Emergency、SMS、SRVCC、XCAP/UT | VoWiFi 表存在多列默认/Antel 取值，落地前需确认使用 Antel 列而非 default/example 列。 | [Uruguay_Antel_74801.md](Uruguay_Antel_74801.md) |

## 文件命名

按 `国家或地区_运营商名_mccmnc.md` 保存。

| 示例 | 说明 |
|---|---|
| `Australia_Optus_50502.md` | Optus Australia，MCCMNC 50502 |
| `SaudiArabia_STC_42001.md` | STC Saudi Arabia，MCCMNC 42001 |
| `国家_运营商_mccmnc.md` | 后续新增记录按此格式命名 |

必须能从需求表或同一运营商资料中确认 MCC/MNC，才能在本目录建文件。如果 MCC/MNC 缺失、只是从 APN/URI/FQDN 推断、或者资料是多运营商/集团级/投标问卷且没有单一明确 MCCMNC，就不要放到本目录；确需临时保留时，必须在 `待确认项` 中明确标注。

## Frontmatter

每个运营商记录统一使用以下基础字段：

```yaml
---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: <operator name>
mccmnc: "<mccmnc>"
country: <country>
source: <source path or directory>
status: requirements_backup
last_updated: <yyyy-mm-dd>
---
```

多源资料可追加 `related_source` 或 `source_files`。`source` 路径应写真实 Windows 路径，不写 `?????`、通配符或无法回查的缺失路径。

## 页面结构

每份运营商记录按固定结构维护：

1. `一页摘要`：国家、运营商、MCCMNC、原表证据、公网查证、来源文件、覆盖范围和配置前重点。
2. `使用边界`：说明本文只做需求备份，不做配置方案；非网络项和载波聚合组合明细不纳入。
3. 需求分区：按业务域拆成 APN、IMS/VoLTE、VoWiFi、Emergency、网络能力等小节。
4. 需求表：统一使用 `Requirement Name / Requirement Description / Requirement Value / 备注 / 来源`，来源固定放最后一列。
5. `原表回查索引`：用于记录 sheet 或多文件合集的回查入口。
6. `待确认项`：记录空白、N/A、资料缺口或需要回查原表的部分；没有明确缺口也保留章节并说明配置前需平台默认值比对。
7. `维护备注`：记录版本、资料取舍和容易误读的字段。

## 参数需求表

统一使用下面的表头：

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|

维护规则：

| 原则 | 写法 |
|---|---|
| 只保留需求 | 原表三列优先写入 Requirement Name / Description / Value，中文说明放备注 |
| 不写配置方案 | 不写平台字段名、平台文件路径、补丁或实现细节 |
| 保留网络相关需求 | APN、ECC、SMS、VoWiFi、运营商名等网络参数可以作为需求备份记录 |
| 不强行解释空白 | 表格为空、N/A、默认、Not support 时按原表语义记录 |
| 不把推断写成事实 | MCC/MNC 不明确时不建文件；无法确认的内容放入 `待确认项` |

## 合并和跳过说明

| 源文件 | 处理方式 |
|---|---|
| `OKW-All-Settings-4G-5G-VoLTE-VOWIFI.xlsx` / `Ooredoo Kuwait-All-Settings-VoLTE+VoWiFi-20220905.xlsx` | 合并到 `Kuwait_Ooredoo_41903.md` |
| `STC Kuwait-All-Settings-4G-5G-VoLTE-VOWIFI.xlsx` / `STC Operator X-All-Settings-4G-5G-VoLTE-VOWIFI.xlsx` | 合并到 `Kuwait_STC_41904.md` |
| `~$Optus Device Specs v9.8_PROTECTED.xlsx` | Excel 临时锁文件，跳过 |

## 状态说明

| 状态 | 含义 |
|---|---|
| `requirements_backup` | 已整理成参数备份，可供后续配置参考 |
| `supplementary_source` | 补充资料，只作为同运营商参考，不覆盖主表 |
| `consolidated_msr` | 多个 MSR/问卷文件合并整理成一个运营商记录 |

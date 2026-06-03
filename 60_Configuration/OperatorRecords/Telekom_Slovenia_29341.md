---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v1
operator: Telekom Slovenije
mccmnc: "29341"
country: Slovenia
source: F:\Codex\Knowledge\运营商参数\Technical requirements for mobile terminals_10.2.2025.xlsx
status: requirements_backup
last_updated: 2026-06-02
---

# Telekom Slovenije 29341

## 阅读入口

- 本文是运营商参数原表的参考备份，优先用于查证 MCCMNC、APN、紧急号码、运营商名称和客户定制字段来源。
- 落地配置前先回到 `60_Configuration/README.md`、`配置与客户定制.md` 和具体平台配置方法文档确认生效链路。
- `quality=imported_reference` 表示资料尚未收敛成最终工程结论，不直接作为配置值下发。

## 记录说明

- 只记录运营商需求和原表证据，作为后续配置参考。
- 不写平台配置项、补丁、默认值判断或落地结论。
- 空白、N/A、默认值和未确认项按原资料保留，不主动推断。

## 索引信息

| 字段 | 内容 |
|---|---|
| 运营商 | Telekom Slovenije |
| 国家 | Slovenia |
| MCC | 293 |
| MNC | 41 |
| MCCMNC | 29341 |
| MCCMNC 证据 | APN section includes `MCC: 293` and `MNC:41`; VoLTE/VoWiFi rows explicitly mention Telekom Slovenie |
| 来源文件 | `Technical requirements for mobile terminals_10.2.2025.xlsx` |

## 参数需求

| 业务域 | 需求项 | 要求/取值 | 来源位置 | 备注 |
|---|---|---|---|---|
| Device identity | IMEI represents tested device | Fully compliant | Requirement table | 终端测试身份 |
| NR band | Required NR bands | n7 FDD, n28 FDD/DSS, n78 TDD: Fully compliant | Requirement table | n75 SDL and n258 TDD are optional and marked Not compliant |
| NR CA | Required NR CA combinations | Part compliant | Requirement table | n7/n78, n28/n78, n78/n78 |
| NR technology | NSA / SA | NSA required and SA optional: Fully compliant | Requirement table | 原表按 required/optional 表达 |
| ENDC | ENDC anchor support | B20/B3 Not compliant; B7/B8/B1 Fully compliant | Requirement table | 运营商列出 required/optional anchor |
| DSS | B28/N28 DSS | Not compliant | Requirement table | 原表 required |
| LTE band | Required LTE bands | B1/B3/B7/B8/B20/B28: Fully compliant | Requirement table | LTE frequency bands |
| LTE CA | Required and optional CA combinations | Part compliant | Requirement table | 原表列出多组 CA combination |
| LTE MIMO | 4x4 MIMO | Bands 1/3/7 supported: Fully compliant | Requirement table | If device supports 4x4 MIMO |
| LTE category | LTE Category | Category 4 or higher: Fully compliant | Requirement table | LTE capability |
| VoLTE | VoLTE support | Mandatory if HW supports it: Fully compliant | Requirement table | Telekom approval condition |
| VoLTE UI | VoLTE default and switch | Default ON; user switch removed: Fully compliant | Requirement table | Required if VoLTE approved by Telekom Slovenie |
| VoLTE codec | RAN assisted codec rate adaptation | Fully compliant | Requirement table | VoLTE preferred item |
| VoWiFi | VoWiFi support | Mandatory if HW supports it: Fully compliant | Requirement table | Telekom approval condition |
| VoWiFi UI | VoWiFi default | Default ON: Fully compliant | Requirement table | Required if VoWiFi approved |
| VoWiFi access preference | LTE preferred default | Fully compliant | Requirement table | If VoWiFi supported |
| VoWiFi dependency | VoWiFi ON implies VoLTE ON | Fully compliant | Requirement table | When VoWiFi is switched ON |
| ViLTE | ViLTE support/default | Supported and default ON: Fully compliant | Requirement table | Optional if HW supports it |
| EVS | EVS support | Required if HW supports it: Fully compliant | Requirement table | EVS capability |
| GSM / CS | Inter-RAT ANR, WB-AMR GSM, VAMOS, A5/3, NACC | Fully compliant | Requirement table | GSM/CS capability items |
| GSM / CS | GSM DualTransferMode / EnhancedDTM | Not compliant | Requirement table | 原表标注 preferred/optional |
| Packet data | PDP type | IPv4/IPv6 preferred: Fully compliant | Requirement table | Packet data capability |
| Wi-Fi | Wi-Fi 802.11ac | Fully compliant | Requirement table | Optional |
| MMS | MMS max message size | 3 MB: Fully compliant | Requirement table | Required for smartphones |
| Cell broadcast | EU-ALERT | Compatible and default setting ON: Fully compliant | Requirement table | Cell Broadcast requirement |
| Network mode UI | Network mode options | Only Auto ((5G)/4G/3G/2G) and 2G; other options removed | Requirement table | Fully compliant |
| APN | Internet APN profile | Name `Mobilni Internet`; APN `internet`; username `mobitel`; password `internet` | GPRS and MMS settings | APN profile is marked Fully compliant |
| APN | APN type/protocol | `default, hipri, dun, supl, mms`; protocol IPv4 or IPv4/IPv6; roaming protocol IPv4 or IPv4/IPv6 | GPRS and MMS settings | APN enabled |
| MMS | MMSC and MMS settings | MMSC `http://mms.telekom.si`; proxy/port not set; WAP 2.0 | GPRS and MMS settings | MMS APN fields |

## 待确认项

| 项目 | 说明 |
|---|---|
| NR / LTE band-combination明细 | 原表列出较多组合，本文只保留需求摘要；配置前仍需回查原 xlsx 的完整组合列表。 |
| APN 落地 | 本目录只做需求备份；APN 是否纳入后续配置范围由单独流程决定。 |

## 维护备注

- 这份资料是终端技术要求和 APN/VoLTE/VoWiFi 能力要求混合表，不等同于平台配置方案。
- `MCC:293` 与 `MNC:41` 可确认 MCCMNC `29341`。

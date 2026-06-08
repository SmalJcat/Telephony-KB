---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Mascom
mccmnc: "65201"
country: Botswana
source: F:\Codex\Knowledge\运营商参数归档\Mascom IMS Configurations.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Botswana Mascom 65201

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Botswana |
| 运营商 | Mascom |
| MCCMNC | `65201` |
| MCC/MNC 证据 | 原表文件名和取值列为 Mascom；Conference URI 使用 `mnc001.mcc652`。原表未给独立 MCC/MNC 行。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Botswana Mascom 使用 `652 01`；本文按该公开映射和原表 URI 共同记录。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Mascom IMS Configurations.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | IMS/VoLTE、ViLTE、UT/XCAP、Emergency、VoWiFi not support、媒体/Codec |
| 配置前重点 | 因原表没有独立 MCC/MNC 行，配置前建议向运营商资料再确认 `65201`。VoWiFi 多处写 Not support。 |

## 使用边界

- 本文只保存和运营商网络参数相关的需求，便于后续配置 APN、CarrierConfig、Modem NV、ECC 或排查 IMS/VoWiFi 问题时回查。
- 本文不记录载波聚合组合明细，也不记录与网络参数无关的客户定制项。
- 需求正文保留原表字段口径：`Requirement Name`、`Requirement Description`、`Requirement Value`。其中 `Requirement Value` 对应原表的运营商取值/反馈列。
- 中文只用于分区、备注和风险说明，不替代原始需求文本。
- 本文不判断目标平台默认值，也不直接给出落地配置结论；真正配置前仍需结合目标平台代码、默认值缓存、生成产物和运行时证据确认。
- 各需求表最后一列保留原 xlsx/xls 的 sheet/row，便于人工回查。

## 配置相关重点

### 身份与匹配

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Conference Server URI | as per 3gpp spec TS34.229 | conf-factory.ims.mnc001.mcc652.3gppnetwork.org | 业务域：VoLTE | Sheet1 R21 |
| Own URI(Idi) | Type / Value / ex)USER_FQDN / 0IMSI@nai.epc.mncxxx.mccxxx.3gppnetwork.org / / This should be the IMSI used by the UE. The typical format is: / 0IMSI@nai.epc.mncNNN.mccMMM.3gppnetwork.org, where NNN and MMM / are the values to be used by operator for their MNC and MCC respectively. / EAP-AKA will be used for authentication. |   | 业务域：VoWiFi | Sheet1 R84 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Ut APN name | APN name | ims | 业务域：Ut | Sheet1 R33 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| VoLTE enabled by default | Volte switch is enabled by deafault | The VoLTE switch must be visible and ON by default. | 业务域：VoLTE | Sheet1 R5 |
| IMS Registraion Algorithm | MD5 or AKAv1-MD5 or AKAv2-MD5 | AKAV1-MD5 | 业务域：VoLTE | Sheet1 R6 |
| IMS Authentication Algorithm | HMAC-MD5-96 or HMAC-SHA-1-96 or / Both | both | 业务域：VoLTE | Sheet1 R7 |
| MSS size for IMS | TCP MSS(Maximum Segment Size) in bytes | 1500/SEGMENT SIZE) IN BYTES | 业务域：VoLTE | Sheet1 R10 |
| Ringback Timer | time given in second | 60/IN SECOND | 业务域：VoLTE | Sheet1 R11 |
| Ringing Timer | time given in second | 60/IN SECOND | 业务域：VoLTE | Sheet1 R12 |
| GRUU |   | Yes | 业务域：VoLTE | Sheet1 R13 |
| Enable preconditions |   | Yes | 业务域：VoLTE | Sheet1 R14 |
| Display Registration icon |   | Yes | 业务域：VoLTE | Sheet1 R15 |
| Session Expires | Session Expires time secs / ex) 1800 secs | 1800 sec | 业务域：VoLTE | Sheet1 R17 |
| SIP INVITE error codes triggering CSFB | error codes separated by semicolon | 403;500;503 | 业务域：VoLTE | Sheet1 R18 |
| Support of TEL URI or SIP URI | SIP Uri Only / Both | BOTH | 业务域：VoLTE | Sheet1 R19 |
| Support explicit call transfer | Blind Explicit Call Transfer and Consultative Explicit Call Transfer. | Support | 业务域：VoLTE | Sheet1 R20 |
| Support subscribing to the conference event? |   | Yes | 业务域：VoLTE | Sheet1 R22 |
| Conference Call dialog Type | In-dialog / Out of-dialog | Out of-dialog | 业务域：VoLTE | Sheet1 R23 |
| Support VoLTE in Roaming Area | Samsung device supports this as default. | Support | 业务域：VoLTE | Sheet1 R28 |
| GBA Support ? Or not ? |   | YES | 业务域：Ut | Sheet1 R34 |
| - GBA Type | GBA-ME / GBA-u |   | 业务域：Ut | Sheet1 R35 |
| Support TLS(SSL) |   | YES | 业务域：Ut | Sheet1 R36 |
| XCAP Root path | Root folder path (ex. /MyService) |   | 业务域：Ut | Sheet1 R37 |
| NAF port | If port is 443, please confirm if TLS is used. | 80 | 业务域：Ut | Sheet1 R39 |
| BSF port (If Ut support GBA) | If port is 443, please confirm if TLS is used. | 80 | 业务域：Ut | Sheet1 R41 |
| SS domain preference | 1. CS always / : Ut not supported / 2. PS always / : UE will use XCAP always (CSFB is never used). / 3. PS only if VoLTE registered / : UE will use XCAP only if VoLTE is registered. / 4. PS only if PS is registered / : UE will use XCAP when PS is registered (if PS is unavailable, UE will try CS domain). | PS and CSFB | 业务域：Ut | Sheet1 R42 |
| Support CS fallback for XCAP error | Yes -> CSFB for every errors(including timeout, HTTP errors, etc..) / No -> CSFB for only #403 HTTP error | YES | 业务域：Ut | Sheet1 R43 |
| Support <media> attribute in XCAP | Yes -> Use <media> in XCAP document / No -> No <media> in XCAP document | YES | 业务域：Ut | Sheet1 R44 |
| Support element PUT | Full -> DUT will send ruleset. / Element -> DUT will send single rule which is selected. | Element | 业务域：Ut | Sheet1 R45 |
| Support CFNL(Call Forwarding Not Logged-in) |   | YES | 业务域：Ut | Sheet1 R46 |
| URI type for call forwarding target number | This will be used for PUT request for call forwarding setting | SIP | 业务域：Ut | Sheet1 R47 |
| Call waiting type | Terminal based / Network based | Terminal Based | 业务域：Ut | Sheet1 R48 |
| Support Ut in Roaming Area | "NO" means Ut in Roaming Area will be blocked under below conditions. / 1) "Support VoLTE in Roaming Area" is "True" and "SS domain preference" is "2 or 3 or 4" / 1) "Support VoLTE in Roaming Area" is "False" and "SS domain preference" is "2 or 4" | YES | 业务域：Ut | Sheet1 R49 |
| 2.21 USSD domain preference | 1. CS / : UE will use CS domain always. / 2. PS / : UE will use USSD over IMS always (no usage of CS domain.) / 3. PSCS / : If VoLTE is registered, UE will use USSD over IMS. Otherwise, UE will use CS domain. | CS | 业务域：USSD | Sheet1 R51 |
| SMS Fallback to CS / (If you don't write in this field, default value is yes.) | SMS Fallback to CS in case device receives SIP error or No response to SIP | YES | 业务域：SMS over IMS | Sheet1 R55 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Enable rtcp on active call |   | Enable | 业务域：VoLTE | Sheet1 R16 |
| AMR type | AMR-WB only / AMR-NB only / Both (AMR-WB preferred) / Both (AMR-NB preferred) | AMR-WB PREFERRED | 业务域：VoLTE | Sheet1 R24 |
| - AMR-WB mode-set | ALL (0,1,2,3,4,5,6,7,8) / or specific value(s) in 0 ~ 8 | ALL (0,1,2,3,4,5,6,7,8)/S) IN 0 ~ 8 | 业务域：VoLTE | Sheet1 R25 |
| - AMR-NB mode-set | ALL (0,1,2,3,4,5,6,7) / or specific value(s) in 0 ~ 7 | ALL (0,1,2,3,4,5,6,7)/S) IN 0 ~ 7 | 业务域：VoLTE | Sheet1 R26 |
| Audio Codec Mode | Octet aligned, Bandwidth efficiency | BANDWIDTH EFFICIENCY | 业务域：VoLTE | Sheet1 R27 |
| Video Codec(format) | H.264, H.263, H.265 / You can choose multiple values. | HD for H265 and VGA | 业务域：ViLTE | Sheet1 R30 |
| Video Capabilities - Resolution | QVGA, VGA, QCIF, HD / You can choose multiple values. | VGA and HD | 业务域：ViLTE | Sheet1 R31 |
| HF-Only | 0. Compact and Header-Full formats can be used VoLTE is registered. / 1. Only Header-Full format |   | 业务域：EVS | Sheet1 R58 |
| dtx | Disabled(0) / Enabled(1) | Enabled(1) | 业务域：EVS | Sheet1 R59 |
| dtx-recv | Disabled(0) / Enabled(1) | Enabled(1) | 业务域：EVS | Sheet1 R60 |
| cmr | -1 / 0 / 1 |   | 业务域：EVS | Sheet1 R61 |
| - br | 5.9 ~ 24.4 (kbps) |   | 业务域：EVS | Sheet1 R63 |
| - bw | nb ~ swb |   | 业务域：EVS | Sheet1 R64 |
| - ch-aw-recv | -1 / 0 / 2 / 3 / 5 / 7 |   | 业务域：EVS | Sheet1 R65 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Support IPSec or not |   | Yes | 业务域：VoLTE | Sheet1 R8 |
| - Encryption Algorithm for IPSec | aes-cbc or des-ede3-cbc or all or none | ALL | 业务域：VoLTE | Sheet1 R9 |
| VoWiFi enable by default |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R67 |
| Support APN list Name |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R68 |
| - IMS | ims | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R69 |
| - UT | hos or xcap | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R70 |
| - MMS | mms | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R71 |
| Preferred mode |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R73 |
| ePDG address |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R74 |
| ePDG Security parameters |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R75 |
| - IKE Encryption |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R76 |
| - IKEv2 Integrity |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R77 |
| - IKEv2 Diffie-Hellman Group |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R78 |
| - IPSec encryption |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R79 |
| - IPSec integrity |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R80 |
| - IPSec Group |   | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R81 |
| IKE Rekeying timer | time given in seconds | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R82 |
| IPsec Rekeying timer | time given in seconds | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R83 |
| Subnet Type | IPv4 or IPv6 or IPv4v6 | IPV4 | 业务域：VoWiFi | Sheet1 R85 |
| IPv4 Vendor Attribute | The Attribute Type entered in this configuration field will be used by the UE to request P-CSCF IPv4 address. The attribute is put within the Configuration Payload of IKE_AUTH exchange. / ex) 16389 or 20 or N/A | 16389 | 业务域：VoWiFi | Sheet1 R86 |
| IPv6 Vendor Attribute | The Attribute Type entered in this configuration field will be used by the UE to request P-CSCF IPv4 address. The attribute is put within the Configuration Payload of IKE_AUTH exchange. / ex) 16390 or 21 or N/A | Not Used | 业务域：VoWiFi | Sheet1 R87 |
| Enable preconditions |   | Yes | 业务域：VoWiFi | Sheet1 R88 |
| ePDG Provider | Provider Name / ex) cisco | Not available | 业务域：VoWiFi | Sheet1 R89 |
| Display Registration icon |   | Yes | 业务域：VoWiFi | Sheet1 R90 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Support Emergency Call (including in case of No SIM) | Samsung device supports this as default. | YES (Current not active,CSFB for emergency calls) | 业务域：Emergeny Call | Sheet1 R53 |
| - Emergency Call | sos or ims | VoWIFI Not support | 业务域：VoWiFi | Sheet1 R72 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Mascom IMS Configurations.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| MCC/MNC 证据 | 原表无独立 MCC/MNC 行，本文依据 `mnc001.mcc652` URI 与公开映射记录为 `65201`，配置前需复核。 |

## 维护备注

- 这份资料是 Mascom 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

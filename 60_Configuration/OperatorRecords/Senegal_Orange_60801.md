---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Orange
mccmnc: "60801"
country: Senegal
source: F:\Codex\Knowledge\运营商参数归档\Samsung_Commercial_IMS_Project_Configuration(for_MNO)_OSN v5.1_230131update.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Senegal Orange 60801

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Senegal |
| 运营商 | Orange |
| MCCMNC | `60801` |
| MCC/MNC 证据 | 原表 `Operator information` R4/R5/R7 写 Country `Senegal`、Operator `Orange`、MCC/MNC `608/01`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Senegal Orange/Sonatel 使用 `608 01`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Samsung_Commercial_IMS_Project_Configuration(for_MNO)_OSN v5.1_230131update.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、SMS、SRVCC、媒体/Codec |
| 配置前重点 | Operator information 的 IMS vendor 字段为空/模板化，配置前需以具体 IMS 网络资料为准。 |

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
| Opearator name | Ex) Vodafone | Orange | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R5 |
| - MCC/MNC | Ex) 26202, 262009 | 608/01 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R7 |
| - MVNO List | Please add MVNO list if operator wants to disable VoIMS for MVNO. / If MVNO uses different MCC/MNC compared to MNO, please add the MCC/MNC list. / If MVNO uses same MCC/MNC, please add GID or subset of the MVNO. / / Ex) 262/002 : Subset = 123, GID = 0xAB12, SP Name = AAA | none | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R8 |
| IOT plan | Ex) FUT Plan | Ex) FUT Plan | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R10 |
| IMS Server | Description | value | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R20 |
| Operator's IMS infra vendor | ex) Ericsson | IMS: / TAS: / PCRF: / MSC: / SDM: / EPC: / RAN: | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R21 |
| Conference Server URI | as per 3gpp spec TS34.229 | sip:mmtel@conf-factory.ims.mnc001.mcc608.3gppnetwork.org | 业务域：VoLTE | Device Configuration R21 |
| Own URI(Idi) | Type / Value / ex)USER_FQDN / 0IMSI@nai.epc.mncxxx.mccxxx.3gppnetwork.org / / This should be the IMSI used by the UE. The typical format is: / 0IMSI@nai.epc.mncNNN.mccMMM.3gppnetwork.org, where NNN and MMM / are the values to be used by operator for their MNC and MCC respectively. / EAP-AKA will be used for authentication. | USER_FQDN / 0IMSI@nai.epc.mncxxx.mccxxx.3gppnetwork.org | 业务域：VoWiFi | Device Configuration R84 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Ut APN name | APN name | hos | 业务域：Ut | Device Configuration R33 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over LTE | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R4 |
| SMS over IMS | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R6 |
| SRVCC(basesd on 3gpp REL8) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R7 |
| SRVCC(LTE->2G) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R8 |
| SRVCC(LTE->3G) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R9 |
| aSRVCC(basesd on 3gpp REL10) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R10 |
| eSRVCC(basesd on 3gpp REL10) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R11 |
| Supplemetary Service over IMS | Ut | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R12 |
| USSD over IMS | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R14 |
| VoLTE enabled by default | Volte switch is enabled by deafault | Yes | 业务域：VoLTE | Device Configuration R5 |
| IMS Registraion Algorithm | MD5 or AKAv1-MD5 or AKAv2-MD5 | AKAv1-MD5 | 业务域：VoLTE | Device Configuration R6 |
| IMS Authentication Algorithm | HMAC-MD5-96 or HMAC-SHA-1-96 or / Both | both | 业务域：VoLTE | Device Configuration R7 |
| MSS size for IMS | TCP MSS(Maximum Segment Size) in bytes | 1260 | 业务域：VoLTE | Device Configuration R10 |
| Ringback Timer | time given in second | 180 | 业务域：VoLTE | Device Configuration R11 |
| Ringing Timer | time given in second | 180 | 业务域：VoLTE | Device Configuration R12 |
| GRUU |   | N/A | 业务域：VoLTE | Device Configuration R13 |
| Enable preconditions |   | Yes | 业务域：VoLTE | Device Configuration R14 |
| Display Registration icon |   | No | 业务域：VoLTE | Device Configuration R15 |
| Session Expires | Session Expires time secs / ex) 1800 secs | 1800 | 业务域：VoLTE | Device Configuration R17 |
| SIP INVITE error codes triggering CSFB | error codes separated by semicolon | 403; 408;5XX | 业务域：VoLTE | Device Configuration R18 |
| Support of TEL URI or SIP URI | SIP Uri Only / Both | Both | 业务域：VoLTE | Device Configuration R19 |
| Support explicit call transfer | Blind Explicit Call Transfer and Consultative Explicit Call Transfer. | No | 业务域：VoLTE | Device Configuration R20 |
| Support subscribing to the conference event? |   | Yes | 业务域：VoLTE | Device Configuration R22 |
| Conference Call dialog Type | In-dialog / Out of-dialog | Out of-dialog | 业务域：VoLTE | Device Configuration R23 |
| Support VoLTE in Roaming Area | Samsung device supports this as default. | Yes | 业务域：VoLTE | Device Configuration R28 |
| 3. Ut for VoIMS |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R32 |
| GBA Support ? Or not ? |   | Yes | 业务域：Ut | Device Configuration R34 |
| - GBA Type | GBA-ME / GBA-u | GBA-ME | 业务域：Ut | Device Configuration R35 |
| Support TLS(SSL) |   | No | 业务域：Ut | Device Configuration R36 |
| XCAP Root path | Root folder path (ex. /MyService) | / | 业务域：Ut | Device Configuration R37 |
| NAF address |   | xcap.ims.mncXXX.mccXXX.pub.3gppnetwork.org | 业务域：Ut | Device Configuration R38 |
| NAF port | If port is 443, please confirm if TLS is used. | 80 | 业务域：Ut | Device Configuration R39 |
| BSF address (If Ut support GBA) |   | bsf.mncXXX.mccXXX.pub.3gppnetwork.org | 业务域：Ut | Device Configuration R40 |
| BSF port (If Ut support GBA) | If port is 443, please confirm if TLS is used. | 80 | 业务域：Ut | Device Configuration R41 |
| SS domain preference | 1. CS always / : Ut not supported / 2. PS always / : UE will use XCAP always (CSFB is never used). / 3. PS only if VoLTE registered / : UE will use XCAP only if VoLTE is registered. / 4. PS only if PS is registered / : UE will use XCAP when PS is registered (if PS is unavailable, UE will try CS domain). | 4. PS only if PS is registered | 业务域：Ut | Device Configuration R42 |
| Support CS fallback for XCAP error | Yes -> CSFB for every errors(including timeout, HTTP errors, etc..) / No -> CSFB for only #403 HTTP error | Yes | 业务域：Ut | Device Configuration R43 |
| Support <media> attribute in XCAP | Yes -> Use <media> in XCAP document / No -> No <media> in XCAP document | No | 业务域：Ut | Device Configuration R44 |
| Support element PUT | Full -> DUT will send ruleset. / Element -> DUT will send single rule which is selected. | Element | 业务域：Ut | Device Configuration R45 |
| Support CFNL(Call Forwarding Not Logged-in) |   | No | 业务域：Ut | Device Configuration R46 |
| URI type for call forwarding target number | This will be used for PUT request for call forwarding setting | SIP | 业务域：Ut | Device Configuration R47 |
| Call waiting type | Terminal based / Network based | Terminal based | 业务域：Ut | Device Configuration R48 |
| Support Ut in Roaming Area | "NO" means Ut in Roaming Area will be blocked under below conditions. / 1) "Support VoLTE in Roaming Area" is "True" and "SS domain preference" is "2 or 3 or 4" / 1) "Support VoLTE in Roaming Area" is "False" and "SS domain preference" is "2 or 4" | Yes | 业务域：Ut | Device Configuration R49 |
| 4. USSD for VoIMS |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R50 |
| 2.21 USSD domain preference | 1. CS / : UE will use CS domain always. / 2. PS / : UE will use USSD over IMS always (no usage of CS domain.) / 3. PSCS / : If VoLTE is registered, UE will use USSD over IMS. Otherwise, UE will use CS domain. | 2. PS | 业务域：USSD | Device Configuration R51 |
| 6. SMSoIP for VoIMS |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R54 |
| SMS Fallback to CS / (If you don't write in this field, default value is yes.) | SMS Fallback to CS in case device receives SIP error or No response to SIP | Yes | 业务域：SMS over IMS | Device Configuration R55 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Video over LTE | VoLTE | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R5 |
| Enable rtcp on active call |   | Enable | 业务域：VoLTE | Device Configuration R16 |
| AMR type | AMR-WB only / AMR-NB only / Both (AMR-WB preferred) / Both (AMR-NB preferred) | Both (AMR-WB preferred) | 业务域：VoLTE | Device Configuration R24 |
| - AMR-WB mode-set | ALL (0,1,2,3,4,5,6,7,8) / or specific value(s) in 0 ~ 8 | IR92 default value (undefined) / (no mode-set parameter included in the SDP answer) | 业务域：VoLTE | Device Configuration R25 |
| - AMR-NB mode-set | ALL (0,1,2,3,4,5,6,7) / or specific value(s) in 0 ~ 7 | 0,2,4,7 / ("mode-set = 0,2,4,7" included in the SDP answer) | 业务域：VoLTE | Device Configuration R26 |
| Audio Codec Mode | Octet aligned, Bandwidth efficiency | Bandwidth efficiency only | 业务域：VoLTE | Device Configuration R27 |
| 2. Video Call for VoIMS |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R29 |
| Video Codec(format) | H.264, H.263, H.265 / You can choose multiple values. | N/A | 业务域：ViLTE | Device Configuration R30 |
| Video Capabilities - Resolution | QVGA, VGA, QCIF, HD / You can choose multiple values. | N/A | 业务域：ViLTE | Device Configuration R31 |
| 7. EVS for VoIMS |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R56 |
| EVS enable |   | Yes | 业务域：EVS | Device Configuration R57 |
| HF-Only | 0. Compact and Header-Full formats can be used VoLTE is registered. / 1. Only Header-Full format | Important note: / ‘hf-only’ parameter shall not be present neither in the SDP offer nor in the answer: see [EVS-SDP-2] / - Caution: a note has just been added in 3GPP TS 26.114 [6] for clarification / hf-only: Permissible values are 0 and 1. If hf-only is 0 or not present, both Compact and Header-Full / formats can be used in the session for the send and the receive directions. If hf-only is 1, only Header- / Full format without zero padding for size collision avoidance is used. | 业务域：EVS | Device Configuration R58 |
| dtx | Disabled(0) / Enabled(1) | In / particular, following parameters shall NOT be included in the offer, see 3GPP TS 26.114 [6] table 6.2a: / - ch-aw-recv / - evs-mode-switch / - hf-only / - mode-set / - dtx | 业务域：EVS | Device Configuration R59 |
| dtx-recv | Disabled(0) / Enabled(1) | Enabled | 业务域：EVS | Device Configuration R60 |
| cmr | -1 / 0 / 1 | Among the 3 possibilities (permanent CMR, on-demand CMR, no CMR), Orange recommends to use / the by default configuration “on-demand CMR”: i.e. use by default SDP offer that does not include / CMR parameter: see [EVS-SDP-2]. | 业务域：EVS | Device Configuration R61 |
| EVS primary mode (default mode for UE) |   | N/A | 业务域：EVS | Device Configuration R62 |
| - br | 5.9 ~ 24.4 (kbps) | [EVS-SDP-1] The EVS UE shall include in its SDP offer these 2 EVS configurations in this preference / order: / - EVS Configuration B2 (SWB only) : br=9.6-24.4; bw=swb / - EVS Configuration A2: br=5.9-24.4; bw=nb-swb. | 业务域：EVS | Device Configuration R63 |
| - bw | nb ~ swb | nb ~ swb | 业务域：EVS | Device Configuration R64 |
| - ch-aw-recv | -1 / 0 / 2 / 3 / 5 / 7 | In / particular, following parameters shall NOT be included in the offer, see 3GPP TS 26.114 [6] table 6.2a: / - ch-aw-recv / - evs-mode-switch / - hf-only / - mode-set / - dtx | 业务域：EVS | Device Configuration R65 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over WiFi via ePDG | VoWIFI | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R4 |
| Video over LTE | VoWIFI | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R5 |
| SMS over IMS | VoWIFI | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R6 |
| MMS over ePDG | MMS | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R7 |
| Supplemetary Service over ePDG | XCAP | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R8 |
| Support IPSec or not |   | Yes | 业务域：VoLTE | Device Configuration R8 |
| - Encryption Algorithm for IPSec | aes-cbc or des-ede3-cbc or all or none | all | 业务域：VoLTE | Device Configuration R9 |
| 8. VoWiFi |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R66 |
| VoWiFi enable by default |   | No | 业务域：VoWiFi | Device Configuration R67 |
| Support APN list Name |   | N/A | 业务域：VoWiFi | Device Configuration R68 |
| - IMS | ims | ims | 业务域：VoWiFi | Device Configuration R69 |
| - UT | hos or xcap | hos | 业务域：VoWiFi | Device Configuration R70 |
| - MMS | mms | mms | 业务域：VoWiFi | Device Configuration R71 |
| Preferred mode |   | WiFi preferred | 业务域：VoWiFi | Device Configuration R73 |
| ePDG address |   | FQDN | 业务域：VoWiFi | Device Configuration R74 |
| ePDG Security parameters |   | N/A | 业务域：VoWiFi | Device Configuration R75 |
| - IKE Encryption |   | AES-CBC-128 | 业务域：VoWiFi | Device Configuration R76 |
| - IKEv2 Integrity |   | HMAC-SHA1-96 | 业务域：VoWiFi | Device Configuration R77 |
| - IKEv2 Diffie-Hellman Group |   | Group 2 (1024-bit) | 业务域：VoWiFi | Device Configuration R78 |
| - IPSec encryption |   | AES-CBC-128 | 业务域：VoWiFi | Device Configuration R79 |
| - IPSec integrity |   | HMAC-SHA1-96 | 业务域：VoWiFi | Device Configuration R80 |
| - IPSec Group |   | Group 2 (1024-bit) | 业务域：VoWiFi | Device Configuration R81 |
| IKE Rekeying timer | time given in seconds | 86400 | 业务域：VoWiFi | Device Configuration R82 |
| IPsec Rekeying timer | time given in seconds | 28800 | 业务域：VoWiFi | Device Configuration R83 |
| Subnet Type | IPv4 or IPv6 or IPv4v6 | IPv4v6 | 业务域：VoWiFi | Device Configuration R85 |
| IPv4 Vendor Attribute | The Attribute Type entered in this configuration field will be used by the UE to request P-CSCF IPv4 address. The attribute is put within the Configuration Payload of IKE_AUTH exchange. / ex) 16389 or 20 or N/A | 16389 | 业务域：VoWiFi | Device Configuration R86 |
| IPv6 Vendor Attribute | The Attribute Type entered in this configuration field will be used by the UE to request P-CSCF IPv4 address. The attribute is put within the Configuration Payload of IKE_AUTH exchange. / ex) 16390 or 21 or N/A | 16390 | 业务域：VoWiFi | Device Configuration R87 |
| Enable preconditions |   | Yes | 业务域：VoWiFi | Device Configuration R88 |
| ePDG Provider | Provider Name / ex) cisco | N/A | 业务域：VoWiFi | Device Configuration R89 |
| Display Registration icon |   | Yes | 业务域：VoWiFi | Device Configuration R90 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency Call over IMS | Emergency Call | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R13 |
| Emergency Call over ePDG | Emergency | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R9 |
| 5. Emergency Call over VoLTE |   | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Device Configuration R52 |
| Support Emergency Call (including in case of No SIM) | Samsung device supports this as default. | Yes | 业务域：Emergeny Call | Device Configuration R53 |
| - Emergency Call | sos or ims | sos | 业务域：VoWiFi | Device Configuration R72 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Samsung_Commercial_IMS_Project_Configuration(for_MNO)_OSN v5.1_230131update.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 Orange 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

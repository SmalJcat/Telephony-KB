---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Mobily
mccmnc: "42003"
country: Saudi Arabia
source: F:\Codex\Knowledge\运营商参数归档\Mobily_Commercial_IMS_Project_Configuration_v4 8_updated_20200310 (3).xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Saudi Arabia Mobily 42003

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Saudi Arabia |
| 运营商 | Mobily |
| MCCMNC | `42003` |
| MCC/MNC 证据 | 原表 `Operator information` R4/R5/R6 写 Country `Saudi Arabia`、Operator `Mobily`、MCC/MNC `42003`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Saudi Arabia Mobily 使用 `420 03`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Mobily_Commercial_IMS_Project_Configuration_v4 8_updated_20200310 (3).xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | IMS/VoLTE、VoWiFi/ePDG、APN、UT/XCAP、Emergency、SRVCC、媒体/Codec |
| 配置前重点 | Emergency APN 行写 `no APN. 380 CS fallback`，配置前需确认紧急呼叫是否走 CSFB。 |

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
| Opearator name | Mobily | Mobily | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R5 |
| MCC/MNC | 42003 , | 42003 , | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R6 |
| IMS Server | Description | value | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R19 |
| Operator's IMS infra vendor | ex) Ericsson | ex) Ericsson | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R20 |
| Conference Server URI | as per 3gpp spec TS34.229 | sip:conf-factory.ims.mnc003.mcc420.3gppnetwork.org | 业务域：VoLTE | Device Configuration R21 |
| Own URI(Idi) | Type / Value / ex)USER_FQDN / 0IMSI@nai.epc.mncxxx.mccxxx.3gppnetwork.org / / This should be the IMSI used by the UE. The typical format is: / 0IMSI@nai.epc.mncNNN.mccMMM.3gppnetwork.org, where NNN and MMM / are the values to be used by operator for their MNC and MCC respectively. / EAP-AKA will be used for authentication. | USER_FQDN / 0IMSI@nai.epc.mnc003.mcc420.3gppnetwork.org | 业务域：VoWiFi | Device Configuration R88 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Ut APN Type | Use Intenet APN or Specific APN for UT | XCAP | 业务域：Ut | Device Configuration R35 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over LTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R4 |
| SMS over IMS | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R7 |
| SRVCC(basesd on 3gpp REL8) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R8 |
| SRVCC(LTE->2G) | VoLTE | Yes " to be activated if needed for testing " | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R9 |
| SRVCC(LTE->3G) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R10 |
| aSRVCC(basesd on 3gpp REL10) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R11 |
| eSRVCC(basesd on 3gpp REL10) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R12 |
| Supplemetary Service over IMS | Ut | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R13 |
| USSD over IMS | VoLTE | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R15 |
| VoLTE enabled by default | Volte switch is enabled by deafault | Yes | 业务域：VoLTE | Device Configuration R5 |
| IMS Registraion Algorithm | MD5 or AKAv1-MD5 or AKAv2-MD5 | AKAv1-MD5 | 业务域：VoLTE | Device Configuration R6 |
| IMS Authentication Algorithm | HMAC-MD5-96 or HMAC-SHA-1-96 or / Both | both | 业务域：VoLTE | Device Configuration R7 |
| MTU size for IMS | size in bytes | 1500 | 业务域：VoLTE | Device Configuration R10 |
| Ringback Timer | time given in second | 90 | 业务域：VoLTE | Device Configuration R11 |
| Ringing Timer | time given in second | 90 | 业务域：VoLTE | Device Configuration R12 |
| GRUU |   | Yes | 业务域：VoLTE | Device Configuration R13 |
| Enable preconditions |   | Yes | 业务域：VoLTE | Device Configuration R14 |
| Display Registration icon |   | Yes | 业务域：VoLTE | Device Configuration R15 |
| Session Expires | Session Expires time secs / ex) 1800 secs | 1800 | 业务域：VoLTE | Device Configuration R17 |
| SIP INVITE error codes triggering CSFB | error codes separated by semicolon | 403;500;503 | 业务域：VoLTE | Device Configuration R18 |
| Support of TEL URI or SIP URI | SIP Uri Only / Both | Both | 业务域：VoLTE | Device Configuration R19 |
| Support explicit call transfer | Blind Explicit Call Transfer and Consultative Explicit Call Transfer. | No | 业务域：VoLTE | Device Configuration R20 |
| Support subscribing to the conference event? |   | Yes | 业务域：VoLTE | Device Configuration R22 |
| Conference Call dialog Type | In-dialog / Out of-dialog | in-dialog | 业务域：VoLTE | Device Configuration R23 |
| Support VoLTE in Roaming Area |   | No | 业务域：VoLTE | Device Configuration R29 |
| - Support VoLTE in case of mobile data is disabled in Roaming Area |   | No | 业务域：VoLTE | Device Configuration R30 |
| Ut GBA Support ? Or not ? |   | Yes | 业务域：Ut | Device Configuration R36 |
| - GBA Type |   | GBA_ME, UT | 业务域：Ut | Device Configuration R37 |
| Usage of TLS(SSL) |   | Yes | 业务域：Ut | Device Configuration R38 |
| Ut XCAP Root URI | "/MyServices" (Prefix in request) | / | 业务域：Ut | Device Configuration R39 |
| Ut proxy server address |   | xcap.ims.mnc003.mcc420.pub.3gppnetwork.org | 业务域：Ut | Device Configuration R40 |
| Ut proxy port | If port is 443, please confirm if TLS is used. | 80 | 业务域：Ut | Device Configuration R41 |
| Ut BSF address (IF Ut support GBA) |   | bsf.mnc003.mcc420.pub.3gppnetwork.org | 业务域：Ut | Device Configuration R42 |
| Ut BSF port (IF Ut support GBA) | If port is 443, please confirm if TLS is used. | 443 | 业务域：Ut | Device Configuration R43 |
| SS domain preference | 1. CS always / : Ut not supported / 2. PS always / : UE will use XCAP always (if PS is not registered, UE will return error). / 3. PS only if VoLTE registered / : UE will use XCAP only if VoLTE is registered. / 4. PS only if PS is registered / : UE will use XCAP when PS is registered (if PS is not registered, UE will try CS domain). | 3. PS only if VoLTE registered | 业务域：Ut | Device Configuration R44 |
| Usage of SS CS fallback for error | Yes -> CSFB for every errors(including timeout, HTTP errors, etc..) / No -> CSFB for only #403 HTTP error | No | 业务域：Ut | Device Configuration R45 |
| Usage of <media> attribute in XCAP | Yes -> Use <media> in XCAP document / No -> No <media> in XCAP document | No | 业务域：Ut | Device Configuration R46 |
| Usage of element PUT request for communication diversion | Full -> DUT will send whole call forwarding rules. / Element -> DUT will send only one call forwarding which user selected. | Single | 业务域：Ut | Device Configuration R47 |
| Support CFNL(Call Forwarding Not Logged-in) |   | No | 业务域：Ut | Device Configuration R48 |
| URI type for call forwarding target number | This will be used for PUT request for call forwarding setting | SIP | 业务域：Ut | Device Configuration R49 |
| Call waiting is Terminal based or Network based |   | Terminal based | 业务域：Ut | Device Configuration R50 |
| Support Ut in Roaming Area |   | No | 业务域：Ut | Device Configuration R51 |
| - Support Ut in case of mobile data is disabled in Roaming Area |   | No | 业务域：Ut | Device Configuration R52 |
| 2.21 USSD domain preference | 1. CS / : UE will use CS domain always. / 2. PS / : UE will use USSD over IMS always (no usage of CS domain.) / 3. PSCS / : If VoLTE is registered, UE will use USSD over IMS. Otherwise, UE will use CS domain. | CS | 业务域：USSD | Device Configuration R54 |
| SMS Fallback to CS / (If you don't write in this field, default value is yes.) | SMS Fallback to CS in case device receives SIP error or No response to SIP | Yes | 业务域：SMS over IMS | Device Configuration R59 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Video over LTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R5 |
| Upgrade from VoLTE to ViLTE / Downgrade from ViLTE to VoLTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R6 |
| Enable rtcp on active call |   | Enable | 业务域：VoLTE | Device Configuration R16 |
| AMR type | AMR-WB only / AMR-NB only / Both (AMR-WB preferred) / Both (AMR-NB preferred) | AMR WB;AMR NB | 业务域：VoLTE | Device Configuration R24 |
| - AMR-WB mode-set | ALL (0,1,2,3,4,5,6,7,8) / or specific value(s) in 0 ~ 8 | 0,1,2,3,4,5,6,7,8 | 业务域：VoLTE | Device Configuration R25 |
| - AMR-NB mode-set | ALL (0,1,2,3,4,5,6,7) / or specific value(s) in 0 ~ 7 | 0,1,2,3,4,5,6,7 | 业务域：VoLTE | Device Configuration R26 |
| Audio Codec Mode | Octet aligned, Bandwidth efficiency | Bandwidth efficiency preferred | 业务域：VoLTE | Device Configuration R27 |
| DTMF Codec Mode | Out-of-band / In-band / (Out-of-band: RFC 2833 / / In-band: Voice band) | In-band | 业务域：VoLTE | Device Configuration R28 |
| Video Codec(format) | H.264, H.263, H.265 / You can choose multiple values. | H.264 | 业务域：ViLTE | Device Configuration R32 |
| Video Capabilities - Resolution | QVGA, VGA, QCIF, HD / You can choose multiple values. | VGA,720, HD Video | 业务域：ViLTE | Device Configuration R33 |
| EVS enable |   | No | 业务域：EVS | Device Configuration R61 |
| HF-Only | 0. Compact and Header-Full formats can be used VoLTE is registered. / 1. Only Header-Full format | 0 | 业务域：EVS | Device Configuration R62 |
| dtx | Disabled(0) / Enabled(1) | Enabled(1) | 业务域：EVS | Device Configuration R63 |
| dtx-recv | Disabled(0) / Enabled(1) | Enabled(1) | 业务域：EVS | Device Configuration R64 |
| cmr | -1 / 0 / 1 | 0 | 业务域：EVS | Device Configuration R65 |
| - br | 5.9 ~ 24.4 (kbps) | 5.9 ~ 24.4 | 业务域：EVS | Device Configuration R67 |
| - bw | nb ~ swb | nb ~ swb | 业务域：EVS | Device Configuration R68 |
| - ch-aw-recv | -1 / 0 / 2 / 3 / 5 / 7 | -1 | 业务域：EVS | Device Configuration R69 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over WiFi via ePDG | VoWIFI | yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R4 |
| Video over LTE | VoWIFI | yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R5 |
| Upgrade from VoLTE to ViLTE / Downgrade from ViLTE to VoLTE | VoWIFI | yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R6 |
| SMS over IMS | VoWIFI | yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R7 |
| MMS over ePDG | MMS | no | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R8 |
| Supplemetary Service over ePDG | XCAP | yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R9 |
| Support IPSec or not |   | Yes | 业务域：VoLTE | Device Configuration R8 |
| - Encryption Algorithm for IPSec | aes-cbc or des-ede3-cbc or all or none | All | 业务域：VoLTE | Device Configuration R9 |
| VoWiFi enable by default |   | Yes | 业务域：VoWiFi | Device Configuration R71 |
| - IMS | ims | ims | 业务域：VoWiFi | Device Configuration R73 |
| - UT | hos or xcap | xcap | 业务域：VoWiFi | Device Configuration R74 |
| - MMS | mms | Not support | 业务域：VoWiFi | Device Configuration R75 |
| Preferred mode |   | WiFi preferred | 业务域：VoWiFi | Device Configuration R77 |
| ePDG address |   | epdg.mobily.com.sa | 业务域：VoWiFi | Device Configuration R78 |
| - IKE Encryption |   | AES-CBC-128 | 业务域：VoWiFi | Device Configuration R80 |
| - IKEv2 Integrity |   | HMAC-SHA1-96 | 业务域：VoWiFi | Device Configuration R81 |
| - IKEv2 Diffie-Hellman Group |   | Group 2 (1024-bit) | 业务域：VoWiFi | Device Configuration R82 |
| - IPSec encryption |   | AES-CBC-128 | 业务域：VoWiFi | Device Configuration R83 |
| - IPSec integrity |   | HMAC-SHA1-96 | 业务域：VoWiFi | Device Configuration R84 |
| - IPSec Group |   | Group 2 (1024-bit) | 业务域：VoWiFi | Device Configuration R85 |
| IKE Rekeying timer | time given in seconds | 86400 | 业务域：VoWiFi | Device Configuration R86 |
| IPsec Rekeying timer | time given in seconds | 28800 | 业务域：VoWiFi | Device Configuration R87 |
| Subnet Type | IPv4 or IPv6 or IPv4v6 | IPv4v6 | 业务域：VoWiFi | Device Configuration R89 |
| Vendor Attribute (IPv4 / IPv6) | IPv4 / IPv6 / ex) 16389 / 16390 or 20 / 21 | IPv4 / IPv6 / 16389 / 16390 | 业务域：VoWiFi | Device Configuration R90 |
| Enable preconditions |   | Yes | 业务域：VoWiFi | Device Configuration R91 |
| ePDG Provider | Provider Name / ex) cisco | Huawei | 业务域：VoWiFi | Device Configuration R92 |
| Display Registration icon |   | Yes | 业务域：VoWiFi | Device Configuration R93 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency Call over IMS | Emergency Call | Yes " to be activated from Radio side if needed for testing " | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE Feature R14 |
| Emergency Call over ePDG | Emergency | yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R10 |
| Emergency Call Routing Policy (VoLTE is registered) | 1. CS Preferred / : E-Call should be sent via 3G/2G network even though VoLTE is registered. / 2. VoLTE Preferred / : E-Call should be sent via LTE network when VoLTE is registered. | CS | 业务域：Emergeny Call | Device Configuration R56 |
| Support Emergency Call in case of No SIM |   | No | 业务域：Emergeny Call | Device Configuration R57 |
| - Emergency Call | sos or ims | no APN. 380 CS fallback | 业务域：VoWiFi | Device Configuration R76 |
| Emergency Call Routing Policy(VoWiFi is registered) | 1. VoLTE Preferred : E-Call should be sent via LTE network even though VoWiFi is registered. / 2. VoWiFi Preferred : E-Call should be sent via WiFi network when VoWiFi is registered. / 3. No Service Preferred : E-Call should be sent via WiFi network just in case device is in out-of-service area. So If device is in in service area, the E-Call should be sent via cellular network. | no service prefered. 380 CS fallback | 业务域：VoWiFi | Device Configuration R94 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Mobily_Commercial_IMS_Project_Configuration_v4 8_updated_20200310 (3).xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 Mobily 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

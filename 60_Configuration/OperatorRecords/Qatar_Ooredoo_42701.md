---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Ooredoo
mccmnc: "42701"
country: Qatar
source: F:\Codex\Knowledge\运营商参数归档\Ooredoo Qatar VoLTE Details--20241017.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Qatar Ooredoo 42701

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Qatar |
| 运营商 | Ooredoo |
| MCCMNC | `42701` |
| MCC/MNC 证据 | 文件名和表内 IMS 域/APN 资料指向 Ooredoo Qatar；公网确认 Ooredoo Qatar 为 `42701`。原表本身未在前部给独立 MCC/MNC 行。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Qatar Ooredoo 使用 `427 01`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Ooredoo Qatar VoLTE Details--20241017.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、IMS/VoLTE、Emergency、SMS、SRVCC、UT/XCAP、网络信息 |
| 配置前重点 | 原表是三列表格，本文按 `Sheet1` 的 Parameter/Description/Value 保留；MCCMNC 主要依赖文件名和公网确认。 |

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
| MCC MNC | MCC and MNC for LTE | 427 01 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R13 |
| MCC MNC | MCC and MNC for 3G/2G | 427 01 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R14 |
| IMPI | format? | IMSI@ims.mnc001.mcc427.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R34 |
| IMPU | format? | sip:+MSISDN@ims.mnc001.mcc427.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R35 |
| Domain | Pls specify the domain format | ims.mnc001.mcc427.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R36 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| APN for Non-IMS Applications | Multi purpose APN for Data and other services, Specify the services | Data APN | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R2 |
| ipv4,ipv6,ipv4v6 for non -IMS APN | Which type we should use for non IMS APN? | IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R3 |
| APN for IMS | APN for IMS services | IMS | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R4 |
| Attach APN | APN that should be used for LTE Attach | Data APN | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R6 |
| APN for XCAP/Ut | Specify APN for Ut Interface? | Data APN (Ut feature is not required for First Stage, Jun'2017 Release) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R7 |
| ipv4,ipv6,ipv4v6 for XCAP/ Ut | Which type we should use for XCAP/ Ut APN | IPv4 (Ut feature is not required for First Stage, Jun'2017 Release) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R8 |
| MTU Size for each supported APN | Please specify the MTU Size for each supported APN, if there is any specific requirement. | IMS APN : MTU Size -1500 bytes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R11 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| ipv4,ipv6,ipv4v6 for IMS | Which type we should use for IMS | IPv6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R5 |
| IMS Registration | Is IMS registertration allowed in 3G, LTE, 2G, All? | Register in LTE only | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R10 |
| VoLTE Default Setting | Should VoLTE be default ON / OFF ? | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R12 |
| ISIM / USIM | Supported Type of SIM for VoLTE | USIM & ISIM | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R15 |
| P-CSCF Discovery | Discovery using Protocol Configuration Option (PCO) OR DHCP | PCO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R16 |
| IMS Registration Retries | Please specify if there is any requirements for number of IMS Re registrations UE should try for failures. Please also mention the reject causes for these retry requirements | The Retry-After header field can be used with a 500 (Server Internal Error) or 503 (Service Unavailable) response to indicate how long the service is expected to be unavailable to the requesting client and with a 404 (Not Found), 413 (Request Entity Too Large), 480 (Temporarily Unavailable), 486 (Busy Here), 600 (Busy), or 603 (Decline) response to indicate when the called party anticipates being available again. The value of this field is a positive integer number of seconds (in decimal) after the time of the r... | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R19 |
| SRVCC | Is SRVCC supported on network?. Also please specify if SRVCC to 2G , 3G , Both are supported | Supported to 2G/3G | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R20 |
| mid Call SRVCC | SRVCC for mid Call scenarios supported? eSRVCC, aSRVCC, bSRVCC, All ? | eSRVCC support | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R21 |
| Is precondition supported ? | Strength :: Required, Supported But mandatory | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R22 |
| P-Early-Media | Does NW requires device to support P-Early-Media? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R24 |
| CMAS over LTE | Supported? | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R25 |
| USIM / ISIM AKA Auth. | IMS AKA authentication and ISIM / USIM based credentials for IMS registration? | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R27 |
| SMS over SGs/CS | Receiving SMS over SGs (EUTRAN) and CS (UTRAN/GERAN) ? | SMS over IMS when VoLTE, and SMS over CS when 3G/2G. SMS over SGs when LTE only (without IMS – for non-Volte phones but supported LTE) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R28 |
| SMS over IMS | Is SMS over IMS supported ? If, yes pls specify the RATs ( LTE, 3G, and 2G ) | SMS over IMS when LTE (when VoLTE regsitered) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R29 |
| SIP Timer Values | 3GPP TS 24.229? T1 - T4 / T1: RTT Estimate / T2: The maximum retransmit interval for non-INVITE requests and INVITE responses / T4: Maximum duration a message will remain in the network | As per standard in 3GPP TS 24.229, T1 - T4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R30 |
| Ringing Timer | At expiry of Ringing Timer device will send SIP 486 with No Response. | For MO, the timer is 45 seconds | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R31 |
| Ringback Timer | At the expiry of Ringback Timer device will send SIP CANCEL | For MT, the timer is 45 seconds in IMS & CS. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R32 |
| SIP Invite time out | Whats the timer value for SIP INVITE timeout, before which network needs to get the response. | In IMS ,the timer is 24 seconds. In CS, the timer is 36 seconds. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R33 |
| Tel URI | Supported? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R37 |
| SIP URI | Supported? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R38 |
| GBA_ME / GBA_UICC Support | Does NW support GBA_ME or GBA_UICC based authentication ? | GBA_UICC based authentication | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R39 |
| Supplementary Services Configuration over Ut interface | Configuration management of supplementary services over the Ut interface and XCAP as the enabling protocol as described in 3GPP TS 24.623. The Ut interface shall be used on EUTRAN, UTRAN and GERAN. / Applies even when the UE is not IMS registered? | Yes on LTE only, Ut only on IMS registered. (Ut feature is not required for First Stage, Jun'2017 Release) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R40 |
| XCAP Root URI | standard implementation:: defined in 3GPP TS 23.003 R10 section 13.9? | Yes / / Name: bsf.mnc001.mcc427.pub.3gppnetwork.org / Name: xcap.ims.mnc001.mcc427.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R41 |
| NAF & BSF Address | Does network support FQDN based NAF & BSF and standard ports (80) ? / Specify if there is any specific configuration in place | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R42 |
| Reject Causes for Non Provisioned Customers | Which IMS reject causes NW is going to send if a Customer is not provisioned for XCAP and expect UE to do CSFB and try legacy SS | 403 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R43 |
| Call Forwarding | GSMA PRD IR.92 section 2.3.8 / Is Call Forwarding supported over XCAP | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R44 |
| Call Barring | is Call Barring supported over XCAP | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R46 |
| in-call / out-of call SUBSCRIBE for Conf Call | Do you want the SUBSCRIBE to start with a new call ID for Conference calls ? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R47 |
| Serve Multiple CDIV Rules Per Request | Do you prefer UE to send one CDIV Rules per request or multiple. / Yes: would mean UE will UE will send all rules in one request / No: Would mean every PUT request will carry only one rule | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R48 |
| Conference Calling Server | Server address for Conference Calls | yes (part of supplementary services) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R49 |
| Conference Calling Event Package | Supported? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R50 |
| Is VoLTE supported on all above Bands | - | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R57 |
| LTE -> 3G (Handover or Redirection?) | - | Handover | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R60 |
| 3G -> LTE (Handover or Redirection or NONE) | - | N/A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R61 |
| IMS Core Vendor | IMS Core Vendor ( Pls specify all vendors ) | Huawei | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R62 |
| IMS Core SW Ver | IMS Core s/w versions | IMS V500R011 / NE Version CSCF_V500R011C20SPH103 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R63 |
| PCSCF Vendor | PCSCF Vendor | Huawei | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R64 |
| PCSCF SW ver | PCSCF s/w version | V500R002C10 / NE Version SE2900_V500R002C10SPH108 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R65 |
| Application Server Vendor | Pls specify the provider of Application Server of all services | MMTEL,SRVCC/IP-SMS-GW : Huawei / SMS, Missed Call Alert (MCA), Collect Call, Blocked Call, Call Back Roaming, Voicemail : Telenity / Customised Ring Back tone (CRBT), Outbound Dialler (OBD) : 6D Technology | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R70 |
| Media Gateway | Media Gateway ( Pls specify all suppliers of Media GWs in NW ) | Nokia | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R72 |
| Number of Media Gateways | Plesae specify how many media gateways are planned to be in NW ( total number ) | 8 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R73 |
| Media Gateway SW ver | Media Gateway SW ver ( Pls specify SW Ver suppliers of Media GWs in NW ) | v5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R74 |
| VoLTE Provisioning for Customers | Please mention how you will provision customers with VoLTE / ex: will everyone get VoLTE by default or there will be some kind of throttling to IMS PDN Requests | default for 4G data subscribers with VoLTE capabled device | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R77 |
| Speech session setup | 3GPP TS 26.114 sections 6.2.2 and 7.5.2.1 for speech calls? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R79 |
| TFO Support | Do you support Tandem Free Operation? | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R81 |
| TADS support & timer | Do you support terminating access domain selection. If so, whats the timer for which NW remembers the last domain? | TADS Supported, As ATS each time Query to HSS, so there is no such time in ATS to keep TADS record | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R85 |
| Fall Back to CS timer | After how many seconds NW will page the UE on CS if UE is not reachable on IMS | 10s (IMS configuration CS Retry) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R86 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| AMR-NB Codec | GSMA PRD IR.92. Is NB AMR supported for VoLTE calls ? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R82 |
| AMR-WB Codec | GSMA PRD IR.92. Is WB AMR supported for VoLTE calls ? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R83 |
| Codec Rate Adaptation | 3GPP TS 26.114 section 7.3.2. Do you support this (below table)? / / :: Supported DTMF rate: telephone-event/ 8000 , telephone-event/ 16000, BOTH | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R84 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| SIP IPSec | Is SIP IP Sec supported? | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R26 |
| VoLTE to VoWIFI HO | Is VoLTE to VoWIFI HO Supported ? | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R52 |
| Entitlement | Do you support Entitlement for provisioning ? ( if yes, is it for voLTE , VoWIFI , BOTH ? ) | VoLTE | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R89 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency Call Support & APN | Please specify if Emergency Calls over VoLTE are supported ? / If supported over VoLTE which APN should be used | Emergency Call VoLTE is supported but will not be in initial state | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R9 |
| VoLTE to VoWIFI HO of Emergency Call Support | Is VoLTE to VoWIFI HO of Emergency Call Supported | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R53 |

### 网络能力要求

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| LTE Band Freq. | - | 800, 1800, 2600 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R55 |
| LTE Bandwidth | - | 10, 15 /10, 20 (15 MHz on MACRO & 10 MHz on IBS) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Sheet1 R56 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Ooredoo Qatar VoLTE Details--20241017.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| MCC/MNC 原表行 | 本轮未在该工作簿前 89 行看到独立 MCC/MNC 行；配置前建议回查是否存在隐藏/额外资料。 |

## 维护备注

- 这份资料是 Ooredoo 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

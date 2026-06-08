---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Ooredoo
mccmnc: "41903"
country: Kuwait
source: F:\Codex\Knowledge\运营商参数归档
source_files:
  - F:\Codex\Knowledge\运营商参数归档\OKW-All-Settings-4G-5G-VoLTE-VOWIFI.xlsx
  - F:\Codex\Knowledge\运营商参数归档\Ooredoo Kuwait-All-Settings-VoLTE+VoWiFi-20220905.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Kuwait Ooredoo 41903

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Kuwait |
| 运营商 | Ooredoo |
| MCCMNC | `41903` |
| MCC/MNC 证据 | `OKW-VOLTE-config` R20/R21 写 MCC `419`、MNC `003`；`APN Information` R4/R5 也写 MCC `419`、MNC `03`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Kuwait Ooredoo 使用 `419 03`。 |
| 资料文件 | 2 个源文件，见 `原表回查索引`。 |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、MMS、IMS/VoLTE、VoWiFi/ePDG、Emergency、SMS、5G/NR 网络信息 |
| 配置前重点 | `OKW` 与 `Ooredoo Kuwait` 两份表合并记录；如果值冲突，应优先回查更新时间更近或项目指定文件。 |

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
| Opearator name | Ex) Vodafone | Ooredoo Kuwait | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R3 |
| MCC/MNC | Ex) 262/002, 262/009 | 419/03 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R4 |
| MVNO List | Please add MVNO list if operator wants to disable VoIMS for MVNO. / If MVNO uses different MCC/MNC compared to MNO, please add the MCC/MNC list. / If MVNO uses same MCC/MNC, please add GID or subset of the MVNO. / / Ex) 262/002 : Subset = 123, GID = AAA0000 | Please add MVNO list if operator wants to disable VoIMS for MVNO. / If MVNO uses different MCC/MNC compared to MNO, please add the MCC/MNC list. / If MVNO uses same MCC/MNC, please add GID or subset of the MVNO. / / Ex) 262/002 : Subset = 123, GID = AAA0000 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R5 |
| IOT plan | Ex) FUT Plan | Ex) FUT Plan | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R7 |
| Schedule for live network Open(with SRVCC) |   | LIVE | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R13 |
| IMS Server | Description | value | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R17 |
| Operator's IMS infra vendor | Ex) Ericsson | Huawei | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Operator information R18 |
| GRUU | IMPI = IMSI@ims.mnc003.mcc419.3gppnetwork.org / T-IMPU = SIP:IMSI@ims.mnc003.mcc419.3gppnetwork.org / IMPU = sip:965xxxxxxxx@ims.mnc003.mcc419.3gppnetwork.org / tel:+965xxxxxxxx / Domain = ims.mnc003.mcc419.3gppnetwork.org | Yes | 业务域：Voice call | Device Configuration R13 |
| Conference Server URI | as per 3gpp spec TS34.229 | sip:conference@ims.mnc003.mcc419.3gppnetwork.org | 业务域：Voice call | Device Configuration R21 |
| Own URI(Idi) |   | 0IMSI@nai.epc.mnc003.mcc419.3gppnetwork.org | 业务域：VoWiFi | Device Configuration R88 |
| GEO-Header / GEO-Info | PCNI is required / P-Cellular-Network-Info: 3GPP-E-UTRAN-FDD;cell-time=2021-12-26T10:35:14Z;reg-time=2021-12-26T10:35:14Z;utran-cell-id-3gpp=41903a5a20af2e02 / PIDF (Presence Information Data Format) is required / GPS location is required in register and invite messages, below is a sample payload. / <?xml version="1.0" encoding="UTF-8" ?> / <presence xmlns="urn:ietf:params:xml:ns:pidf" xmlns:gp="urn:ietf:params:xml:ns:pidf:geopriv10" xmlns:gml="http://www.opengis.net/gml" xmlns:cl="urn:ietf:params:xml:ns:pidf:ge... | CountryCode+Loc Info | 业务域：VoWiFi | Device Configuration R95 |
| MCC MNC | MCC and MNC for LTE | MCC:419, MNC:003 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R20 |
| MCC MNC | MCC and MNC for 3G/2G | MCC:419, MNC:003 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R21 |
| IMPI | format? | IMSI@ims.mnc003.mcc419.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R46 |
| IMPU | format? | sip:IMSI@ims.mnc002.mcc419.3gppnetwork.org / tel:msisdn / sip:msisdn@ims.mnc002.mcc419.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R47 |
| Domain | Pls specify the domain format | ims.mnc003.mcc419.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R48 |
| Conference Calling Server | Server address for Conference Calls | sip:conference@ims.mnc003.mcc419.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R63 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Ut APN Type |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R35 |
| APN for Non-IMS Applications | Multi purpose APN for Data and other services, Specify the services | action.ooredoo.com | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R7 |
| ipv4,ipv6,ipv4v6 for non -IMS APN | Which type we should use for non IMS APN? | ipv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R8 |
| APN for IMS | APN for IMS services | IMS | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R9 |
| Attach APN | APN that should be used for LTE Attach | action.ooredoo.com | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R11 |
| APN for XCAP/Ut | Specify APN for Ut Interface? | we will use Fall back in initial phase | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R12 |
| ipv4,ipv6,ipv4v6 for XCAP/ Ut | Which type we should use for XCAP/ Ut APN | ipv4, but we will use Fall back in initial phase | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R13 |
| MTU Size for each supported APN | Please specify the MTU Size for each supported APN, if there is any specific requirement. | 1500 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R16 |
| IMS Deregistration Support | Under which conditions you require IMS De registration? / Pls specify if you have any specific requirements around UE performing IMS Deregistration. If there is none then UE will follow standard implementation. | IMS deregistration should be initiated under the following conditions: / 1. UE powers off; / 2. Airplane mode/restart is enabled on UE; / 3. IMS APN or VoLTE is deactivated if such function provided by UE; / 4. before leaving LTE coverage area. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R25 |
| APN Profile: Ooredoo Internet | APN profile from source table | APN=Action.Ooredoo.com; MCC=419; MNC=03; APN type: default; protocol: IPv4/IPv6; Roaming protocol: IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | APN Information C2 |
| APN Profile: Ooredoo MMS | APN profile from source table | APN=mms.ooredoo.com; MCC=419; MNC=03; APN type: mms; protocol: IPv4; Roaming protocol: IPv4; MMSC: http://action.ooredoo.com; MMS proxy: 194.126.53.64; MMS port: 8080 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | APN Information C3 |
| APN Profile: IMS | APN profile from source table | APN=IMS; MCC=419; MNC=03; APN type: ims; protocol: IPv4; Roaming protocol: IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | APN Information C4 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over LTE | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R4 |
| SMS over IMS | VoLTE | SMSoIP | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R7 |
| SRVCC(basesd on 3gpp REL8) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R8 |
| SRVCC(LTE->2G) | VoLTE | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R9 |
| SRVCC(LTE->3G) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R10 |
| aSRVCC(basesd on 3gpp REL10) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R11 |
| eSRVCC(basesd on 3gpp REL10) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R12 |
| Supplemetary Service over IMS | Ut | NO, over Fall-Back | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R13 |
| USSD over IMS | VoLTE | NO, Fall back to 3G | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R15 |
| VoLTE enabled by default |   | Yes | 业务域：Voice call | Device Configuration R5 |
| IMS Registraion Algorithm |   | AKAv1-MD5 | 业务域：Voice call | Device Configuration R6 |
| IMS Authentication Algorithm |   | both | 业务域：Voice call | Device Configuration R7 |
| MTU size for IMS |   | 1500 | 业务域：Voice call | Device Configuration R10 |
| Enable preconditions |   | No | 业务域：Voice call | Device Configuration R14 |
| Display Registration icon |   | Yes | 业务域：Voice call | Device Configuration R15 |
| SIP INVITE error codes triggering CSFB |   | 500,503 same as existing | 业务域：Voice call | Device Configuration R18 |
| Support of TEL URI or SIP URI |   | Both | 业务域：Voice call | Device Configuration R19 |
| Support subscribing to the conference event? |   | Yes | 业务域：Voice call | Device Configuration R22 |
| Conference Call dialog Type |   | In-dialog | 业务域：Voice call | Device Configuration R23 |
| Support VoLTE in Roaming Area |   | Yes | 业务域：Voice call | Device Configuration R29 |
| - Support VoLTE in case of mobile data is disabled in Roaming Area |   | Yes | 业务域：Voice call | Device Configuration R30 |
| Ut GBA Support ? Or not ? |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R36 |
| - GBA Type |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R37 |
| Usage of TLS(SSL) |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R38 |
| Ut XCAP Root URI |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R39 |
| Ut proxy server address |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R40 |
| Ut proxy port |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R41 |
| Ut BSF address (IF Ut support GBA) |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R42 |
| Ut BSF port (IF Ut support GBA) |   | supplementary services fall back to 3G | 业务域：Ut | Device Configuration R43 |
| SS domain preference |   | 1. CS always | 业务域：Ut | Device Configuration R44 |
| Usage of SS CS fallback for HTTP error |   | N/A | 业务域：Ut | Device Configuration R45 |
| Usage of <media> attribute in XCAP |   | N/A | 业务域：Ut | Device Configuration R46 |
| Usage of element PUT request for communication diversion |   | N/A | 业务域：Ut | Device Configuration R47 |
| Support CFNL(Call Forwarding Not Logged-in) |   | N/A | 业务域：Ut | Device Configuration R48 |
| Call waiting is Terminal based or Network based |   | Terminal based | 业务域：Ut | Device Configuration R50 |
| Support Ut in Roaming Area |   | No | 业务域：Ut | Device Configuration R51 |
| - Support Ut in case of mobile data is disabled in Roaming Area |   | No | 业务域：Ut | Device Configuration R52 |
| 2.21 USSD domain preference |   | 1. CS | 业务域：USSD | Device Configuration R54 |
| SMS Fallback to CS |   | No | 业务域：SMS over IMS | Device Configuration R59 |
| ipv4,ipv6,ipv4v6 for IMS | Which type we should use for IMS | ipv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R10 |
| IMS Registration | Is IMS registertration allowed in 3G, LTE, 2G, All? | LTE | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R15 |
| VoLTE Default Setting | Should VoLTE be default ON / OFF ? | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R19 |
| ISIM / USIM | Supported Type of SIM for VoLTE | USIM | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R22 |
| P-CSCF Discovery | Discovery using Protocol Configuration Option (PCO) OR DHCP | PCO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R23 |
| IMS Registration Retries | Please specify if there is any requirements for number of IMS Re registrations UE should try for failures. Please also mention the reject causes for these retry requirements | 32 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R26 |
| SRVCC | Is SRVCC supported on network?. Also please specify if SRVCC to 2G , 3G , Both are supported | SRVCC supported, Only on 3G | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R27 |
| mid Call SRVCC | SRVCC for mid Call scenarios supported? eSRVCC, aSRVCC, bSRVCC, All ? | SRVCC, ESRVCC, ASRVCC, BSRVCC | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R28 |
| Is precondition supported ? | Strength :: Required, Supported But mandatory | Supported-but disabled | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R29 |
| P-Early-Media | Does NW requires device to support P-Early-Media? | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R31 |
| CMAS over LTE | Supported? | Not supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R32 |
| USIM / ISIM AKA Auth. | IMS AKA authentication and ISIM / USIM based credentials for IMS registration? | supported - AKA Authentication enabled USIM based credentials | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R34 |
| SMS over SGs/CS | Receiving SMS over SGs (EUTRAN) and CS (UTRAN/GERAN) ? | Supported, EUTRAN | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R35 |
| SMS over IMS | Is SMS over IMS supported ? If, yes pls specify the RATs ( LTE, 3G, and 2G ) | Yes over LTE | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R36 |
| SIP Timer Values | 3GPP TS 24.229? T1 - T4 / T1: RTT Estimate / T2: The maximum retransmit interval for non-INVITE requests and INVITE responses / T4: Maximum duration a message will remain in the network | based on 3GPP TS 24.229, / T1:2s / T2:16s / T4:17s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R40 |
| Ringing Timer | At expiry of Ringing Timer device will send SIP 486 with No Response. | 90s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R41 |
| Ringback Timer | At the expiry of Ringback Timer device will send SIP CANCEL | 90s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R42 |
| SIP Invite time out | Whats the timer value for SIP INVITE timeout, before which network needs to get the response. | 6s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R43 |
| Tel URI | Supported? | supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R49 |
| SIP URI | Supported? | supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R50 |
| GBA_ME / GBA_UICC Support | Does NW support GBA_ME or GBA_UICC based authentication ? | GBA-ME | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R53 |
| Supplementary Services Configuration over Ut interface | Configuration management of supplementary services over the Ut interface and XCAP as the enabling protocol as described in 3GPP TS 24.623. The Ut interface shall be used on EUTRAN, UTRAN and GERAN. / Applies even when the UE is not IMS registered? | USSD-CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R54 |
| XCAP Root URI | standard implementation:: defined in 3GPP TS 23.003 R10 section 13.9? | USSD-CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R55 |
| NAF & BSF Address | Does network support FQDN based NAF & BSF and standard ports (80) ? / Specify if there is any specific configuration in place | USSD-CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R56 |
| Reject Causes for Non Provisioned Customers | Which IMS reject causes NW is going to send if a Customer is not provisioned for XCAP and expect UE to do CSFB and try legacy SS | USSD-CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R57 |
| Call Forwarding | GSMA PRD IR.92 section 2.3.8 / Is Call Forwarding supported over XCAP | USSD-CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R58 |
| Call Barring | is Call Barring supported over XCAP | USSD-CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R60 |
| in-call / out-of call SUBSCRIBE for Conf Call | Do you want the SUBSCRIBE to start with a new call ID for Conference calls ? | Either new call-id or same call-id will work, currently Samsung S6 use new call-ID, and Mate 7 use same Call-id, IMS support both. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R61 |
| Serve Multiple CDIV Rules Per Request | Do you prefer UE to send one CDIV Rules per request or multiple. / Yes: would mean UE will send all rules in one request / No: Would mean every PUT request will carry only one rule | One Rule / According to IR.92: The UE must configure settings of one supplementary service only per XCAP request. If the supplementary service to be configured contains a <ruleset> element with multiple <rule> elements as defined in IETF RFC 4745 [73] (e.g. as for Communication Diversion (CDIV), Communication Barring (CB)), then the UE must modify at most one <rule> element of the supplementary service per XCAP request | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R62 |
| Conference Calling Event Package | Supported? | Supported, UE send Subscribe to IMS core, when conference call event happens, IMS core will send Notify to UE | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R64 |
| inter RAT | LTE -> 3G (Handover or Redirection?) | Redirection | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R79 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Video over LTE | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R5 |
| Upgrade from VoLTE to ViLTE / Downgrade from ViLTE to VoLTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R6 |
| Enable rtcp on active call |   | Enable | 业务域：Voice call | Device Configuration R16 |
| AMR type |   | AMR WB;AMR NB, EVS-WB, EVS-SWB | 业务域：Voice call | Device Configuration R24 |
| - AMR-WB mode-set |   | 0,1,2,8 | 业务域：Voice call | Device Configuration R25 |
| - AMR-NB mode-set |   | 0,1,2,3,4,5,6,7 | 业务域：Voice call | Device Configuration R26 |
| Audio Codec Mode |   | Bandwidth efficiency | 业务域：Voice call | Device Configuration R27 |
| DTMF Codec Mode |   | Outband | 业务域：Voice call | Device Configuration R28 |
| Video Codec(format) |   | H.264 | 业务域：Video Call | Device Configuration R32 |
| EVS enable |   | Yes | 业务域：EVS | Device Configuration R61 |
| HF-Only |   | 0 | 业务域：EVS | Device Configuration R62 |
| dtx |   | Enabled | 业务域：EVS | Device Configuration R63 |
| dtx-recv |   | Enabled | 业务域：EVS | Device Configuration R64 |
| cmr |   | 0 | 业务域：EVS | Device Configuration R65 |
| EVS primary mode |   | EVS primary mode | 业务域：EVS | Device Configuration R66 |
| - br |   | 5.9 ~ 24.4 (kbps) | 业务域：EVS | Device Configuration R67 |
| - bw |   | WB-SWB | 业务域：EVS | Device Configuration R68 |
| - ch-aw-recv |   | -1 | 业务域：EVS | Device Configuration R69 |
| MediaTimeout | RTP / RTCP Time out value ( Default value is 10s ) | This timer is configurable, we will set it as 10s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R39 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over WiFi via ePDG | VoWIFI | Y | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R4 |
| Video over LTE | VoWIFI | Y | N | VoWiFi Feature R5 |
| Upgrade from VoLTE to ViLTE / Downgrade from ViLTE to VoLTE | VoWIFI | Y | N | VoWiFi Feature R6 |
| SMS over IMS | VoWIFI | Y | N | VoWiFi Feature R7 |
| MMS over ePDG | MMS | Y | N | VoWiFi Feature R8 |
| Supplemetary Service over ePDG | XCAP | Y | N | VoWiFi Feature R9 |
| Support IPSec or not |   | Yes | 业务域：Voice call | Device Configuration R8 |
| - Encryption Algorithm for IPSec |   | all | 业务域：Voice call | Device Configuration R9 |
| VoWiFi enable by default |   | Yes | 业务域：VoWiFi | Device Configuration R71 |
| Support APN list Name |   | Yes | 业务域：VoWiFi | Device Configuration R72 |
| - IMS |   | IMS | 业务域：VoWiFi | Device Configuration R73 |
| - UT |   | NA | 业务域：VoWiFi | Device Configuration R74 |
| - MMS |   | NA | 业务域：VoWiFi | Device Configuration R75 |
| Preferred mode |   | LTE preffered | 业务域：VoWiFi | Device Configuration R77 |
| ePDG address |   | epdg.epc.mnc003.mcc419.pub.3gppnetwork.org | 业务域：VoWiFi | Device Configuration R78 |
| ePDG Security parameters |   | IKEv2 | 业务域：VoWiFi | Device Configuration R79 |
| - IKE Encryption |   | AES-CBC-256 | 业务域：VoWiFi | Device Configuration R80 |
| - IKEv2 Integrity |   | HMAC-SHA2-512 | 业务域：VoWiFi | Device Configuration R81 |
| - IKEv2 Diffie-Hellman Group |   | Group 14 (2048-bit) | 业务域：VoWiFi | Device Configuration R82 |
| - IPSec encryption |   | AES-CBC-256 | 业务域：VoWiFi | Device Configuration R83 |
| - IPSec integrity |   | HMAC-SHA2-512 | 业务域：VoWiFi | Device Configuration R84 |
| - IPSec Group |   | Group 14 (2048-bit) | 业务域：VoWiFi | Device Configuration R85 |
| IKE Rekeying timer |   | 86400 | 业务域：VoWiFi | Device Configuration R86 |
| IPsec Rekeying timer |   | 86400 | 业务域：VoWiFi | Device Configuration R87 |
| Subnet Type |   | IPv4 | 业务域：VoWiFi | Device Configuration R89 |
| Vendor Attribute (IPv4 / IPv6) |   | IPv4 | 业务域：VoWiFi | Device Configuration R90 |
| Enable preconditions |   | No | 业务域：VoWiFi | Device Configuration R91 |
| ePDG Provider |   | Huawei | 业务域：VoWiFi | Device Configuration R92 |
| Display Registration icon |   | Yes | 业务域：VoWiFi | Device Configuration R93 |
| Airplane mode / This feature represent VoWIFI support/not support while airplane mode is on |   | Enable VoWiFi | 业务域：VoWiFi | Device Configuration R96 |
| SIP IPSec | Is SIP IP Sec supported? | supported- | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R33 |
| VoLTE to VoWIFI HO | Is VoLTE to VoWIFI HO Supported ? | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R67 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency Call over IMS | Emergency Call | NO, Fall back to 3G | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE General Feature R14 |
| Emergency Call over ePDG | Emergency | CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiFi Feature R10 |
| Emergency Call Routing Policy (VoLTE is registered) |   | 1. CS Preferred | 业务域：Emergeny Call | Device Configuration R56 |
| Support Emergency Call in case of No SIM |   | No | 业务域：Emergeny Call | Device Configuration R57 |
| - Emergency Call |   | IMS | 业务域：VoWiFi | Device Configuration R76 |
| Emergency Call Routing Policy(VoWiFi is registered) |   | 1. CS Preferred | 业务域：VoWiFi | Device Configuration R94 |
| Emergency Call Support & APN | Please specify if Emergency Calls over VoLTE are supported ? / If supported over VoLTE which APN should be used | CSFB for emergency call | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R14 |
| VoLTE to VoWIFI HO of Emergency Call Support | Is VoLTE to VoWIFI HO of Emergency Call Supported | CSFB for emergency call | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | OKW-VOLTE-config R68 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\OKW-All-Settings-4G-5G-VoLTE-VOWIFI.xlsx` | Ooredoo Kuwait 的 APN、IMS、VoLTE、VoWiFi/ePDG、Emergency 和 5G 网络参数。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |
| `F:\Codex\Knowledge\运营商参数归档\Ooredoo Kuwait-All-Settings-VoLTE+VoWiFi-20220905.xlsx` | Ooredoo Kuwait 的 APN、IMS、VoLTE、VoWiFi/ePDG、Emergency 和 5G 网络参数。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 Ooredoo 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

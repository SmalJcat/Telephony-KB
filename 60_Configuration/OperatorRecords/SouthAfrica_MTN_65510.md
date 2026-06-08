---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: MTN
mccmnc: "65510"
country: South Africa
source: F:\Codex\Knowledge\运营商参数归档\Minimum_Device_Specification_2023_H1_v1 - Copy.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# South Africa MTN 65510

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | South Africa |
| 运营商 | MTN |
| MCCMNC | `65510` |
| MCC/MNC 证据 | 原表 `APN Settings` R14/R15 写 MCC `655`、MNC `10`；`VoLTE + VoWiFi` R89 写 MCC MNC `655-10`。 |
| 公网查证 | 公开 MCC/MNC 资料显示 South Africa MTN 使用 `655 10`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Minimum_Device_Specification_2023_H1_v1 - Copy.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、MMS、IMS/VoLTE、VoWiFi/ePDG、Emergency、SMS、LTE/NR 能力、SIM/eSIM |
| 配置前重点 | 这是 MTN SA 最小设备规格，包含大量终端能力要求；本文已过滤 CA 明细，配置前仍需区分“设备能力”与“运营商参数”。 |

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
| Domain Name | Home network domain name: derived from IMSI (as per 3GPP TS 23.003) | ims.mnc010.mcc655.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R34 |
| Private URI (IMPI) | Private User Identity: derived from IMSI (as per 3GPP TS 23.003) | <imsi>@ims.mnc010.mcc655.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R35 |
| Public URI (IMPU) | Public User Identitiy: sip and tel URI supported (as per 3GPP TS 23.003 / GSM IR.92) | sip:+<msisdn>@ims.mnc010.mcc655.3gppnetwork.org;user=phone / tel:+<msisdn> / Note: one exception is for SMSoIP which requires the 'user=phone' SIP format to be used. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R36 |
| Temporary Public URI (IMPU) | Temporary Public User Identitiy: derived from IMSI (as per 3GPP TS 23.003) | sip:<imsi>@ims.mnc010.mcc655.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R37 |
| VoWiFi: Own URI (IDi) | Specifies the format of the IDi that should be used in the IKEv2 authentication message(s). ID_RFC822_ADDR is the 3GPP standard IDi format; see Root NAI for EAP-AKA in 3GPP TS 23.003 | ID_RFC822_ADDR: 0<imsi>@nai.epc.mnc010.mcc655.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R38 |
| Conference Server URI | Default Conference Factory URI for MMTel; constructed as per 3GPP TS 23.003 | sip:mmtel@conf-factory.ims.mnc010.mcc655.3gppnetwork.org | Conf_Factory_URI；none - construct as per 3GPP TS 23.003 | VoLTE + VoWiFi R83 |
| MCC MNC | MCC and MNC for 2G/3G/LTE | 655-10 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R89 |
| RAT Preference in Home country | What is the preferred RAT at home? | WiFi Preferred | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R101 |
| Country of Origin | Geo-location header in SIP message provides country of origination. Is country of origination needed in SIP messages? | PANI is optional but preferred | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R103 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Internet: APN | General bearer services APN | myMTN | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R5 |
| IMS: APN | IMS APN | ims | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R8 |
| IMS: Disable with Mobile Data | Should the IMS APN be disabled with mobile data? | No | 3GPP_PS_data_off/MMTEL_voice_exempt；1 - Indicates that the MMTEL voice is a 3GPP PS data off exempt service | VoLTE + VoWiFi R11 |
| XCAP/Ut: Connection Name | XCAP/UT connection name | MTN HOS (Note: APN should be visible but not editable on the device) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R12 |
| XCAP/Ut: APN | XCAP/UT APN | hos | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R13 |
| XCAP/Ut: APN Type | APN Type | xcap | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R14 |
| XCAP/Ut: IP Version | IP version is supported (IPv4, IPv6, IPv4v6) | IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R15 |
| Attach APN | APN that should be used for LTE Attach | myMTN | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R19 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| IMS: IP Version | IP version is supported (IPv4, IPv6, IPv4v6) | IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R9 |
| IMS Registration Method | IMS Registration Authentication algorithm? (AKAv1-MD5 / AKAv2-MD5 / MD5) | AKAv1-MD5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R22 |
| Ut Authentication Algorithm |   | MD5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R24 |
| GBA Authentication Method | GBA-ME or GBA-UICC authentication method? | GBA-ME | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R25 |
| Timer_T1 | An estimate for the round trip time in the system (UE – P-CSCF); set as per 3GPP TS 24.229 | Between IM CN subsystem elements: 500ms. Applied at UE and at the P-CSCF toward a UE: 2s | Timer_T1；2000 (milliseconds) | VoLTE + VoWiFi R44 |
| Timer_T2 | An estimate for the maximum retransmit interval for non-INVITE requests and INVITE responses; set as per 3GPP TS 24.229 | Between IM CN subsystem elements: 4000ms. Applied at UE and at the P-CSCF toward a UE: 16s | Timer_T2；16000 (milliseconds) | VoLTE + VoWiFi R45 |
| Timer_T4 | An estimate for the maximum duration a message will remain in the network; set as per 3GPP TS 24.229 | Between IM CN subsystem elements: 5000ms. Applied at UE and at the P-CSCF toward a UE: 17s | Timer_T4；17000 (milliseconds) | VoLTE + VoWiFi R46 |
| SIP Preconditions used | Are SIP preconditions required? | Yes | Precondition_disabling_policy；0 - the UE is allowed to use the precondition mechanism | VoLTE + VoWiFi R47 |
| Sending SIP 18x reliably | Whether SIP 18x responses (other than SIP 183 response) against an INVITE request subject to the IMS service are to be sent reliably? | Yes - Send 18x reliably (GSMA IR.92 default) | Send_18x_Reliably；1 – Indicates that the SIP 18x responses (other than SIP 183 response) are to be sent reliably | VoLTE + VoWiFi R49 |
| SUBSCRIBE to Registration Event Package | Should the UE subscribe to the registration event package (as defined in 3GPP TS 24.229) | Yes - the network supports and the UE should subscribe to the registration event package as per GSMA IR.92v11 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R50 |
| IMS Registration Retries | Requirements around retries if UE fails to register | base-time = 30 sec / max-time = 300 sec (IR.92 default) or 1800 sec (RFC 5626 default) | RegRetryBaseTime / RegRetryMaxTime；30 sec / 300 sec (IR.92 default) or 1800 sec (RFC 5626 default) | VoLTE + VoWiFi R51 |
| IMS Deregistration Support |   | Periodic re-registration required; network initiated deregistration occurs due to registration timer expiry. When UE moves to CS (2G/3G) it will remain IMS registered (until registration timer expiry). | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R52 |
| Session Expiry | Session expiry timer; the session interval for a SIP session | The network allows session expiry between 900s (minSE) and 1800s; preference is for device to use 900 seconds. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R53 |
| Ringing Timer | At expiry of UE's Ringing Timer, device expected to send SIP 486 with No Response | Device ringing timer >= 40s (Network no reply timer is 30s, and CDiv timer is 20s) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R55 |
| Ringback Timer | At expiry of Ringback Timer, device expected to send SIP CANCEL . | Device ringback timer >= 40s (Network no reply timer is 30s, and CDiv timer is 20s) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R56 |
| SIP Invite Timeout | The timer value for SIP INVITE timeout, before which network needs to get the response. | Timer B = 64*T1 (INVITE transaction timeout timer in RFC 3261) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R57 |
| MTU Size | Path MTU size within the MTN network? | 1450 (take note of the next point for TCP/UDP Method) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R58 |
| SIP TCP/UDP Method | Should TCP or UDP be used for SIP messages? | Access network supports UDP/TCP. Device should use either UDP-only (segmenting as per path MTU), or UDP-preferred as per IETF RFC 3261 for SIP i.e. if a SIP request is within 200 bytes of the path MTU (1450 bytes), so larger than 1250 bytes, the request must be sent using TCP. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R59 |
| P-CSCF Discovery | Discovery using Protocol Configuration Option (PCO) OR DHCP? | PCO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R60 |
| Early Media | Does the network require the device to support P-Early-Media? | Yes (Network Provided Ringback Tone must be supported) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R61 |
| T-ADS (Terminating-Access Domain Selection) | Network will page the UE in CS if its not reachable over IMS? (Refer to GSMA IR.64) | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R63 |
| CS Fallback Timeout | For MT Calls what is the NW timeout before paging on Cellular? | 8001 ms | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R64 |
| GRUU | Support for GRUU ( Globally Routable User agent URIs) | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R65 |
| GBA_ME / GBA_UICC Support | Does NW support GBA_ME or GBA_UICC based authentication ? | GBA_ME | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R68 |
| GBA BSF server url/fqdn | Bootstrapping Server Function (BSF) address for USIM; as per 3GPP TS 23.003 | bsf.mnc010.mcc655.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R69 |
| XCAP server url/fqdn | XCAP Root (HTTP) URI on Ut interface for USIM; as per 3GPP TS 23.003 | xcap.ims.mnc010.mcc655.pub.3gppnetwork.org | XCAP Root URI；Constructed as per 3GPP TS 23.003 | VoLTE + VoWiFi R71 |
| XCAP port |   | 8080 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R72 |
| XCAP AUID | The Application Unique ID (AUID) allocated to the supplementary services XCAP application (as per 3GPP 24.623) | simservs.ngn.etsi.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R73 |
| Reject Causes for Non Provisioned Customers |   | All VoLTE customers will be provisioned for XCAP. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R74 |
| Call Waiting | Network based or terminal based communication waiting? | Network Based (UE must include the alert-info header in the SIP 180 Ringing response to a call subject to call waiting) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R75 |
| Call Forwarding | Is Communication Diversion (CDIV) supported over XCAP? (As per GSMA IR.92 section 2.3.8) | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R76 |
| Call Barring | Is Communication Barring supported over XCAP? (As per GSMA IR.92 section 2.3.9) | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R78 |
| USSD | Is USSD over IMS supported? | No / Note: Support for USSD over IMS (USSI) to be introduced in Q4 2022; device requirement to be enforced once commercialised. / If VoLTE registered, the UE must use USSD over IMS, otherwise the UE must use the CS domain. | 3GPP_PS_data_off/USSI_exempt；1 - Indicates that USSI is a 3GPP PS data off exempt service | VoLTE + VoWiFi R80 |
| Conference Calling Event Package | Supported? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R82 |
| REFER to user/conference focus | Should remote user be invited to the three-way session by sending a SIP REFER request to the user, or by sending a SIP REFER request to the conference focus? | REFER to conference focus (as per GSMA IR.92v11.0) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R84 |
| SUBSCRIBE In-dialog/Out-of-dialog | Should SIP SUBSCRIBE to conference state events be sent inside or outside the existing SIP INVITE dialog between the UE and the conference server (i.e. with existing or new Call-ID)? | In-dialog (as network has pre-3GPP Release 12 MTAS support). Note that SUBSCRIBE requests outside the existing INVITE dialog are rejected by a 403 (Forbidden) response, which requires UEs compliant to GSMA IR.92v11.0 to send an in-dialog SUBSCRIBE request. Note, too, that it is optional for UEs to subscribe to conference state events (in line with GSMA IR.92), although this is preferred. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R85 |
| VoLTE Default Setting | Should VoLTE be ON / OFF by default? | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R88 |
| CMAS over LTE | Commercial Mobile Alert System (CMAS) -Support? | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R92 |
| eSRVCC/aSRVCC/bSRVCC | Required SRVCC handover support for mid-call, alerting and pre-alerting (refer to GSMA IR.64) | Yes - eSRVCC, aSRVCC, bSRVCC support required | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R93 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice and/or Video allowed | Are both voice and video calling allowed? | Yes, Voice only (not Video) | Media_type_restriction_policy；Voice only allowed | VoLTE + VoWiFi R41 |
| Voice and/or Video allowed while roaming | Are both voice and video calling allowed while roaming? | Yes, Voice only (not Video) | Media_type_restriction_policy；Voice only allowed | VoLTE + VoWiFi R42 |
| RTCP | RTCP supported? | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R62 |
| DTMF Events | Support for DTMF events using the telephone-event codec | UE must support DTMF events as per GSMA IR.92v11 / UE should convert telephone events into audible DTMF tone-pairs (when forwarded as telephone events to the (remote) MTSI client in terminal) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R114 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| IMS: Connection Name | IMS connection name (for VoLTE and VoWiFi/ePDG) | MTN IMS (Note: APN should be visible but not editable on the device) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R7 |
| IMS: Registration | On what RAT is IMS registration allowed (2G,3G,LTE,WiFi)? | LTE and WiFi only | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R10 |
| Supported SIM Type | Supported SIM type for VoLTE + VoWiFi | USIM | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R21 |
| IMS Authentication & Encryption Algorithms | IPSec authentication & encryption algorithms supported for IMS Authentication? | alg:hmac-md5-96;ealg:aes-cbc & alg:hmac-sha-1-96;ealg:aes-cbc | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R23 |
| VoWiFi ePDG: IPSec Support | Support for IPSec for VoWiFi to ePDG? | Yes (for VoWiFi only; UE must not enforce certificate based authentication to the ePDG) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R26 |
| VoWiFi ePDG: IKE Version | Internet Key Exchange (IKE) version | IKEv2 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R27 |
| VoWiFi ePDG: IPSec Encryption Algorithm | Encryption algorithm for both IKE and Child SA | AES-128, AES-256 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R28 |
| VoWiFi ePDG: IPSec Integrity Algorithm | Integrity algorithm for both IKE and Child SA | SHA2-256, SHA2-384, SHA2-512 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R29 |
| VoWiFi ePDG: IPSec PRF Algorithm | Pseudorandom function (PRF) algorithm used to generate keys within IKEv2 | SHA2-256, SHA2-512 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R30 |
| VoWiFi ePDG: IPSec Diffie-Hellman Group | IPSec DH Group | 1-5, 14-18 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R31 |
| VoWiFi ePDG: IPSec/IKE Life Time | IPSec re-keying timer | 86400 sec | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R32 |
| VoWiFi: Remote URI (IDr) | Specifies the format of the IDr that should be used in the IKEv2 authentication message(s) | ID_KEY_ID | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R39 |
| SMS over IMS (SMSoIP) | Is SMS over IMS (SMSoIP) supported and on which RATs (2G, 3G, LTE, WiFi)? | Yes, on LTE and WiFi (only when the PS domain is being used for Voice services too, otherwise use the CS domain). The network also supports SMS over SGs (EUTRAN) and CS (UTRAN/GERAN) | SMS_Over_IP_Networks_Indication / SMSoIP_usage_policy / 3GPP_PS_data_off/SMSoIP_exempt；1 – Indicates that the SMS service is preferred to be invoked over the IP networks / 0 – Indicates that SMS over IP is used only if voice over PS is available and only on the IP-CAN bearer that is used for the transport of SIP signalling associated with voice over PS / 1 - Indicates that the SMS over IP is a 3GPP PS data off exempt service | VoLTE + VoWiFi R43 |
| Supplementary Services Configuration over Ut interface | The domain/RAT on which the Ut interface will be used | On LTE and WiFi (only when the PS domain is being used for Voice services too, otherwise use the CS domain). | SS_domain_setting / AccessForXCAP / 3GPP_PS_data_off/SS_XCAP_config_exempt；2 - Indicates that the UE uses the PS domain for SS setting control when the PS domain is being used by the UE for voice services, and the UE uses the CS domain for SS setting control when the CS domain is being used by the UE for voice services / 0 - any access type ...OR... 5 - 3GPP accesses preferred, EPC via WLAN IP-CAN as secondary / 1 - Indicates that the SS configuration via XCAP is a 3GPP PS data off exempt service | VoLTE + VoWiFi R67 |
| ePDG address/fqdn | Operator Identifier based ePDG FQDN; constructed as per 3GPP TS 23.003 | FQDN epdg.epc.mnc010.mcc655.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R95 |
| ePDG DPD (Keep Alive) | Dead Peer Detection timer? How many retries will be attempted and the retry interval? | 3600 sec. 5 retries with 10 seconds interval | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R96 |
| Carrier WiFi Name | Name displayed on UI when device is IMS registered over Wi-Fi | VoWiFi | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R97 |
| On/Off Menu | Provide the aility to enable/disable VoWiFi | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R98 |
| Airplane Mode Enabled | VoWiFi to be enabled whilst in Airplane mode | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R99 |
| Roaming Enabled | VoWiFi to be enabled whilst roaming | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R100 |
| RAT Preference while Roaming | What is the preferred RAT while roaming? | WiFi Preferred | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R102 |
| VoLTE<->VoWiFi Handover Support |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R106 |
| WiFi Weak Signal Reference Value | Recommended VoWiFi rove-in and rove-out ranges | Rove-in Range: -70dBm to -73dBm, Rove-out Range: -79dBm to -82dBm | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R107 |
| Voice Codecs Required | Codecs required to be supported by the UE for VoLTE/VoWiFi | AMR(-NB), AMR-WB and EVS (complying to GSMA IR.92v11.0) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R110 |
| AMR/AMR-NB modes | AMR/AMR-NB modes required to be supported by the UE for VoLTE/VoWiFi | No mode-set specified in INVITE i.e. support all eight (8) modes and source rate controlled operations (as required by GSMA IR.92). When responding to an SDP Offer accepting AMR, use the RateSet recommended in GSMA IR.92v11.0 in the SDP answer ("mode-set = 0,2,4,7") | RateSet for AMR；0,2,4,7 ("mode-set = 0,2,4,7" included in the SDP answer) | VoLTE + VoWiFi R111 |
| AMR-WB modes | AMR-WB modes required to be supported by the UE for VoLTE/VoWiFi | No mode-set specified in INVITE i.e. support all nine (9) modes and source controlled rate operation (as required by GSMA IR.92). When responding to an SDP Offer accepting AMR-WB, use the RateSet recommended in GSMA IR.92v11.0 in the SDP answer (i.e. no mode-set included) | RateSet for AMR-WB；Undefined (no mode-set parameter included in the SDP answer) | VoLTE + VoWiFi R112 |
| EVS modes | EVS modes required to be supported by the UE for VoLTE/VoWiFi | UEs supporting SWB must conform to GSMA IR.92v11.0 (Section 2.4.3.3); ch-aw-recv should be included in the SDP with a non-zero, positive value (2 recommended). UEs not supporting SWB must support WB and should apply the same principles in GSMA IR.92v11.0 (Section 2.4.3.3) to the WB (rather than SWB) case. As per GSMA IR.92v11.0, "SDP parameters other than br, bw, max-red and ch-aw-recv must not be included in a media format description associated with the EVS codec within the initial SDP offer". Note that Premiu... | EVS/Br / EVS/Bw / ICM/INIT_PARTIAL_REDUNDANCY_OFFSET_RECV；5.9-13.2 or 5.9-24.4 (recommended) / nb-swb (recommended) / 2 (recommended) | VoLTE + VoWiFi R113 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency: Connection Name | Emergency call connection name | MTN SOS (Note: APN should be visible but not editable on the device). / Note: MTN SOS is commerically launched in December 2022. / Note: MTN SOS APN must be implement from Janaury 2023. This is mandatory. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R16 |
| Emergency: APN | Emergency call APN | sos | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R17 |
| Emergency: IP Version | IP version is supported (IPv4, IPv6, IPv4v6) | IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R18 |
| Emergency Call over VoLTE | Expected behaviour when Emergency call made while registered on VoLTE | Initiate CS Fallback; Emergency calls not supported on VoLTE / Note: MTN SOS is commerically launched in December 2022 / Note: MTN SOS APN must be implement from Janaury 2023. This is mandatory. / VoLTE Preferred; Emergency calls should be sent via the LTE network when VoLTE registered. / The UE must convey its location, using the “Geolocation” header field and the PIDF location object in the initial SIP INVITE (sos) request for an IMS emergency session. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R90 |
| Non-UE detectable Emergency Call over VoLTE | When the UE receives the session rejection by means of 380 Alternative Service then should the UE dial back to IMS with that number now marked as Emergency? | Note: MTN SOS is commerically launched in December 2022 / Note: MTN SOS APN must be implement from Janaury 2023. This is mandatory. / The device must support the 380 Alternative Service as per GSMA IR.92v11.0 & 3GPP 24.229. / Note that the network may provide the UE with a list of local emergency numbers during the ATTACH/TAU NAS procedures to avoid the occurrence of non-UE detected emergency call. / Note: Legacy IMS devices will still need to be supported using the 380 Alternative Service mechanism to trigger C... | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R91 |
| Emergency Call over VoWiFi | Expected behaviour when Emergency call made while registered on VoWiFi | If UE is registered on the mobile network then initiate CS Fallback; Emergency calls not supported on VoWiFi / Note: MTN SOS is commerically launched in December 2022 / Note: MTN SOS APN must be implement from Janaury 2023. This is mandatory. / No Service Preferred: Emergency Calls should be sent via WiFi network only in the case that the device is in the out-of-service area of the cellular network. If the device is in the service area of the cellular network, the Emergency Call should be sent via the cellular n... | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R104 |
| Non-UE detectable Emergency Call over VoWiFi | When the UE receives the session rejection by means of 380 Alternative Service then should the UE dial back to IMS with that number now marked as Emergency? | Note: MTN SOS is commerically launched in December 2022 / Note: MTN SOS APN must be implement from Janaury 2023. This is mandatory. / The device must support the 380 Alternative Service as per GSMA IR.92v11.0 & 3GPP 24.229. / Note that the network may provide the UE with a list of local emergency numbers during the ATTACH/TAU NAS procedures to avoid the occurrence of non-UE detected emergency call. / Note: Legacy IMS devices will still need to be supported using the 380 Alternative Service mechanism to trigger C... | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE + VoWiFi R105 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Minimum_Device_Specification_2023_H1_v1 - Copy.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 MTN 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

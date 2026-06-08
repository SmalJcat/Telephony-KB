---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: UNITEL
mccmnc: "63102"
country: Angola
source: F:\Codex\Knowledge\运营商参数归档\UNITEL VOLTE NETWORK PARAMETERSDEC 2019(1).xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Angola UNITEL 63102

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Angola |
| 运营商 | UNITEL |
| MCCMNC | `63102` |
| MCC/MNC 证据 | 原表 `VoLTE config` R4 写 MCC MNC list `631 02`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Angola UNITEL 使用 `631 02`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\UNITEL VOLTE NETWORK PARAMETERSDEC 2019(1).xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、EVS、ViLTE、媒体/Codec |
| 配置前重点 | 原表部分 URI 似乎把 MCC/MNC 写成 `mnc631.mcc02`，与标准 `mnc002.mcc631` 不一致；配置前必须复核域名。 |

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
| MCC MNC list | Operator Card MCC MNC list | 631 02 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R4 |
| HomeDomainName | HomeDomainName | ims.mnc631.mcc02.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R22 |
| IMPI | IMPI | <IMSI>@ims.mnc631.mcc02.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R23 |
| IMPU | IMPU | sip:<IMSI>@ims.mnc631.mcc02.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R24 |
| Conference URI | Does the network have customized conference server URI? / If no, the UE will follow the specification of TS 23.003. / If yes, please give the conference server URI. | sip:mmtel@conf-factory.ims.mnc631.mcc02.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R41 |
| MCC MNC list | Operator Card MCC MNC list |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R4 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Ims apn name | Ims apn name | ims.unitel.co.ao | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R7 |
| Ims apn ip type | Ims apn ip type | ipv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R8 |
| PDN for SS configuration | APN for SS configuration, if differs from default apn, please specify APN name | internet / IMS | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R48 |

### IMS 与 VoLTE

| Requirement Name                       | Requirement Description                                                                                                                                                                                                                                                      | Requirement Value                         | 备注                         | 来源               |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | -------------------------- | ---------------- |
| ISIM / USIM                            | Supported Type of SIM for VoLTE                                                                                                                                                                                                                                              | USIM                                      | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R5  |
| Precondition                           | If this parameter is set to "true" then the client will ask the network to perform "resource reservation" before setting up the call.                                                                                                                                        | ON                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R12 |
| TCP Threshhold                         | IF SIP size > TCP Threshhold, IMS will use TCP to send this SIP message, otherwise use UDP, such as 1300                                                                                                                                                                     | 1500                                      | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R15 |
| TEL/SIP URI for sms                    | This parameter defined the format used in outgoing SMS messages                                                                                                                                                                                                              | TEL                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R17 |
| SMS over IMS                           | Support SMS over IMS or not                                                                                                                                                                                                                                                  | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R18 |
| SMS over SGs/CS                        | Support SMS over SGs or not                                                                                                                                                                                                                                                  | YES                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R19 |
| IMS Reg maintenance with 2/3G          |                                                                                                                                                                                                                                                                              | OFF                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R20 |
| No Precondition support 183            | If network don't support precondition, UE still response 183 when as MT                                                                                                                                                                                                      | NO                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R21 |
| DeregIMSWhenFallBackTo3G               | Should UE dereg IMS before fallback to 3G                                                                                                                                                                                                                                    | No                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R26 |
| CallRejectCode                         | This parameter is defining the SIP error message to be returned by the MT party when an incoming call is rejected.                                                                                                                                                           | 486                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R27 |
| Call Hold Tone                         | This parameter is defining whether the tone played when a call is put on hold shall be played by the network or by the client                                                                                                                                                | "Network"                                 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R28 |
| SRVCC                                  | SRVCC                                                                                                                                                                                                                                                                        | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R34 |
| mid-SRVCC                              | mid-call srvcc                                                                                                                                                                                                                                                               | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R35 |
| aSRVCC                                 | alerting SRVCC                                                                                                                                                                                                                                                               | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R36 |
| bSRVCC                                 | before alerting SRVCC                                                                                                                                                                                                                                                        | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R37 |
| SRVCC to 3G                            | SRVCC to 3G                                                                                                                                                                                                                                                                  | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R38 |
| SRVCC to 2G                            | SRVCC to 2G                                                                                                                                                                                                                                                                  | Yes                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R39 |
| ConfSrvccCheckMidCallCapability        | Support Check MidCall capability when Conference call SRVCC                                                                                                                                                                                                                  | NO                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R42 |
| ReferInDialog                          | Does the network expect the UE use the same dialog with the conference call to construct the REFER request to pull members?                                                                                                                                                  | in-dialog                                 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R43 |
| SS configuration through RAT           | 4G VoLTE                                                                                                                                                                                                                                                                     | UT                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R45 |
| UT Authentication method               | Does NW support GBA_ME or GBA_UICC based authentication ?                                                                                                                                                                                                                    | GBA                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R52 |
| XCAP configuration                     | XCAP Root URI / By default, use MCC MNC splice into root URI follow Protocol specification: / xcap.ims.mncXXX.mccXXX.pub.3gppnetwork.org / Otherwise please provide the XCAP Root URI                                                                                        | xcap.ims.mnc631.mcc02.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R53 |
| UssdOverIms                            | USSD over IMS or CS?                                                                                                                                                                                                                                                         | CS                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R62 |
| HD Icon when IMS reg                   | Display VoLTE icon in status bar when IMS registration is successful                                                                                                                                                                                                         | 1                                         | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R69 |
| HD Icon when in-call                   | Display VoLTE icon when in-call                                                                                                                                                                                                                                              | 1                                         | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R70 |
| HD Icon in call history                | Display VoLTE icon in call history                                                                                                                                                                                                                                           | 1                                         | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R71 |
| HD Icon in dailer button               | Display VoLTE icon in dailer button                                                                                                                                                                                                                                          | 0                                         | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R72 |
| VoLTE calls Default Setting            | Volte switch in Setting to default enable or disable                                                                                                                                                                                                                         | ON                                        | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R74 |
| Is VoLTE calls display in Setting menu | Is VoLTE calls display in Setting menu                                                                                                                                                                                                                                       | 1                                         | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R75 |
| Indicate User when turning off VoLTE.  | Indicate User when turning off VoLTE.                                                                                                                                                                                                                                        | YES                                       | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R76 |
| P-CSCF discovery                       | Specifies the PCSCF discovery static ot dynamic                                                                                                                                                                                                                              |                                           | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R10 |
| LTERsrpThreshold / LTERsrqThreshold    | The threshold of LTE Rsrp                                                                                                                                                                                                                                                    |                                           | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R34 |
| hf-only                                | Permissible values are 0 and 1. If hf-only is 0 or not present, both Compact and Header-Full formats can be used in the session for the send and the receive directions. If hf-only is 1, only Header-Full format without zero padding for size collision avoidance is used. |                                           | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R8           |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| AMR-NB Codec | Support Adaptive Multi-Rate Codec or not | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R13 |
| AMR-WB Codec | Support Adaptive Multi-Rate WideBand Codec or not | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R14 |
| RTP Inactive Timer | In the IMS call, if UE detect there is no RTP package from network last time > RTP Inactive Timer, then end call | 20s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R16 |
| ROHC | RObust Header Compression, It used to compress the IP\UDP\RTP header to save bandwidth. There are 4 profiles type. / profile0x0001 / profile0x0002 / profile0x0003 / profile0x0004 | ON / profile0x0001 / profile0x0002 / profile0x0003 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R65 |
| HD Icon according to voice codec | Display HD Voice icon in dialer during VoLTE call if voice codec such as AMR-WB is used | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R73 |
| Support Video Call on LTE | Support Video Call on LTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R78 |
| br | Specifies the range of source codec bit-rate |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R4 |
| cmr | Codec Mode Request |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R6 |
| evs-mode-switch | Permissible values are 0 and 1. If evs-mode-switch is 0 or not present, EVS primary mode is used at the start or update of the session for the send and the receive directions. If evs-mode-switch is 1, EVS AMR-WB IO mode is used at the start or update of the session for the send and the receive directions. |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R9 |
| Packet detection | Check the RTP/RTCP downlink packet status according to the configuration and perform automatic degrading operation. | 0xd254中stUint8NVpara[2].ucReserved9，0: Don't monitor RTP、RTCP，1：Monitor RTP，2：Monitor RTCP，3：monitor RTP&RTCP | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | ViLTE R8 |
| Duration for RTP&RTCP monitor | Check the RTP/RTCP downlink packet status and the timer duration for automatic degrading operation | 0xd254中stUint8NVpara[2].ucReserved10 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | ViLTE R9 |
| audio call upgrade to video call | audio call upgrade to video call | During audio call, user could upgrade audio call to video call | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | ViLTE R13 |
| Video call downgrade to audio call | Video call downgrade to audio call | During video call, user could downgrade video call to audio call | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | ViLTE R14 |
| ViLTE feature not related to Data traffic switch | ViLTE feature not related to Data traffic switch | Video call feature is independent with data traffic | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | ViLTE R15 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Auth type default value | Authentication method | AKA and IPSEc | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R30 |
| IPSec Encryption algorithms | IPSec Encryption algorithms | Null Yes / Aes Yes / 3des Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R31 |
| IPSec Integrity algorithms | IPSec Integrity algorithms | Md5 Yes / Sha1 Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R32 |
| ePDG FQDN | ePDG FQDN / The ePDG address is derived from the home operator identity stored in the SIM card, i.e. IMSI, as described in [23.003]: / epdg.epc.mnc<MNC>.mcc<MCC>.pub.3gppnetwork.org / Stores the ePDG FQDN to be used in the DNS query to retrieve the ePDG server’s IP adress |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R5 |
| Own URI(Idi) | Specifies the format of the IDi that should be used in the IKEv2 authentication message(s) / ID_RFC822_ADDR is the 3GPP standard IDi format. |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R6 |
| Remote URI(Idr) | Specifies the format of the IDr that should be used in the IKEv2 authentication message(s) |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R7 |
| pcscfv4_attr_type_val | Specifies the PCSCF v4 attribute type value used in the IKEv2 exchange |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R8 |
| pcscfv6_attr_type_val | Specifies the PCSCF v6 attribute type value used in the IKEv2 exchange |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R9 |
| IKE version | IKE version number |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R12 |
| IKEv2 encryption | Specifies the supported IKEv2 encryption algorithms |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R13 |
| IKEv2 Pseudo Random Function | Specifies the supported IKEv2 PRF algorithms |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R14 |
| IKEv2 Integrity | Specifies the supported IKEv2 authentication algorithms |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R15 |
| IKEv2 Diffie-Hellman Group | Specifies the DH group types that are supported by the UE; the first type listed will be used in the initial IKE exchange |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R16 |
| IPSec encryption | Specifies the supported ESP encryption algorithms |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R17 |
| IPSec integrity | Specifies the supported ESP authentication algorithms |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R18 |
| IPSec Group | Specifies the DH group types that are supported by the UE |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R19 |
| IPSec / IKE Life Time | Time in seconds after which the UE shall tear down IKE SA if rekey procedure has not succeeded |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R20 |
| Ikev2IkeSaRekeyTimerSec | Time in seconds after which the UE shall start an IKE SA rekey procedure |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R21 |
| Ikev2IPsecSaRekeyTimeSec | Time in seconds after which the UE shall start an ESP SA rekey procedure |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R22 |
| ikev2_interval_to_send | Interval in seconds which resend ikev2 packet |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R23 |
| ikev2_max_retry | Maximum number of times a UE shall retransmit an IKEv2 packet if it does not receive a response |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R24 |
| Ikev2DpdInterval | Time period in seconds after which the UE shall perform the DPD |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R25 |
| Ikev2DpdMaxFails | The DPD max fail times |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R26 |
| Ikev2CertReqEnable | Used to determine if certificates are used to authenticate the ePDG server during tunnel establishment procedures |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R27 |
| Support LTE<->WiFi HO | Specifies Handover between LTE and WiFi |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R30 |
| Vowifi Icon | It represent VoWIFI readiness as a result of IMS registration |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R40 |
| Vowifi Service name/Marketing name | It represent VoWIFI vendor even vowifi when airplane mode |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R41 |
| WIFI call default Value | Decide VoWIFI default value |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R42 |
| WIFI call Setting Menu display or not | Decide show or hide VoWIFI setting menu |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R43 |
| The name of the WiFi Calling On/Off switch | The name of the WiFi Calling On/Off switch |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R44 |
| VoWiFi call enable when Roaming | VoWiFi call enable when Roaming |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R50 |
| VoWiFi Ut enable when Roaming | VoWiFi Ut enable when Roaming |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R51 |
| VoWiFi MMS enable when Roaming | VoWiFi MMS enable when Roaming |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R52 |
| Airplane mode | This feature represent VoWIFI support/not support while airplane mode is on |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R53 |
| Ut over WiFi | This feature represent VoWIFI UT support or not support. Please provide the UT apn and IP Type if support. |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R54 |
| Ut APN over WiFi（ePDG） | Specifies Ut APN over WIFI（ePDG） |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R55 |
| Ut APN IP Type over WiFi（ePDG） | Specifies Ut APN IP Type over WIFI（ePDG） |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R56 |
| MMS over WiFi（ePDG） | This feature represent VoWIFI MMS support or not support. Please provide the MMS apn and IP type if support. |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R57 |
| MMS APN over WiFi（ePDG） | Specifies MMS APN over WIFI（ePDG） |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R58 |
| MMS APN IP Type over WiFi（ePDG） | Specifies MMS APN IP Type over WIFI（ePDG） |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R59 |
| Voice APN over WiFi（ePDG） | Voice APN over WiFi（ePDG） |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R61 |
| Video feature Trun off under VoWiFI | Video feature Trun off under VoWiFI | Video feature would trn off under VoWiFi | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | ViLTE R16 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency call over IMS | Emergency call over IMS or CS | CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R9 |
| Emergency call apn type | Emergency call apn type |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R10 |
| NoCardEmcCallSupportFlag | Support anonymous Emergency call or not | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R25 |
| Emergency Call | Specifies Emergency Call domain select order |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R36 |
| Emergency Call APN over WiFi（ePDG） | Emergency Call APN over WiFi（ePDG） |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R62 |

### 网络能力要求

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| setDefaultNoReplyTimer | When CFNR is set, time elapsed before UE send "no reply" response. / 0 -- Defined by network / -1 -- Defined by MMI code or UI setting / 5~30 -- Carrier specified, only values which is multiple of 5 is valid for network | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R63 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\UNITEL VOLTE NETWORK PARAMETERSDEC 2019(1).xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| IMS/URI 格式 | 原表多处写 `ims.mnc631.mcc02`，与常规 MCC/MNC 域名格式不一致，不能直接照抄。 |

## 维护备注

- 这份资料是 UNITEL 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

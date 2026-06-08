---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Orange
mccmnc: "60400"
country: Morocco
source: F:\Codex\Knowledge\运营商参数归档\VoLTE_VoWIFI_Config_template_OMA_13122022.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Morocco Orange 60400

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Morocco |
| 运营商 | Orange |
| MCCMNC | `60400` |
| MCC/MNC 证据 | 原表 `VoLTE config` R3 和 `VoWiF config` R3 写 MCC MNC list `604 00`；Domain/URI 使用 `mnc000.mcc604`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Morocco Orange / Médi Télécom 使用 `604 00`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\VoLTE_VoWIFI_Config_template_OMA_13122022.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、IMS/VoLTE、VoWiFi/ePDG、UT/XCAP、Emergency、EVS、媒体/Codec |
| 配置前重点 | MNC 为 `00`，配置文件命名/匹配时必须保留两位 MNC，不要写成 `6040`。 |

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
| MCC MNC list | Operator Card MCC MNC list | 604 00 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R3 |
| HomeDomainName | HomeDomainName | ims.mnc000.mcc604.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R25 |
| IMPI | IMPI | <IMSI>@ims.mnc<mnc>.mcc<mcc>.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R26 |
| IMPU | IMPU | sip:IMSI@ims.mnc000.mcc604.3gppnetwork.org / sip:+MSISDN@ims.mnc000.mcc604.3gppnetwork.org / tel:+MSISDN | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R27 |
| Conference URI | Does the network have customized conference server URI? / If no, the UE will follow the specification of TS 23.003. / If yes, please give the conference server URI. | default value: / mmtel@conf-factory.ims.mnc000.mcc604.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R44 |
| MCC MNC list | Operator Card MCC MNC list | 604 00 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R3 |
| Own URI(Idi) | Specifies the format of the IDi that should be used in the IKEv2 authentication message(s) / ID_RFC822_ADDR is the 3GPP standard IDi format. | ID type: ID_RFC822_ADDR / ID data: 0IMSI@nai.epc.mnc000.mcc604.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R5 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Defaut APN | Internet APN | internet.orange.ma | APN for Internet | VoLTE config R6 |
| Default apn ip type | Ims apn ip type | IPv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R7 |
| Ims apn name | Ims apn name | ims | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R8 |
| Ims apn ip type | Ims apn ip type | IPv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R9 |
| PDN for SS configuration | APN for SS configuration, if differs from default apn, please specify APN name | hos | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R51 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| ISIM / USIM | Supported Type of SIM for VoLTE | USIM | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R4 |
| Precondition | If this parameter is set to "true" then the client will ask the network to perform "resource reservation" before setting up the call. | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R15 |
| TCP Threshhold | IF SIP size > TCP Threshhold, IMS will use TCP to send this SIP message, otherwise use UDP, such as 1300 | 1280 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R18 |
| SMS over IMS | Support SMS over IMS or not | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R21 |
| SMS over SGs/CS | Support SMS over SGs or not | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R22 |
| IMS Reg maintenance with 2/3G |   | OFF | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R23 |
| No Precondition support 183 | If network don't support precondition, UE still response 183 when as MT | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R24 |
| DeregIMSWhenFallBackTo3G | Should UE dereg IMS before fallback to 3G | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R29 |
| CallRejectCode | This parameter is defining the SIP error message to be returned by the MT party when an incoming call is rejected. | 486 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R30 |
| Call Hold Tone | This parameter is defining whether the tone played when a call is put on hold shall be played by the network or by the client | Network | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R31 |
| SRVCC | SRVCC | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R37 |
| mid-SRVCC | mid-call srvcc | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R38 |
| aSRVCC | alerting SRVCC | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R39 |
| bSRVCC | before alerting SRVCC | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R40 |
| SRVCC to 3G | SRVCC to 3G | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R41 |
| SRVCC to 2G | SRVCC to 2G | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R42 |
| ConfSrvccCheckMidCallCapability | Support Check MidCall capability when Conference call SRVCC | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R45 |
| ReferInDialog | Does the network expect the UE use the same dialog with the conference call to construct the REFER request to pull members? | in-dialog | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R46 |
| SS configuration through RAT | 4G VoLTE | UT | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R48 |
| UT Authentication method | Does NW support GBA_ME or GBA_UICC based authentication ? | GBA_ME | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R55 |
| XCAP configuration | XCAP Root URI / By default, use MCC MNC splice into root URI follow Protocol specification: / xcap.ims.mncXXX.mccXXX.pub.3gppnetwork.org / Otherwise please provide the XCAP Root URI | xcap.ims.mnc000.mcc604.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R56 |
| UssdOverIms | USSD over IMS or CS? | CS | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R66 |
| HD Icon when IMS reg | Display VoLTE icon in status bar when IMS registration is successful | 1 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R73 |
| HD Icon when in-call | Display VoLTE icon when in-call | 1 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R74 |
| HD Icon in call history | Display VoLTE icon in call history | 1 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R75 |
| HD Icon in dailer button | Display VoLTE icon in dailer button | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R76 |
| VoLTE calls Default Setting | Volte switch in Setting to default enable or disable | OFF | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R78 |
| Is VoLTE calls display in Setting menu | Is VoLTE calls display in Setting menu | 1 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R79 |
| Indicate User when turning off VoLTE. | Indicate User when turning off VoLTE. | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R80 |
| P-CSCF discovery | Specifies the PCSCF discovery static ot dynamic | dynamic | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R9 |
| LTERsrpThreshold / LTERsrqThreshold | The threshold of LTE Rsrp | bad:-110 / good:-100 | Suggest to Keep Default | VoWiF config R33 |
| Ut XCAP Root URI |   | /mtasxdms | Example for GET and PUT : / / / /mtasxdms/simservs.ngn.etsi.org/users/sip:+212663667897@ims.mnc000.mcc604.3gppnetwork.org/simservs.xml HTTP/1.1 1 | VoWiF config R63 |
| hf-only | Permissible values are 0 and 1. If hf-only is 0 or not present, both Compact and Header-Full formats can be used in the session for the send and the receive directions. If hf-only is 1, only Header-Full format without zero padding for size collision avoidance is used. | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R7 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| AMR-NB Codec | Support Adaptive Multi-Rate Codec or not | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R16 |
| AMR-WB Codec | Support Adaptive Multi-Rate WideBand Codec or not | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R17 |
| RTP Inactive Timer | In the IMS call, if UE detect there is no RTP package from network last time > RTP Inactive Timer, then end call | 20s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R19 |
| ROHC | RObust Header Compression, It used to compress the IP\UDP\RTP header to save bandwidth. There are 4 profiles type. / profile0x0001 / profile0x0002 / profile0x0003 / profile0x0004 | OFF in most Network | From Radio Part Orange is supporting this function and can be activated in all network | VoLTE config R69 |
| HD Icon according to voice codec | Display HD Voice icon in dialer during VoLTE call if voice codec such as AMR-WB is used | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R77 |
| Support Video Call on LTE | Support Video Call on LTE | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R82 |
| br | Specifies the range of source codec bit-rate | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R3 |
| cmr | Codec Mode Request | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R5 |
| evs-mode-switch | Permissible values are 0 and 1. If evs-mode-switch is 0 or not present, EVS primary mode is used at the start or update of the session for the send and the receive directions. If evs-mode-switch is 1, EVS AMR-WB IO mode is used at the start or update of the session for the send and the receive directions. | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | EVS R8 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Auth type default value | Authentication method | AKA and IPSEC | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R33 |
| IPSec Encryption algorithms | IPSec Encryption algorithms | Null Yes / Aes Yes / 3des Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R34 |
| IPSec Integrity algorithms | IPSec Integrity algorithms | Md5 Yes / Sha1 Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R35 |
| ePDG FQDN | ePDG FQDN / The ePDG address is derived from the home operator identity stored in the SIM card, i.e. IMSI, as described in [23.003]: / epdg.epc.mnc<MNC>.mcc<MCC>.pub.3gppnetwork.org / Stores the ePDG FQDN to be used in the DNS query to retrieve the ePDG server’s IP adress | Derived based on USIM: / / epdg.epc.mnc000.mcc604.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R4 |
| Remote URI(Idr) | Specifies the format of the IDr that should be used in the IKEv2 authentication message(s) | ID type: KEY_ID / ID data: ims | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R6 |
| pcscfv4_attr_type_val | Specifies the PCSCF v4 attribute type value used in the IKEv2 exchange | 16389 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R7 |
| pcscfv6_attr_type_val | Specifies the PCSCF v6 attribute type value used in the IKEv2 exchange | N.A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R8 |
| IKE version | IKE version number | v2 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R11 |
| IKEv2 encryption | Specifies the supported IKEv2 encryption algorithms | AES-CTR-128 / AES-CBC-128 / AES-CBC-192 / AES-CTR-192 / AES-CBC-256 / AES-CTR-256 / DES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R12 |
| IKEv2 Pseudo Random Function | Specifies the supported IKEv2 PRF algorithms | PRF-AES128-XCBC / PRF-HMAC-MD5 / PRF-HMAC-SHA1 / PRF-HMAC-SHA2-256 / PRF-HMAC-SHA2-384 / PRF-HMAC-SHA2-512 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R13 |
| IKEv2 Integrity | Specifies the supported IKEv2 authentication algorithms | AES-XCBC-96 / HMAC-SHA1-96 / HMAC-MD5-96 / HMAC-SHA2-256 / HMAC-SHA2-384 / HMAC-SHA2-512 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R14 |
| IKEv2 Diffie-Hellman Group | Specifies the DH group types that are supported by the UE; the first type listed will be used in the initial IKE exchange | group1 / group2 / group14 / group15 / group16 / group17 / group18 / group5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R15 |
| IPSec encryption | Specifies the supported ESP encryption algorithms | AES-CTR-128 / AES-CBC-128 / AES-CBC-192 / AES-CTR-192 / AES-CBC-256 / AES-CTR-256 / DES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R16 |
| IPSec integrity | Specifies the supported ESP authentication algorithms | AES-XCBC-96 / HMAC-SHA1-96 / HMAC-MD5-96 / HMAC-SHA2-256 / HMAC-SHA2-384 / HMAC-SHA2-512 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R17 |
| IPSec Group | Specifies the DH group types that are supported by the UE | group1 / group2 / group14 / group15 / group16 / group17 / group18 / group5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R18 |
| IPSec / IKE Life Time | Time in seconds after which the UE shall tear down IKE SA if rekey procedure has not succeeded | 43200 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R19 |
| Ikev2IkeSaRekeyTimerSec | Time in seconds after which the UE shall start an IKE SA rekey procedure | <43200 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R20 |
| Ikev2IPsecSaRekeyTimeSec | Time in seconds after which the UE shall start an ESP SA rekey procedure | <43200 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R21 |
| ikev2_interval_to_send | Interval in seconds which resend ikev2 packet | 5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R22 |
| ikev2_max_retry | Maximum number of times a UE shall retransmit an IKEv2 packet if it does not receive a response | 3 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R23 |
| Ikev2DpdInterval | Time period in seconds after which the UE shall perform the DPD | 600 | 60 Dedicated Bearer / 600 Default Bearer | VoWiF config R24 |
| Ikev2DpdMaxFails | The DPD max fail times | 3 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R25 |
| Ikev2CertReqEnable | Used to determine if certificates are used to authenticate the ePDG server during tunnel establishment procedures | N | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R26 |
| Support LTE<->WiFi HO | Specifies Handover between LTE and WiFi | LTE <-> WiFi | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R29 |
| Vowifi Icon | It represent VoWIFI readiness as a result of IMS registration | 1-display | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R40 |
| Vowifi Service name/Marketing name | It represent VoWIFI vendor even vowifi when airplane mode |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R41 |
| WIFI call default Value | Decide VoWIFI default value | OFF(default) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R42 |
| WIFI call Setting Menu display or not | Decide show or hide VoWIFI setting menu | 1-display | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R43 |
| The name of the WiFi Calling On/Off switch | The name of the WiFi Calling On/Off switch |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R44 |
| VoWiFi call enable when Roaming | VoWiFi call enable when Roaming | OFF(default) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R50 |
| VoWiFi Ut enable when Roaming | VoWiFi Ut enable when Roaming | OFF(default) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R51 |
| VoWiFi MMS enable when Roaming | VoWiFi MMS enable when Roaming | OFF(default) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R52 |
| Airplane mode | This feature represent VoWIFI support/not support while airplane mode is on | ON(default) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R53 |
| Ut over WiFi | This feature represent VoWIFI UT support or not support. Please provide the UT apn and IP Type if support. | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R54 |
| Ut APN over WiFi（ePDG） | Specifies Ut APN over WIFI（ePDG） | hos | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R55 |
| Ut APN IP Type over WiFi（ePDG） | Specifies Ut APN IP Type over WIFI（ePDG） | IPV4V6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R56 |
| MMS over WiFi（ePDG） | This feature represent VoWIFI MMS support or not support. Please provide the MMS apn and IP type if support. | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R57 |
| MMS APN over WiFi（ePDG） | Specifies MMS APN over WIFI（ePDG） | N.A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R58 |
| MMS APN IP Type over WiFi（ePDG） | Specifies MMS APN IP Type over WIFI（ePDG） | N.A | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R59 |
| Voice APN over WiFi（ePDG） | Voice APN over WiFi（ePDG） | ims | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R61 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency call over IMS | Emergency call over IMS or CS | CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R10 |
| Emergency call apn type | Emergency call apn type |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R11 |
| Emergency Call to standard Emergency Numbers ( ex: 911 , 112 ) |   | 112 | UE performs directly a CSFB | VoLTE config R12 |
| Emergency Call to special Emergency Numbers ( ex:15,19,177...) |   | 15, 19, 177, 150, 190 | UE performs directly a CSFB | VoLTE config R13 |
| TEL/SIP URI for sms | This parameter defined the format used in outgoing SMS messages | N.A | SMSoSGs | VoLTE config R20 |
| NoCardEmcCallSupportFlag | Support anonymous Emergency call or not | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R28 |
| Emergency Call | Specifies Emergency Call domain select order | CS>VoWiFi | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R35 |
| Emergency Call | CSFB |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoWiF config R38 |
| Emergency Call | Emergency Call APN over WiFi（ePDG） | ims | CS Preferred / Emergency Call over WiFi if no mobile network access using ims apn | VoWiF config R62 |
| Emergency Call to standard Emergency Numbers ( ex: 911 , 112 ) |   | 112 | UE performs directly a CSFB | VoWiF config R64 |
| Emergency Call to special Emergency Numbers ( ex:15,19,177...) |   | 15, 19, 177, 150, 190 | UE performs directly a CSFB | VoWiF config R65 |

### 网络能力要求

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| setDefaultNoReplyTimer | When CFNR is set, time elapsed before UE send "no reply" response. / 0 -- Defined by network / -1 -- Defined by MMI code or UI setting / 5~30 -- Carrier specified, only values which is multiple of 5 is valid for network | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE config R67 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\VoLTE_VoWIFI_Config_template_OMA_13122022.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 Orange 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

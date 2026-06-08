---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Antel
mccmnc: "74801"
country: Uruguay
source: F:\Codex\Knowledge\运营商参数归档\Alcatel-TCL Formulario VOLTE_VOWIFI_9mayo22.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Uruguay Antel 74801

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Uruguay |
| 运营商 | Antel |
| MCCMNC | `74801` |
| MCC/MNC 证据 | 原表 `VoLTE` R3 写 MCC/MNC `748, 01`，Conference/XCAP/BSF URI 也使用 `mnc001.mcc748`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Uruguay Antel 使用 `748 01`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Alcatel-TCL Formulario VOLTE_VOWIFI_9mayo22.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | IMS APN、VoLTE、VoWiFi/ePDG、Emergency、SMS、SRVCC、XCAP/UT |
| 配置前重点 | VoWiFi 表存在多列默认/Antel 取值，落地前需确认使用 Antel 列而非 default/example 列。 |

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
| MCC MNC list | 001 01,460 00 | 748, 01 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R3 |
| Conference URI | By default,Use MCC、MNC splice into Conference URI follow Protocol specification: / sip:mmtel@conf-factory.ims.mncXXX.mccXXX.3gppnetwork.org / Otherwise please provide the conference URI | sip:mmtel@conf-factory.ims.mnc001.mcc748.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R34 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Ims apn name | ims | ims | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R6 |
| Ims apn ip type | IPv4/IPv6/IPv4v6 | IPv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R7 |
| APN for XCAP/Ut | if not use default data APN, please provide apn name | xcap | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R40 |
| APN type for XCAP/Ut | IPv4/IPv6/IPv4v6 | IPv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R41 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| ISIM / USIM | Supported Type of SIM for VoLTE | USIM,ISIM | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R4 |
| Precondition | ON/OFF | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R12 |
| TEL/SIP URI for voice call | TEL/SIP | TEL | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R13 |
| TCP Threshhold | IF SIP size > TCP Threshhold, IMS will use TCP to send this SIP message, otherwise use UDP, such as 1300 | 1300 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R16 |
| TEL/SIP URI for sms | TEL/SIP | TEL | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R18 |
| SMS over IMS | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R19 |
| SMS over SGs/CS | Receiving SMS over SGs (EUTRAN) and CS (UTRAN/GERAN) ? Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R20 |
| IMS Reg maintenance with 2/3G | ON/OFF | OFF | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R21 |
| SRVCC | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R27 |
| mid-SRVCC | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R28 |
| aSRVCC | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R29 |
| bSRVCC | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R30 |
| SRVCC to 3G | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R31 |
| SRVCC to 2G | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R32 |
| conference Subscribe | in-dialog/out-of-dialog | out-of-dialog | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R35 |
| Supplementary Services Configuration over Ut interface | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R37 |
| UT forbidden when volte switch off | Yes / No, if Yes, UT cannot use when volte switch off | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R38 |
| UT forbidden when mobile data switch off | Yes / No, if Yes, popup need to open mobile data tips | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R39 |
| GBA_ME / GBA_UICC Support | Does NW support GBA_ME or GBA_UICC based authentication ? | GBA_ME | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R42 |
| XCAP Root URI | By default,Use MCC、MNC splice into Conference URI follow Protocol specification: / xcap.ims.mncXXX.mccXXX.pub.3gppnetwork.org / Otherwise please provide the XCAP Root URI | xcap.ims.mnc001.mcc748.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R43 |
| xcap access protocol | http or https(TLS,need provide http certificate file ) | http | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R44 |
| naf address | By default,Use MCC、MNC splice into address follow Protocol specification: / xcap.ims.mncXXX.mccXXX.pub.3gppnetwork.org / Otherwise please provide the naf address | xcap.ims.mnc001.mcc748.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R45 |
| naf port |   | 80 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R46 |
| bsf access protocol | http or https(TLS,need provide http certificate file ) | http | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R47 |
| bsf address | By default,Use MCC、MNC splice into address follow Protocol specification: / bsf.mncXXX.mccXXX.pub.3gppnetwork.org / Otherwise please provide the bsf address | bsf.mnc001.mcc748.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R48 |
| bsf port |   | 8080 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R49 |
| ut fallback cs when ut fail | Yes / No | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R53 |
| USSD over IMS? | Yes / No, IF No then use CSFB | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R54 |
| ContentTypeMode | Control content type mode in http message, it is uesed in Ut interface. / CONTENT_TYPE_MODE_FIXED = 1;//always be application/vnd.etsi.simservs+xml / CONTENT_TYPE_MODE_AUTO = 0;//adapt to network | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R59 |
| utParamsCfg | ut params | Null | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R60 |
| utBsfAuthBeUsed | whether ut need Authenticate | VERDADERO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R61 |
| utOIRSourceMode | OIR source / 0-OIR_SOURCE_FROM_UT，1-OIR_SOURCE_FROM_LOCAL | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R62 |
| ROHC | ON/OFF, IF ON and no specify profile then base on product default configuration, Otherwise provide specify profile configuration such as / profile0x0001 supported / profile0x0002 supported | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R64 |
| HD Icon when IMS reg | 0-hidden,1-display | 1 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R68 |
| VoLTE calls Default Setting | ON / OFF ? | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R73 |
| Is VoLTE calls display in Setting menu | 0-hidden,1-display | 1 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R74 |
| Indicate User when turning off VoLTE. | YES/No | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R75 |
| VoLTE Roaming on/off | ON / OFF ? | ON | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R76 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| AMR-NB Codec | Yes / No | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R14 |
| AMR-WB Codec | Yes / No | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R15 |
| RTP Inactive Timer | IF detect No RTP package time > RTP Inactive Timer end call | 20s | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R17 |
| HD Icon according to voice codec | YES/No | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R72 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Auth type default value | AKA/DIGEST/AKA and IPSEC | AKA and IPSEC | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R23 |
| IPSec algorithm | Null Yes / No / Aes Yes / No / 3des Yes / No | Null Yes / Aes Yes / 3des Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R24 |
| IPSec encryption | Md5 Yes / No / Sha1 Yes / No | Md5 Yes / Sha1 Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R25 |
| Geolocation header | Geolocation header ( Content-Type : geolocation ) | 1 | IMS | VoWIFI R3 |
| Access Network Info | P-Access-Network-Info header | access-type;access-info=PANI | IMS | VoWIFI R4 |
| VoWIFI icon | Icon in the call application indicating when a call is managed over VoWiFi | 0 | UX | VoWIFI R5 |
| VoWIFI Setting Option | Decide show or hide VoWIFI setting menu | 1 | UX | VoWIFI R6 |
| airplane mode | This parameter is controlling if VoWiFi should be activated or not while airplane mode is on | 1 | Services | VoWIFI R8 |
| Preferred Network | This parameter is defining the priority for routing the call on different access networks | WiFi Preferred | Services | VoWIFI R9 |
| VoWiFi and VoLTE | This parameter is controlling if a UE supporting VoWiFi shall also support VoLTE or not | 1 | Services | VoWIFI R10 |
| SMS Reception | Describe which SMS service is used to receive SMS while VoWIFI is activated | SMS over SG/CSFB | Services | VoWIFI R12 |
| MMS | Describe which MMS service over WiFi is supported while VoWIFI is activated | MMS over LTE/3G/2.5G | Services | VoWIFI R13 |
| VVM | Describe which VVM service over WiFi is supported while VoWIFI is activated | VVM over LTE/3G/3G | Services | VoWIFI R14 |
| USSD | Describe USSD service type supported | CSFB | Services | VoWIFI R16 |
| VoWiFi in Roaming | It specifies if VoWiFi in Roaming should be enabled or disabled | Enabled | Roaming | VoWIFI R18 |
| Preferred mode in Roaming | This parameter is defining the priority for routing the call on different access networks, while in roaming. | WiFi Preferred | Roaming | VoWIFI R19 |
| ePDG in Roaming | It specifies which ePDG should be used when in Roaming | Home ePDG | Roaming | VoWIFI R20 |
| ePDG FQDN | epdg_fqdn / Stores the ePDG FQDN to be used in the DNS query to retrieve the ePDG server’s IP adress / FQDN(Fully Qualified Domain Name) | epdg.epc.mncXXX.mccYYY.pub.3gppnetwork.org | ePDG Configuration | VoWIFI R21 |
| Time for UE's IKEv2 SA rekey procedure start | ikev2_sa_rekey_timer_soft_sec / Time in seconds after which the UE shall start an IKE SA rekey procedure / IKEv2( Internet Key Exchange version 2 ) / SA(Security Association) | 3000 | ePDG Configuration | VoWIFI R22 |
| Time for UE's IKEv2 SA rekey procedure tear down | ikev2_sa_rekey_timer_hard_sec / Time in seconds after which the UE shall tear down IKE SA if rekey procedure has not succeeded / IKEv2( Internet Key Exchange version 2 ) / SA(Security Association) | 3600 | ePDG Configuration | VoWIFI R23 |
| Maximun number of UE's IKEv2 retries | ikev2_max_retries / Maximum number of times a UE shall retransmit an IKEv2 packet if it does not receive a response / IKEv2( Internet Key Exchange version 2 ) | 3 | ePDG Configuration | VoWIFI R24 |
| Time period for UE's IKEv2 DPD | ikev2_dpd_timer_sec / Time period in seconds after which the UE shall perform the DPD / DPD(Dead Pear Detection) | 120 | ePDG Configuration | VoWIFI R25 |
| Time for UE's ESP SA rekey procedure start | esp_rekey_timer_soft_sec / Time in seconds after which the UE shall start an ESP SA rekey procedure / ESP SA ( Encapsulating Security Payload Security Association) | 1500 | ePDG Configuration | VoWIFI R26 |
| Time for UE's ESP SA rekey tear down | esp_rekey_timer_hard_sec / Time in seconds after which the UE shall tear down an ESP SA if a rekey procedure has not succeeded / ESP SA ( Encapsulating Security Payload Security Association) | 1800 | ePDG Configuration | VoWIFI R27 |
| Enable Certification to authenticate ePDG server | cert_req_enabled / Used to determine if certificates are used to authenticate the ePDG server during tunnel establishment procedures | 0 | ePDG Configuration | VoWIFI R28 |
| IDi format for IKEv2 authentication | ikev2_self_id_type / Specifies the format of the IDi that should be used in the IKEv2 authentication message(s) /  ID_RFC822_ADDR is the 3GPP standard IDi format. /  ID_RFC822_ADDR_MAC is the ID_RFC822_ADDR-based IDi format with inclusion of the AP’s MAC address. / IDi(Identification - Initiator) | ID_RFC822_ADDR_MAC | ePDG Configuration | VoWIFI R29 |
| Idr format for IKEv2 authentication | ikev2_peer_id_type / Specifies the format of the IDr that should be used in the IKEv2 authentication message(s) / Idr(Identification - Responder) | ID_KEY_ID | ePDG Configuration | VoWIFI R30 |
| P-CSCF v4 Attribute Type Value for IKEv2 | pcscfv4_attr_type_val / Specifies the PCSCF v4 attribute type value used in the IKEv2 exchange / P-CSCF(Proxy-Call Control and Service function) | 16389 | ePDG Configuration | VoWIFI R31 |
| P-CSCF v6 Attribute Type Value for IKEv2 | pcscfv6_attr_type_val / Specifies the PCSCF v6 attribute type value used in the IKEv2 exchange / P-CSCF(Proxy-Call Control and Service function) | 16390 | ePDG Configuration | VoWIFI R32 |
| Diffie-Hellman Group Transform IDs | ikev2_dh_group_list / Specifies the DH group types that are supported by the UE; the first type listed will be used in the initial IKE exchange / DH (Diffie-Hellman) / http://www.iana.org/assignments/ikev2-parameters/ikev2-parameters.xhtml#ikev2-parameters-8 / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 2, 5, 14 | ePDG Configuration | VoWIFI R33 |
| IKEv2 Encryption Algorithm Transform IDs | ikev2_encr_algo_list / Specifies the supported IKEv2 encryption algorithms / http://www.iana.org/assignments/ikev2-parameters/ikev2-parameters.xhtml#ikev2-parameters-5 / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 2-ENCR_DES / 3-ENCR_3DES / 12-ENCR_AES_CBC | ePDG Configuration | VoWIFI R34 |
| Length of AES CBC encryption in IKEv2 Encryption List | ikev2_aes_encr_key_size_list / If ENCR_AES_CBC is specified in the IKEv2 C18encryption algorithm list, this parameter wi+ll specify the length of the AES CBC encryption: both 128 and 256 / AES(Advanced Encryption Standard) / CBC(Cipher Block Chaining) / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 128, 256 | ePDG Configuration | VoWIFI R35 |
| IKEv2 Integrity Algorithm Transform IDs | ikev2_hash_algo_list / Specifies the supported IKEv2 authentication algorithms / http://www.iana.org/assignments/ikev2-parameters/ikev2-parameters.xhtml#ikev2-parameters-7 / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 1-AUTH_HMAC_MD5_96 / 2-AUTH_HMAC_SHA1_96 / 5-AUTH_AES_XCBC_96 | ePDG Configuration | VoWIFI R36 |
| IKEv2 Pseudo-random Function Transform IDs | ikev2_prf_algo_list / Specifies the supported IKEv2 PRF algorithms / PRF(pseudo-random function) / http://www.iana.org/assignments/ikev2-parameters/ikev2-parameters.xhtml#ikev2-parameters-6 / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 2-PRF_HMAC_SHA1 / 4-PRF_AES128_XCBC | ePDG Configuration | VoWIFI R37 |
| ESP Encryption Algorithm Transform IDs | esp_encr_algo_list / Specifies the supported ESP encryption algorithms / ESP ( Encapsulating Security Payload ) / http://www.iana.org/assignments/ikev2-parameters/ikev2-parameters.xhtml#ikev2-parameters-5 / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 2-ENCR_DES / 3-ENCR_3DES / 12-ENCR_AES_CBC | ePDG Configuration | VoWIFI R38 |
| Length of AES CBC encryption in ESP Encryption List | esp_aes_encr_key_size_list / If ENCR_AES_CBC is specificed in the ESP encryption algorithm list, this parameter will specify the length of the AES CBC encryption: both 128 and 256 / ESP ( Encapsulating Security Payload ) / AES(Advanced Encryption Standard) / CBC(Cipher Block Chaining) / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 128, 256 | ePDG Configuration | VoWIFI R39 |
| ESP Integrity Algorithm Transform IDs | esp_auth_algo_list / Specifies the supported ESP authentication algorithms / ESP ( Encapsulating Security Payload ) / http://www.iana.org/assignments/ikev2-parameters/ikev2-parameters.xhtml#ikev2-parameters-7 / This value must be written by referring to IANA identifiers. / Comma separated string, listing the priority and the list of algorithms to be implemented on Ue side | 1-AUTH_HMAC_MD5_96 / 2-AUTH_HMAC_SHA1_96 / 5-AUTH_AES_XCBC_96 | ePDG Configuration | VoWIFI R40 |
| Commercialization or Trial | Is this VoWiFi GPRI for commercialization TRUE? Otherwise it's for trial activities. | 0 | APN Profiles | VoWIFI R41 |
| MCC/MNC List | MCC/MNC List is for operator's VoWiFi service including for commercialization as well as for trial activities | n/a | APN Profiles | VoWIFI R42 |
| APN type for call service over VoWiFi | PDN for Voice call service via ePDG | IMS | APN Profiles | VoWIFI R43 |
| APN type for SMS service over VoWiFi | PDN for SMS service via ePDG | IMS | APN Profiles | VoWIFI R44 |
| APN type for MMS service over VoWiFi | PDN for MMS service via ePDG | MMS | APN Profiles | VoWIFI R45 |
| APN type for VVM service over VoWiFi | PDN for VVM service via ePDG | MMS | APN Profiles | VoWIFI R46 |
| APN type for Supplementary Services service over VoWiFi | PDN for XCAP/Ut service via ePDG | XCAP | APN Profiles | VoWIFI R47 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency call over IMS | IMS/CSFB | IMS preferred | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R8 |
| Emergency call apn name | NULL(network distribute sos apn) | Null | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R9 |
| Emergency call apn type | IPv4/IPv6/IPv4v6 | IPv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R10 |
| Emergency Call support in Roaming | Yes / No | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R77 |
| Emergency call | Emergency call type while VoWIFI is activated | CSFB, EMC over IMS | Services | VoWIFI R17 |
| APN type for Emergency service over VoWiFi | PDN for Emergency call service via ePDG | IMS | APN Profiles | VoWIFI R48 |

### 网络能力要求

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| SS over UT | OIP/TIP/OIR/TIR / CDIV/NRT, CFU/CFNL/CFB/CFNR/CFNRc/CFT, / ICB/OCB/BAIC/BAOC/BAOIC/BAOICxH/BAICr/BA_ALL | OIP/TIP/OIR/TIR / CDIV/NRT, CFU/CFNL/CFB/CFNR/CFNRc/CFT, / ICB/OCB/BAIC/BAOC/BAOIC/BAOICxH/BAICr/BA_ALL | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R50 |
| CFNRcChangeWithCFNL | Whether CFNL change with CFNRc at the same time / false/true | VERDADERO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R57 |
| setDefaultNoReplyTimer | When you set CFNR, UE can send no reply time. / 0~30s | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VoLTE R58 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Alcatel-TCL Formulario VOLTE_VOWIFI_9mayo22.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| VoWiFi 取值列 | VoWiFi sheet 同时包含 default 和 Antel 列，本文优先记录表内默认/Antel 可见取值；配置前需回查原表列标题。 |

## 维护备注

- 这份资料是 Antel 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

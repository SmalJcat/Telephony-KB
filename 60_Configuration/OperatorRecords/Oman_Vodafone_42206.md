---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Vodafone
mccmnc: "42206"
country: Oman
source: F:\Codex\Knowledge\运营商参数归档\Handest Survey for Vodafone.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Oman Vodafone 42206

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Oman |
| 运营商 | Vodafone |
| MCCMNC | `42206` |
| MCC/MNC 证据 | 原表 `Common` R4/R5/R7/R8 写 Operator `Vodafone`、Country `Oman`、MCC `422`、MNC `06`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Oman Vodafone 使用 `422 06`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Handest Survey for Vodafone.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、IMS/VoLTE、ViLTE、VoWiFi/ePDG、UT/XCAP、Emergency、SMS、EVS |
| 配置前重点 | Emergency Call Support & APN 写 `CSFB`，不要误配置成 ECC over IMS；ViLTE 支持为 Yes。 |

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
| Operator |   | Vodafone | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R4 |
| MCC | Operator Card MCC list | 422 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R7 |
| MNC | Operator Card MNC list | 06 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R8 |
| Conference Server URI | as per 3gpp spec TS34.229 | sip:conference@factory.ims.mnc006.mcc422.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R52 |
| Conference Calling | The Conference Server must be reachable through the IMS core at the / following address: / sip:mmtel@conf-factory.ims.mnc[MNC].mcc[MCC].3gppnetwork.org | Vodafone Don't offer Conference Service due to no commercial use case but as capability, netwrok support the conference service. "sip:mmtel@conf-factory.ims.mnc[MNC].mcc[MCC].3gppnetwork.org" need additional configs to support | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R12 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| APN for Internet | Multi purpose APN for Data and other services, Specify the services | internet.vodafone.om | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R11 |
| APN IP Type | Which type we should use for non IMS APN? | ipv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R12 |
| APN for IMS | APN for IMS services | ims.vodafone.om | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R13 |
| APN IP Type | Which type we should use for IMS | ipv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R14 |
| Attach APN | APN that should be used for LTE Attach | internet.vodafone.om | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R15 |
| APN for XCAP/Ut | Specify APN for Ut Interface? | hos.vodafone.om | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R16 |
| APN IP Type | Which type we should use for XCAP/ Ut APN | ipv4v6 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R17 |
| MTU Size for each supported APN | Please specify the MTU Size for each supported APN, if there is any specific requirement. | 1500 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R21 |
| Ut APN Type | Use Intenet APN or Specific APN for UT | hos.vodafone.om | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R64 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| ISIM / USIM | Supported Type of SIM for VoLTE | USIM | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R9 |
| VoLTE Roaming | Which type we should use for VoLTE roaming | S8HR | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R18 |
| VoLTE enabled by default | Volte switch is enabled by deafault | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R23 |
| VoLTE Feature | Device Configuration |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R24 |
| Voice over LTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R25 |
| SMS over IMS | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R28 |
| SRVCC(basesd on 3gpp REL8) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R29 |
| SRVCC(LTE->2G) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R30 |
| SRVCC(LTE->3G) | VoLTE | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R31 |
| aSRVCC(basesd on 3gpp REL10) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R32 |
| eSRVCC(basesd on 3gpp REL10) | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R33 |
| Supplemetary Service over IMS | Ut | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R34 |
| USSD over IMS | VoLTE | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R36 |
| IMS Registraion Algorithm | MD5 or AKAv1-MD5 or AKAv2-MD5 | AKAv1-MD5 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R37 |
| IMS Authentication Algorithm | HMAC-MD5-96 or HMAC-SHA-1-96 or Both | both | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R38 |
| MTU size for IMS | size in bytes | 1500 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R41 |
| GRUU |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R44 |
| Enable preconditions |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R45 |
| Display Registration icon |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R46 |
| SIP INVITE error codes triggering CSFB | error codes separated by semicolon | 403;500;503 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R49 |
| Support of TEL URI or SIP URI | SIP Uri Only / Both | Both | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R50 |
| Support subscribing to the conference event? |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R53 |
| Conference Call dialog Type | In-dialog / Out of-dialog | In-dialog | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R54 |
| Support VoLTE in Roaming Area |   | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R60 |
| Support VoLTE in case of mobile data is disabled in Roaming Area |   | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R61 |
| Ut GBA Support ? Or not ? |   | yes,Ut GBA supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R65 |
| Ut XCAP Root URI | "/MyServices" (Prefix in request) | / | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R68 |
| Ut proxy server address |   | xcap.ims.mnc006.mcc422.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R69 |
| Ut proxy port | If port is 443, please confirm if TLS is used. | 8080 for xcap | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R70 |
| Ut BSF address (IF Ut support GBA) |   | bsf.ims.mnc006.mcc422.pub.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R71 |
| Ut BSF port (IF Ut support GBA) | If port is 443, please confirm if TLS is used. | 8088 for BSF | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R72 |
| SS domain preference | 1. CS always / : Ut not supported / 2. PS always / : UE will use XCAP always (if PS is not registered, UE will return error). / 3. PS only if VoLTE registered / : UE will use XCAP only if VoLTE is registered. / 4. PS only if PS is registered / : UE will use XCAP when PS is registered (if PS is not registered, UE will try CS domain). | 3. PS only if VoLTE registered | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R73 |
| Usage of SS CS fallback for error | Yes -> CSFB for every errors(including timeout, HTTP errors, etc..) / No -> CSFB for only #403 HTTP error | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R74 |
| Usage of <media> attribute in XCAP | Yes -> Use <media> in XCAP document / No -> No <media> in XCAP document | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R75 |
| Usage of element PUT request for communication diversion | Full -> DUT will send whole call forwarding rules. / Element -> DUT will send only one call forwarding which user selected. | Element | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R76 |
| URI type for call forwarding target number | This will be used for PUT request for call forwarding setting | SIP | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R78 |
| Support Ut in Roaming Area |   | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R80 |
| Support Ut in case of mobile data is disabled in Roaming Area |   | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R81 |
| USSD for VoIMS | Not Availble for Vodafone Oman | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R82 |
| SMS Fallback to CS | SMS Fallback to CS in case device receives SIP error or No response to SIP | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R87 |
| HF-Only | 0. Compact and Header-Full formats can be used VoLTE is registered. / 1. Only Header-Full format | 0 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R89 |
| Short Message Service | SMS-over-IMS is supported in LTE when VoLTE is enabled. | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R6 |
| P-CSCF | The P-CSCF must support AKAv1-MD5 or AKAv2-MD5 authentication. | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R14 |
| Preconditions | Upon originating a VoLTE call, iPhones will mark Local and Remote Preconditions strengthtags as "Optional" in the Offer. When receiving a VoLTE call iPhones will adapt to Offers where Precondition are "Optional" or "Mandatory", and respond with 183 Session Progress. When Preconditions are "Mandatory" the Require header field will contain "precondition". | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R18 |
| Subscriber Services | It is recommended that all subscriber supplementary voice services available for CS calls also be provisioned over SGs when VoLTE is enabled. XCAP can only be supported through the Apple certification process. | Supported XCAP for all supplementary services. / Note: Apple certification process need further Clarification | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R19 |
| SIP Response Codes | (501) SIP response code when SMS-over-IMS is not supported to avoid immediate retries |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R23 |
| PDN | If subscribers are not provisioned for VoLTE service the network should return PDN CONNECTIVITY REJECT with Cause Code 33. | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R37 |
| Roaming | VoLTE and SMS-over-IMS are enabled on roaming networks using S8HR. | Supported (Not Imlemented for Commercial Launch) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R43 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Video over LTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R26 |
| Upgrade from VoLTE to ViLTE / Downgrade from ViLTE to VoLTE | VoLTE | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R27 |
| Enable rtcp on active call |   | Enable | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R47 |
| AMR type | AMR-WB only / AMR-NB only / Both (AMR-WB preferred) / Both (AMR-NB preferred) | Both (AMR-WB preferred) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R55 |
| AMR-WB mode-set | ALL (0,1,2,3,4,5,6,7,8) / or specific value(s) in 0 ~ 8 | ALL (0,1,2,3,4,5,6,7,8) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R56 |
| AMR-NB mode-set | ALL (0,1,2,3,4,5,6,7) / or specific value(s) in 0 ~ 7 | ALL (0,1,2,3,4,5,6,7) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R57 |
| Audio Codec Mode | Octet aligned, Bandwidth efficiency | Both (Bandwidth efficiency preferred) | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R58 |
| DTMF Codec Mode | Out-of-band / In-band / (Out-of-band: RFC 2833 / / In-band: Voice band) | In-band | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R59 |
| Video Codec(format) | H.264, H.263, H.265 / You can choose multiple values. | H264 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R62 |
| Video Capabilities - Resolution | QVGA, VGA, QCIF, HD / You can choose multiple values. | VGA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R63 |
| EVS enable |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R88 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Support IPSec or not |   | Yes | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R39 |
| Encryption Algorithm for IPSec | aes-cbc or des-ede3-cbc or all or none | all | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R40 |
| VoWiFi | Not Availble for Vodafone Oman | NA | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R97 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency Call Support & APN | Please specify if Emergency Calls over VoLTE are supported ? / If supported over VoLTE which APN should be used | CSFB | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R19 |
| Emergency Call over IMS | Emergency Call | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R35 |
| Emergency Call Routing Policy (VoLTE is registered) | 1. CS Preferred / : E-Call should be sent via 3G/2G network even though VoLTE is registered. / 2. VoLTE Preferred / : E-Call should be sent via LTE network when VoLTE is registered. | 1. CS Preferred | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R84 |
| Support Emergency Call in case of No SIM |   | No | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R85 |
| Emergency Calling | If advertised by the Mobile Network, VoLTE enabled devices will initiate emergency calls via the SOS APN. | Vodafone Netwrok don't have a direct connectivity with Emergency Response Centre and we route all emergency calls towards National Operatpr (omantel) Fixed line but system as a capability support the SoS APN for Emergency Services. | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R9 |
| IMS Registration | It is recommended that Networks enforcing protected requests (IPSec) for non-SOS SIP registration challenge any unprotected Register with SIP 421 (Extension Required) or SIP 494 (Security Agreement Required) toward the device. | 421 Extension required for SIP error with cause number 111 (Protocol error, unspecified) is supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R15 |

### 网络能力要求

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| IMS Registration | Is IMS registertration allowed in 3G, LTE, 2G, All? | 4G, 5G | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Common R20 |
| IMS Timers | Registration Expiration: 7200 seconds | cscfRegistrationRefreshMax = 60 mins (3600 seconds) as [er regulatory requirement | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | Apple R20 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Handest Survey for Vodafone.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 Vodafone 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

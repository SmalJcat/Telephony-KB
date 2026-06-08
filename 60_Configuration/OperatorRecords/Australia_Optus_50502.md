---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Optus
mccmnc: "50502"
country: Australia
source: F:\Codex\Knowledge\运营商参数归档\Optus Device Specs v9.8_PROTECTED.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Australia Optus 50502

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Australia |
| 运营商 | Optus |
| MCCMNC | `50502` |
| MCC/MNC 证据 | 原表 `VoLTE UE Requirement Checklist` R45/R46 写 `505002`；`VoWiFi` R9 ePDG FQDN 使用 `mnc002.mcc505`。这里按配置匹配口径记录为 MCC `505` + MNC `02`，即 `50502`。 |
| 公网查证 | MCC `505` / MNC `02` 对应 Australia Optus；ITU E.212 列表也能查到 Optus `505 02`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Optus Device Specs v9.8_PROTECTED.xlsx` |
| 资料版本 | Version History R22: v9.8, 2025-03-13 |
| 覆盖范围 | APN、IMS、VoLTE、VoWiFi、Emergency、SMS、LTE、5G NR、NB-IoT/Cat-M1、SIM/eSIM |
| 配置前重点 | `505002` 是原表/域名中的补零写法；配置时使用 `50502`。UT APN、Emergency APN 和 ECC 号码仍需回查原表或运营商确认。 |

## 使用边界

- 本文只保存和运营商网络参数相关的需求，便于后续配置 APN、CarrierConfig、Modem NV、ECC 或排查 IMS/VoWiFi 问题时回查。
- 本文不记录载波聚合组合明细，也不记录与网络参数无关的客户定制项。
- 需求正文保留原表三列口径：`Requirement Name`、`Requirement Description`、`Requirement Value`。其中 `Requirement Value` 对应原表第三列；原表第三列表头为空时，这里统一命名为 `Requirement Value`，内容按原始取值保留。
- 中文只用于分区、备注和风险说明，不替代原始需求文本。
- 本文不判断目标平台默认值，也不直接给出落地配置结论。真正配置前仍需结合目标平台代码、默认值缓存、生成产物和运行时证据确认。
- 各需求表最后一列保留原 xlsx 的 sheet/row，便于人工回查。

## 配置相关重点

### 身份与匹配

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| MCC MNC for LTE |  | `505002` | 原表写成 6 位。本文按 MCC `505` + MNC `02` 记录为配置侧 MCCMNC `50502`。 | VoLTE R45 |
| MCC MNC for 3G/2G |  | `505002` | 与 LTE 一致，仍按 `50502` 理解。 | VoLTE R46 |
| ePDG address/FQDN | FQDN based on MCC/MNC (as per 3GPP TS 23.003) | `epdg.epc.mnc002.mcc505.pub.3gppnetwork.org` | ePDG 域名中 `mnc002` 是 MNC `02` 的三位补零格式。 | VoWiFi R9 |
| SIM type | XCAP and BSF server address MUST match to USIM format | USIM | 原表未要求 ISIM，配置前不要把 ISIM 当作必选条件。 | VoWiFi R29 |
| Radio Access NW (RAN) | Infrastructure vendor of RAN | Nokia & huawei | 网络背景信息，只用于理解对端环境，不直接等同配置项。 | VoLTE R28 |
| IMS Core Network | infrastructure vendor of IMS Core network | Ericsson | 网络背景信息，只用于理解对端环境，不直接等同配置项。 | VoLTE R33 |
| EPS | Infrastructure vendor of EPS | Nokia, Ericsson | 网络背景信息，只用于理解对端环境，不直接等同配置项。 | VoLTE R35 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| APN for Non-IMS Applications | The UE shall use a multi-purpose APN for the Ut interface and all non-IMS applications. | yesinternet (IPv4 Only) | non-IMS/Ut 使用 `yesinternet`。这与后面 `Ut APN = HOS APN` 存在冲突，配置前需确认。 | VoLTE R50 |
| APN for VoLTE Smartphone | APN used on VoLTE smartphone for data (non IMS) connection (If VoLTE phones use a different Data APN than CSFB phones) | yesinternet (IPv4 Only) | Handset 默认数据 APN。配置时应作为 default data APN 候选。 | VoLTE R51 |
| APN for IMS Usage | The UE shall use the “IMS” APN defined in GSMA PRD IR.88 for all IMS traffic except Ut. This APN shall be used on EUTRAN, UTRAN and GERAN. | IMS (IPv6 only) | 原表 APN 大写为 `IMS`。落地前需确认目标平台 APN 大小写处理。 | VoLTE R52 |
| IMS APN for VoLTE Smartphone | APN used on VoLTE smartphone for IMS related traffic | IMS (IPv6 only) | IMS 业务 APN。 | VoLTE R53 |
| APN for VoLTE emergency Call |  | SOS | LTE emergency APN。表内同时出现 `SOS APN IPv4/IPv6 dual support = No` 的描述，落地前必须回查上下文。 | VoLTE R54 |
| APN in EPS Attach | VoLTE devices shall use the multi-purpose APN when performing an EPS attach. | follow ESM, with default yesinternet | VoLTE 终端使用 multi-purpose APN 做 EPS attach。 | VoLTE R55 |
| Default retail Yes Internet access point | APN | yesinternet | MBB & Device Customisations 的 handset APN 矩阵，作为 default data APN 参考。 | MBB & Device Customisations R116-R129 |
| MMS access point | APN / MMSC / proxy / port | mms; `http://mmsc.optus.com.au:8002/`; `61.88.190.10`; `8070` | MMS APN。配置时注意 MMSC/proxy/port 不要混入 default data APN。 | MBB & Device Customisations R116-R129 |
| Yes Business access point | APN | yesbusiness | Business APN，不应替代默认 data APN。 | MBB & Device Customisations R116-R129 |
| Optus Connect | APN | connect | 面向 MBB 设备的 APN 资料，手机项目是否需要取决于产品形态。 | MBB & Device Customisations R4-R5 |
| Optus Prepaid | APN | preconnect | 面向 MBB 设备的 APN 资料。 | MBB & Device Customisations R4/R6 |
| Optus Connectme | APN | connectme | 面向 MBB 设备的 APN 资料。 | MBB & Device Customisations R4/R8 |
| Optus Connectcap | APN | connectcap | 面向 MBB 设备的 APN 资料。 | MBB & Device Customisations R4/R9 |
| APN visibility and activation | DUT must detect correct APNs according to inserted SIM; no Virgin APNs with Optus SIM and no Optus APNs with Virgin SIM |  | 配置时需确认是否存在 Virgin/Optus 共用 MCCMNC 或 MVNO 匹配条件。 | MBB & Device Customisations R110/R187 |
| Concurrent LTE APN support |  | Minimum 5 APNs | 属于终端能力要求，不是单个 APN profile 字段。 | General Specifications R134 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over WiFi? |  | Preferred | VoLTE sheet 中的总体偏好；具体 ePDG 和 VoWiFi 策略见 VoWiFi section。 | VoLTE R23 |
| Video over LTE? |  | NO | 表示 ViLTE 不启用，配置时不要误开视频通话能力。 | VoLTE R24 |
| Upgrade from VoLTE to ViLTE? |  | NO | 表示 VoLTE 到 ViLTE 升级不启用。 | VoLTE R25 |
| Downgrade from ViLTE to VoLTE? |  | NO | 表示 ViLTE 到 VoLTE 降级不启用。 | VoLTE R26 |
| VoLTE ON/OFF | should be set to ON by Default VoLTE On/Off switch should be hidden | M | 可能对应 CarrierConfig 或运营商配置开关，配置前需比对平台默认值。 | VoLTE R3 |
| Network mode should read | 4G / 3G (not LTE etc) | P | UI 显示要求，是否属于当前项目范围需单独确认。 | VoLTE R4 |
| VoLTE icon | VoLTE icon to be displayed in upper right of Notification area when in a VoLTE coverage area | M | UI 图标要求，不能用来证明 IMS 注册或媒体能力。 | VoLTE R5 |
| HD icon | Display HD icon in a call when the call carries over VoLTE / AMR-WB | M | UI 图标要求，不能用来证明 IMS 注册或媒体能力。 | VoLTE R11 |
| RAT | UE shall register IMS on | LTE ONLY | IMS 不走 2G/3G。若现场出现 CSFB，需要区分 IMS 未注册、策略回落和网络覆盖问题。 | VoLTE R58/R68 |
| Max number of PDN connections |  | 11 | 属于连接能力要求，通常不是单个运营商 APN 字段。 | VoLTE R61 |
| Max number of APN connections |  | 11 | 属于连接能力要求，通常不是单个运营商 APN 字段。 | VoLTE R62 |
| Continue to use CSFB until IMS is registered |  | Yes | IMS 未注册前允许 CSFB/SGs，避免把未注册阶段误判为 VoLTE 必须承载。 | VoLTE R72 |
| P-CSCF address discovery via PCO |  | Yes | 静态 P-CSCF 不要求；配置时优先保留 PCO/DHCP 发现路径。 | VoLTE R73 |
| P-CSCF address discovery via DHCP |  | Yes | 静态 P-CSCF 不要求；配置时优先保留 PCO/DHCP 发现路径。 | VoLTE R74 |
| P-CSCF address pre-configured in UE |  | No | 不要求预置 P-CSCF。 | VoLTE R75 |
| IMS registration failure handling | 403 / 408 / 500 / 503 / 504 / Timer F / 305 handling |  | 排查注册失败时重点看 SIP cause、Retry-After 和 P-CSCF 切换。 | VoLTE R79-R81 |
| IMS APN failure handling | Cause 28 or 33 on IMS APN disables IMS until recovery trigger |  | IMS APN 建链失败后保持 CSFB 模式，需结合 PDN reject log 判断。 | VoLTE R108 |
| SRVCC support | SRVCC yes; to UMTS yes; to GSM no; SRVCC+PSHO yes; IMS emergency SRVCC yes; mid-call SRVCC yes but not initially |  | 支持 LTE 到 UMTS 的 SRVCC，不支持到 GSM；Emergency SRVCC 也要求支持。 | VoLTE R84-R89 |
| IMS QoS and LTE bearer capability | GBR/QCI yes; TTI bundling yes; CDRX yes; RoHC yes; ISR yes; SPS no |  | 属于 IMS/LTE 承载能力要求，具体是否可配要看目标 modem 能力和 NV 映射。 | VoLTE R90-R96 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| IPSec |  | yes | IMS 鉴权和安全算法要求，配置时需区分 IMS 注册安全和 Ut/XCAP 鉴权。 | VoLTE R101 |
| IMS AKA / authentication | MD5/SHA; AKA & IPSEC; Ut auth GBA-ME; encryption AES/DES preferred; ISIM/USIM AKA yes |  | IMS 鉴权和安全算法要求，配置时需区分 IMS 注册安全和 Ut/XCAP 鉴权。 | VoLTE R102-R107 |
| T1 |  | 2s | SIP 定时器要求，后续可映射到 IMS profile/NV 或平台 IMS 配置。 | VoLTE R110 |
| T2 |  | 16s | SIP 定时器要求。 | VoLTE R111 |
| T4 |  | 17s | SIP 定时器要求。 | VoLTE R112 |
| SIP INVITE response timeout |  | 10s | SIP INVITE 超时要求。 | VoLTE R113 |
| AMR-NB |  | yes | 支持 AMR-NB。 | VoLTE R115 |
| AMR-WB |  | yes, support all with default setting 12.65 | 支持 AMR-WB，默认码率关注 12.65。 | VoLTE R116 |
| RTP timeout |  | 10s | VoLTE 媒体超时。VoWiFi 表中另写 20s，两个场景不要混用。 | VoLTE R117 |
| SIP precondition |  | No | 明确关闭 SIP precondition。 | VoLTE R125 |
| Early media | Ringback tone / network announcement supported via early media audio path |  | 与回铃音、网络通知音相关，排查无回铃音时可回查。 | VoLTE R127 |
| DTMF |  | Yes; RFC 2833 or RFC 4733 | DTMF 需走 RFC2833/RFC4733。 | VoLTE R128 |
| Ut APN | Separate APN for Ut | HOS APN | 与 R50 的 `yesinternet` 描述冲突，不能直接落地，见待确认项。 | VoLTE R131 |
| XCAP root URI | Based on Home Network Domain Name from ISIM per 3GPP TS 23.003 R10 section 13.9 |  | 无固定 XCAP FQDN。若平台需要固定 URI，需要另找运营商资料。 | VoLTE R133 |
| Supplementary service capability | OIR yes but check with AFG server; CW yes; call transfer yes but check for XCAP; anonymous call rejection no |  | SS 能力要求中带有确认条件，不宜直接全部转成开关。 | VoLTE R135-R138 |
| Supplementary service dial codes | Support SC 31, 43, 21, 67, 61, 62, 002, 004; CW/CF dial strings converted to Ut requests |  | 补充业务拨号码需转成 Ut 请求。 | VoLTE R139 |
| Conference event and size | Subscribe within dialog; X-way conference minimum 3 participants |  | 会议业务要求，后续可用于 conference event package 配置核对。 | VoLTE R148-R149 |
| SMS over SGs/CS |  | Yes | IMS 注册后仍需支持通过 SGs/CS 接收 SMS。 | VoLTE R152 |
| SMS over IMS |  | Yes if configured for both SG and IMS; supported in LTE, 3G, and 2G | SMS over IMS 可用，但表述依赖配置条件。 | VoLTE R153 |
| Mobile data off and VoLTE | Mobile data ON/OFF shall not affect VoLTE traffic |  | 关闭移动数据不应影响 VoLTE。排查 data off 语音失败时可回查。 | VoLTE R159 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| ePDG | Network Vendor Name | Ericsson | ePDG 网络供应商信息。 | VoWiFi R7 |
| ePDG address/FQDN | FQDN based on MCC/MNC (as per 3GPP TS 23.003) | epdg.epc.mnc002.mcc505.pub.3gppnetwork.org | ePDG 域名中 `mnc002` 是 MNC `02` 的三位补零格式。 | VoWiFi R9 |
| Encryption algorithm | Encryption algorithm for both IKE and Child SA - DES, 3DES, AES-128, AES-256 | AES-256 | ePDG 隧道算法要求。 | VoWiFi R10 |
| PRF algorithms | Used to generate keys within IKE, Pseudorandom function - SHA1-160, MD5-128, SHA2-256, SHA2-512 | PRF_HMAC_SHA2_256 | ePDG 隧道算法要求。 | VoWiFi R11 |
| IntegrityAlgorithm | MD5-96, MD5-128, SHA1-96, SHA1-160, SHA2-256, SHA2-384, SHA2-512 | AUTH_HMAC_SHA2_256 | ePDG 隧道算法要求。 | VoWiFi R12 |
| IKE version |  | v2 | ePDG IKE version。 | VoWiFi R13 |
| IKEv2 Certificate | .der format conforming to X.509 based Public Key Infrastructure Certificate profile. | Disabled | Certificate 关闭。 | VoWiFi R14 |
| IKEv2 fast re-authentication |  | Disabled | Fast re-auth 关闭。 | VoWiFi R15 |
| IKEv2 rekey timer |  | 3001 sec | ePDG 隧道定时器。 | VoWiFi R16 |
| IKEv2 DPD (Dead Peer Detection) timer |  | 3600s and retry number of 2 | ePDG DPD 定时器。 | VoWiFi R17 |
| MTU size |  | 1500bytes | ePDG MTU 要求。 | VoWiFi R18 |
| IPSec | Support IPSec | Yes | ePDG 隧道要求。 | VoWiFi R19 |
| IPSec rekey timer |  | 24 hours | ePDG IPSec rekey 要求。 | VoWiFi R20 |
| DH Group |  | 14 | ePDG DH group。 | VoWiFi R21 |
| PFS (Perfect Forward Secrecy) | RFC 2412 | Enabled | ePDG PFS 要求。 | VoWiFi R22 |
| P-CSCF Address assignment via Wifi | supports method specified in draft-gundavelli-ipsecme-3gpp-ims-options-04 | Enabled | Wi-Fi 下 P-CSCF 仍通过动态发现，关注 IKE CP/PCO 能力。 | VoWiFi R23 |
| P-CSCF Discovery via IKEv2 signaling | draft reference | Recommended: - IKE CP Extension (SWu) + PCO (S2b) | Wi-Fi 下 P-CSCF 动态发现方式。 | VoWiFi R24 |
| Attribute type ID for P-CSCF Configuration Attribute | support the range according to RFC7651 | P-CSCF_IP4_ADDRESS: 20; P-CSCF_IP6_ADDRESS: 21 | P-CSCF attribute ID。 | VoWiFi R26 |
| IMS Re-registration |  | UE should trigger RE-REG during mobility between LTE-WiFi | LTE/Wi-Fi 切换需要触发重注册。 | VoWiFi R30 |
| Preconditions |  | Disabled | VoWiFi 下 precondition 关闭。 | VoWiFi R32 |
| RTCP support |  | Enabled | VoWiFi 媒体要求。 | VoWiFi R33 |
| Early Media |  | Yes, Network to UE direction | VoWiFi early media。 | VoWiFi R34 |
| TADS Support | Terminating-Access Domain Selection | Supported | VoWiFi TADS support。 | VoWiFi R35 |
| RTP timeout |  | 20s | VoWiFi 媒体超时，和 VoLTE 10s 不同。 | VoWiFi R38 |
| LTE/Wi-Fi handover |  | Mandatory handover in both directions | VoWiFi 与 VoLTE 双向切换都要求支持。 | VoWiFi R46 |
| Rove in/out threshold | LTE RSRP rove in -113, rove out -104; 3G RSCP rove in -108, rove out -99 |  | Wi-Fi calling 注册/切换门限；注意单位和平台字段含义。 | VoWiFi R87-R90 |
| Call setup fallback | SIP INVITE response timeout 10s triggers cellular retry |  | Wi-Fi 呼叫建立超时后重试蜂窝侧。 | VoWiFi R49 |
| Ut/XCAP over Wi-Fi | APN HOS IPv4; XCAP auth GBA_ME; roaming no; data disabled yes; IMS-registration dependent true | Yes | Wi-Fi 下 Ut/XCAP 要求，APN HOS 与 VoLTE 表的 Ut APN 冲突需确认。 | VoWiFi R51-R58 |
| SMS/MMS over Wi-Fi | SMS over IMS over Wi-Fi enabled; MMS over Wi-Fi APN `mms` |  | Wi-Fi 下 SMS 走 IMS，MMS 使用 `mms` APN。 | VoWiFi R69-R72 |
| Roaming over VoWiFi |  | Disable | 不支持 VoWiFi roaming。 | VoWiFi R73-R74 |
| DSCP marking | Required DSCP 46 with class selector 5; ePDG handles DSCP/class selector markings |  | 原表疑似把 DSCP 写成 SDCP；按 DSCP 理解。 | VoWiFi R75-R76 |
| VoWiFi UI | Switch default ON; show switch in settings; show preferred network mode; default preferred mode Cellular Preferred |  | UI/偏好要求，不代表 IMS over Wi-Fi 已成功注册。 | VoWiFi R77-R81 |
| VoWiFi icon/SPN | Display VoWiFi icon instead of VoLTE icon when VoWiFi registered; SPN `Optus Wi-Fi Call` if customizable |  | 仅在 VoWiFi 已注册时显示。 | VoWiFi R82-R83 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| APN for VoLTE emergency Call |  | SOS | LTE emergency APN。由于同表 dual support 表述冲突，不能只凭这一行直接配置。 | VoLTE R54 |
| IMS emergency SRVCC |  | yes | 紧急呼叫场景也要求 SRVCC。 | VoLTE R84-R89 |
| Emergency over VoWiFi |  | Supported domestic only | 只支持本国紧急呼叫走 VoWiFi。 | VoWiFi R60 |
| Emergency RAT preference |  | VoLTE, Optus CSFB, other carrier CS, last resort Wi-Fi | 紧急呼叫优先蜂窝网络，Wi-Fi 是最后选择。 | VoWiFi R61 |
| Airplane mode emergency | Disable airplane mode and initiate cellular call as soon as service available |  | 飞行模式下发起紧急呼叫时，设备应尽快恢复蜂窝侧呼叫。 | VoWiFi R62 |
| Emergency HO | Emergency HO from VoWiFi to VoLTE supported |  | 紧急呼叫支持从 VoWiFi 切到 VoLTE。 | VoWiFi R63 |
| Emergency APN over Wi-Fi |  | ims | Wi-Fi emergency 使用 `ims`，不要和 LTE emergency APN `SOS` 混在一起。 | VoWiFi R64 |
| Emergency number source |  | Follow SIM/Network/3GPP spec | 原表没有给具体号码清单，不能从本文推导 ECC 号码。 | VoWiFi R65 |
| Emergency location | Geo location header supports PANI and PIDF-LO; GPS coordinates yes |  | VoWiFi 紧急呼叫需要携带位置相关信息。 | VoWiFi R67-R68 |

## 网络能力要求

### LTE / 4G

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| LTE Frequency Bands |  | B1, B3, B7, B8, B28, B40 | Optus LTE 频段要求。 | General Specifications R6 |
| LTE radio bandwidth |  | All bandwidths for all bands | 频段带宽总体要求，具体带宽见原表。 | General Specifications R7 |
| B40 UL - DL configurations |  | Configurations 2, SSF 5, SSF 7 | B40 TDD 配置要求。 | General Specifications R8 |
| LTE / 3G Interoperability |  | LTE / WCDMA Idle Reselection; LTE / HSPA Blind Redirection; LTE / HSPA Redirection with measurements; LTE / HSPA Active-mode PS Handover | LTE 和 3G 互操作能力要求。 | LTE R7-R10 |
| TDD/FDD Interoperability |  | TDD LTE/FDD LTE Idle mode Reselection; TDD LTE/FDD LTE Redirection with measurements; TDD LTE/FDD LTE Active-mode PS Handover | TDD/FDD 互操作能力要求。 | LTE R11-R13 |
| Band selection options |  | 3G only mode must not be supported; LTE & 3G with LTE Preferred as default; 2G only mode must not be supported | 网络模式选择要求。 | LTE R14-R16 |
| RAT Priority (power up, in and out of coverage areas), 4G only devices |  | B40 - B7 - B3/B1 - B28 - 3G, then follow network instructions | 4G-only 开机搜网优先级。 | LTE R17 |
| RAT Priority (power up) for 5G FWA devices |  | B3 - B1 - B7 - B28 - B8 - B40, then follow network instructions | FWA 场景开机搜网优先级。 | LTE R19 |
| SRVCC from TDD and FDD LTE to 3G | For VoLTE devices | M | 与 VoLTE SRVCC 要求一致；GSM 方向不支持。 | LTE R20 |
| Inter-freq/inter-RAT measurement support | AS Rel-12 and newer (except Cat 0 devices): Minimum 13 freq as specified by 3GPP TS36.133 UE measurement capability | M | Inter-frequency / inter-RAT 测量能力要求。 | LTE R21-R23 |
| CDRX |  | M | LTE 省电能力要求。 | LTE R24 |
| Cell_PCH and DRX support |  | M | LTE 省电/空闲态能力要求。 | LTE R25 |
| ESM information transfer flag enabled |  | M | LTE ESM information transfer flag 要求开启。 | LTE R26 |
| 256 QAM downlink | For Cat 11 or above devices, all LTE bands | P | Cat 11+ 关注 DL 256QAM。 | LTE R28 |
| 64 QAM uplink | For Cat 15 (DL) or above devices, all LTE bands | P | Cat 15+ 关注 UL 64QAM。 | LTE R29 |
| LTE band bandwidth table | B1 20 MHz; B3 15/20 MHz; B7 10/15/20 MHz; B8 10 MHz; B28 10 MHz; B40 20/40 MHz |  | Optus LTE 频段带宽表。 | LTE R40-R47 |
| Nokia DRX | QCI 5-8 long cycle 320ms, on-duration 20, inactivity 500, retransmission 8; QCI 1 long cycle 40ms, on-duration 6, inactivity 4, retransmission 4 |  | Nokia 网络下 DRX 参数要求。 | VoLTE R163-R172 |
| Huawei DRX | QCI 5-8 long cycle 320ms, on-duration 20, inactivity 100, retransmission 8; QCI 1 long cycle 40ms, on-duration 10, inactivity 80, retransmission 4; short cycle for QCI 5-8 FDD 40/TDD 80 |  | Huawei 网络下 DRX 参数要求；TDD DRX trial not production。 | VoLTE R174-R183 |
| ISIM service table | P-CSCF 1; GBA 1; HTTP Digest 0; GBA local key 0; P-CSCF discovery local breakout 1; SMS/SMSR/SM-over-IP/IMS communication control/UICC access 0 |  | 原表 service bit 记录，用于 SIM/ISIM 能力核对。 | VoLTE R187-R199 |

### 5G NR

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| 5G NR Band (sub 6) |  | TDD: n78, n40; FDD: n1, n3, n28, n7, n8 | Optus NR Sub-6 频段要求。 | 5G NR R5-R6 |
| 5G NR Band (mmWave) |  | n257, n258 (for mmWave devices) | 仅适用于支持 mmWave 的设备。 | 5G NR R7 |
| NSA Dual band connectivity |  | Option 3X | NSA 架构摘要。 | 5G NR R14 |
| Software upgradable to enable SA mode support |  | Option 2 | SA 架构摘要；组合能力条件不在本文展开。 | 5G NR R15 |
| VoLTE bearer with NR |  | EPS Fallback | NR 下语音通过 EPS fallback。 | 5G NR R42 |
| Automatic Fast Return to SA |  | Must be disabled; network controls return to SA | 不允许终端自行快速返回 SA，由网络控制。 | 5G NR R48 |
| Services in LTE idle with NR / after NR addition |  | VoLTE, CSFB, SMS, MMS, SS | LTE idle with NR 或 NR addition 后支持的业务集合。 | 5G NR R66/R68 |
| NR bandwidth table | n78/n40: 10/15/20/25/30 MHz mandatory, 5 MHz optional; n1/n8/n28 mandatory for listed widths; n3/n7 preferred |  | NR 频段带宽要求，原表使用 M/O/P 标记。 | 5G NR R73-R82 |

### NB-IoT / Cat-M1

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| NB-IoT Frequency Bands | B28 | M | NB-IoT 频段要求。 | NB IoT_Cat-M1 R5 |
| LTE radio bandwidth | 180 KHz | M | NB-IoT radio bandwidth。 | NB IoT_Cat-M1 R6 |
| eDRX / PSM / coverage extension | Required |  | NB-IoT 省电和覆盖增强能力要求。 | NB IoT_Cat-M1 R39-R41 |
| SIM form factor support | 2FF/3FF/4FF/ | P | NB-IoT 表允许 2FF/3FF/4FF；通用设备章节要求 3FF/4FF。 | NB IoT_Cat-M1 R34 |
| Ipv4 |  | M | NB-IoT IP 能力要求。 | NB IoT_Cat-M1 R30 |
| Ipv6 |  | M | NB-IoT IP 能力要求。 | NB IoT_Cat-M1 R31 |

### SIM / eSIM

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| SIM form factor | 3FF or 4FF for general devices |  | 通用终端 SIM 卡形态要求。 | General Specifications R168 |
| eSIM support | Must have normal SIM support | O | eSIM 可选，但不能替代实体 SIM 支持。 | General R176; NB IoT R35 |

## 原表回查索引

| Sheet | 本文保留内容 | 何时回查原表 |
|---|---|---|
| General Specifications | LTE bands、network mode、APN capacity、SIM/eSIM、VoLTE/VoWiFi/VoNR support summary | 需要确认通用网络能力、SIM/eSIM 或 APN capacity 时。 |
| MBB & Device Customisations | MBB/Tablet/Handset APN、MMS、streaming proxy、APN matching | 需要写 APN、MMS 或区分 Optus/Virgin APN 时。 |
| LTE | LTE/3G/TDD/FDD mobility、SRVCC、measurement、bandwidth table | 需要确认 LTE 能力或 modem capability 时。 |
| 5G NR | NR band、NSA/SA、SA policy、EPS fallback、AFR to SA、NR bandwidth | 需要确认 5G 能力或 SA/NSA 策略时。 |
| VoLTE UE Requirement Checklist | MCCMNC、IMS APN、VoLTE UI、P-CSCF、registration failure、SRVCC、SIP/media、SMS、DRX、ISIM service table | 需要配置或分析 IMS/VoLTE 时。 |
| VoWiFi | ePDG、IKE/IPSec、P-CSCF over Wi-Fi、handover、UT/XCAP、Emergency over VoWiFi、SMS/MMS over Wi-Fi threshold | 需要配置或分析 VoWiFi/ePDG 时。 |
| NB IoT_Cat-M1 | NB-IoT band、SIM、eDRX/PSM/coverage extension、IP support | 需要确认 NB-IoT/Cat-M1 需求时。 |
| Version History | v9.8 版本和更新时间 | 需要确认资料版本时。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 原表 `505002` 写法 | 本文已按用户确认记录为 `50502`。原表 `505002` 和 ePDG `mnc002.mcc505` 是 MNC `02` 的补零表达，不再作为配置侧 MCCMNC。 |
| APN for Ut | VoLTE R50 说 non-IMS/Ut 使用 multi-purpose APN `yesinternet`，R131 又写 separate APN for Ut = HOS APN；后续配置前需要按目标平台和运营商最新资料确认。 |
| Emergency APN dual support | VoLTE R54/R66-R67 记录 emergency APN `SOS` 和 type IPv4v6，但同表也写 SOS APN IPv4/IPv6 dual support 为 No；配置前需回查原表上下文。 |
| Emergency number list | VoWiFi 只写 Follow SIM/Network/3GPP Spec，未给出具体号码清单；不能从本文推导 ECC 号码。 |

## 维护备注

- 这份资料是 Optus Device Specs v9.8 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原 xlsx 的 sheet/row，再结合目标平台默认值和实现路径确认。

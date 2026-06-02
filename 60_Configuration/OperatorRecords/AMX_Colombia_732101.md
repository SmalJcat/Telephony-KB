---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
operator: AMX Colombia
mccmnc: "732101"
country: Colombia
source: F:\Codex\Knowledge\运营商参数\IMS Parametrization_ AMX Operations_CO_v31.xlsx
status: requirements_backup
last_updated: 2026-06-01
---

# AMX Colombia 732101

## 阅读入口

- 本页只作为运营商需求表备份，用于按运营商、MCCMNC、业务域和原表位置回查要求。
- 不直接作为平台配置方案；需要落地配置时，回到 `60_Configuration` 下对应配置方法和目标平台代码/产物确认。
- 表内空值、N/A、默认值和未确认项按原资料保留，不主动推断。


## 基本信息

| 字段 | 值 |
|---|---|
| Operator | AMX / Claro Colombia |
| Country | Colombia |
| MCCMNC | 732101 |
| MCC / MNC 证据 | Identities / Other / XCAP 多处使用 `mnc101.mcc732`，Other sheet 写 `MNC: 101 / MCC: 732` |
| 资料来源 | `IMS Parametrization_ AMX Operations_CO_v31.xlsx` |
| 备注 | 表内很多行已经人工标注“默认”，这里仍作为运营商参数备份保留关键字段 |

## 需求参数表

| 业务域 | 参数 / 问题 | 运营商要求 / 取值 | 来源 | 备注 |
|---|---|---|---|---|
| IRAT | LTE to 3G | Handover | Network R2 | 网络间切换方式 |
| IRAT | 3G to LTE | Redirection | Network R3 | 网络间切换方式 |
| IMS | IMS default configuration on UE | IMS ON, always | Network R4 | IMS 默认开 |
| IMS APN | IMS 3G PDN | `ims`, ICS based, no data | Network R5 | IMS PDN |
| IWLAN | ePDG APN | `ims` | Network R6 | IWLAN/ePDG |
| Security | IPSEC | WiFi, IWLAN | Network R8 | IPSEC 使用范围 |
| Security | SRTP | OFF | Network R9 | SRTP 关闭 |
| Security | TLS | OFF | Network R10 | TLS 关闭 |
| Preconditions | PRECONDITION | Yes, ON | Network R11 | SIP precondition |
| AVPF | AVPF | ON | Network R12 | 表内备注保持默认 |
| IMS timers | Registration / Subscription / Session | 3600s / 259200s / 1800s | Network R15 | IMS timer |
| P-CSCF | CSFB until IMS registered | Yes | P-CSCF R2 | IMS 注册前使用 CSFB |
| P-CSCF | Discovery | Network supports; default DHCP | P-CSCF R3 | P-CSCF discovery |
| P-CSCF | Static P-CSCF address | `pcscf.ims.mnc101.mcc732.3gppnetwork.org` | P-CSCF R10 | 可配置 URL |
| P-CSCF | Ringing Timer | 30s; some exceptions 90s | P-CSCF R12 | 语音邮箱相关 |
| P-CSCF | Ringback Timer | 30s; some exceptions 90s | P-CSCF R13 | 语音邮箱相关 |
| Auth | ISIM AKA Auth | Priority 1 | Authentication R3 | ISIM 优先 |
| Auth | USIM AKA Auth | Priority 2 | Authentication R4 | USIM 次优先 |
| SRVCC | SRVCC | Yes | Enablers R2 | 支持 |
| SRVCC | SRVCC to UMTS | Yes | Enablers R3 | 支持 UMTS |
| SRVCC | mid-call SRVCC | eSRVCC ON, aSRVCC OFF, bSRVCC OFF | Enablers R5 | 网络启用 eSRVCC |
| CDIV | Serve multiple CDIV rules | Supported / ON | Enablers R6 | 一次请求多规则 |
| QoS | GBR and QCI | Yes | Enablers R7 | 支持 5 non-GBR and 4 GBR QCIs |
| CDRX | CDRX for QCI 1/8/9 | Yes | Enablers R8-R12 | Long DRX 40ms, On Duration 4ms, Inactivity 4ms |
| RLC | UM or AM | RLC UM | Enablers R13 | UM preferred |
| RAN codec adaptation | RAN assisted codec adaptation | Network available, feature OFF | Enablers R14 | 网络侧能力 |
| Identity | IMPI | `<IMSI>@ims.mnc101.mcc732.3gppnetwork.org` | Identities R2 | IMPI 格式 |
| Identity | IMPU | `sip:<IMSI>@ims.mnc101.mcc732.3gppnetwork.org` | Identities R3 | IMPU 格式 |
| Identity | Domain | `ims.mnc101.mcc732.3gppnetwork.org` | Identities R4 | IMS domain |
| URI | TEL URI / SIP URI | Yes / Yes | Identities R5-R6 | 两者均支持 |
| VoLTE | Speech session setup | Yes | VoLTE & VoWiFi R2 | IR.92/26.114 |
| Codec | Symmetric payload type numbers | Yes | VoLTE & VoWiFi R3 | SDP payload type |
| ECN / TFO | ECN / TFO | No / Yes | VoLTE & VoWiFi R4-R5 | 网络能力 |
| RTP | RTP support | Yes | VoLTE & VoWiFi R6 | VoLTE RTP |
| Codec | AMR-NB / AMR-WB | Yes / Yes | VoLTE & VoWiFi R7-R8 | 语音 codec |
| TADS | TADS support and timer | Yes, 60 seconds | VoLTE & VoWiFi R10 | TADS |
| CS fallback | Fall Back to CS timer | 8 sec | VoLTE & VoWiFi R11 | 网络回寻 CS 定时 |
| Early media | P-Early-Media | Yes, True | VoLTE & VoWiFi R12 | P-Early-Media |
| AVPF | Voice / video AVPF | Voice OFF, Video ON | VoLTE & VoWiFi R14 | AVPF 策略 |
| IMS PDN | PDN connection failure cause | MME cause 33 until next power cycle | VoLTE & VoWiFi R15 | 网络拒绝策略 |
| UI | Display VoLTE icon | True | VoLTE & VoWiFi R19 | 状态栏显示 VoLTE 图标 |
| UI | Option to enable / disable VoLTE | TRUE | VoLTE & VoWiFi R20 | 菜单开关 |
| IMS default | Default IMS config for VoLTE / VoWiFi | ON | VoLTE & VoWiFi R23 | IMS 默认开 |
| Codec | Codec priority | AMR-WB preferred, then AMR-NB, then G711 | VoLTE & VoWiFi R27 | codec 优先级 |
| Codec | Octet-align | Bandwidth efficient preferred, then octet aligned | VoLTE & VoWiFi R28 | SDP 格式 |
| Codec | Mode change capability | 2 | VoLTE & VoWiFi R30 | MTSI SDP |
| Media bearer | Dedicated EPS bearer for voice | Yes | VoLTE & VoWiFi R32 | 网络建立 dedicated bearer |
| Media bearer | RTP/RTCP over default bearer when no dedicated bearer | No | VoLTE & VoWiFi R34 | 不使用 default EPS bearer |
| SIP transport | Force SIP over UDP | No | VoLTE & VoWiFi R35 | 根据大小使用 TCP |
| SIP transport | MTU threshold | IMS IPv4 1300, IPv6 1280; PGW TCP MSS max 1500 | VoLTE & VoWiFi R36 | SIP TCP/UDP 阈值 |
| IMS registration | Default IMS registration expire | 3600 seconds | VoLTE & VoWiFi R38 | REGISTER expires |
| SIP timers | T1/T2/T4 | Network 500ms/4s/5s; device 2s/16s/17s | VoLTE & VoWiFi R39 | 原表保留两侧值 |
| GRUU | GRUU support | No | VoLTE & VoWiFi R40 | GRUU |
| SIP instance | SIP Instance support | Yes | VoLTE & VoWiFi R41 | SIP instance |
| IMS auth methods | Encryption / Integrity | DES_EDE3_CBC & AES_CBC; HMAC_MD5_96 & HMAC_SHA_1_96 | VoLTE & VoWiFi R42 | 网络支持 |
| RTCP | RTCP bandwidth | Require RTCP bandwidth | VoLTE & VoWiFi R43 | SDP RS/RR |
| Call waiting | Terminal based IMS CW under CS | UE adds Alert-Info | VoLTE & VoWiFi R44 | 终端侧 CW |
| RTCP | Active / held call RTCP interval | Dynamic / Dynamic | VoLTE & VoWiFi R45-R46 | RFC3550 |
| VoWiFi | ePDG support | Yes | VoLTE & VoWiFi R47 | Wi-Fi interaction |
| VoWiFi HO | VoLTE to VoWiFi HO | Yes | VoLTE & VoWiFi R48 | 支持切换 |
| ePDG security | IPSec/IKE algorithms | AES-CBC-128/256, HMAC-SHA1/SHA2, DH14, EAP-AKA | VoLTE & VoWiFi R49-R55 | ePDG 安全参数 |
| ePDG timer | DPD / retry interval / retry times | 120s / 10s / 5 | VoLTE & VoWiFi R56-R58 | IKE DPD 和重试 |
| ViLTE | ViLTE retry status code | SIP 603 when B subscriber rejects video call | ViLTE & ViWiFi R5 | 视频失败转语音场景 |
| Emergency | Emergency PDN | Emergency over IMS available, commercial launch 2024-11-26 | Emergency R2 | 各国家需指示本地配置 |
| Emergency | Priority | PS as primary | Emergency R9 | PS 优先 |
| Emergency | Emergency numbers with SIM | 911, 123, 112 | Emergency R17 | 有卡紧急号码 |
| Emergency | Emergency without SIM | Not Supported | Emergency R18 | 无卡不支持 |
| Emergency | Emergency service URN | 123/911 -> SOS; 112 -> SOS.POLICE | Emergency R26 | URN 要求 |
| EVS | EVS br | 9.6 to 24.4 kbps supported | EVS R3 | 网络支持范围 |
| EVS | EVS bandwidth | NB/SWB and NB/WB supported | EVS R4 | 设备按档位选择 |
| EVS | CMR | Not present (0) | EVS R5 | CMR |
| EVS | ch-aw-recv | 2 | EVS R6 | channel-aware mode |
| EVS | hf-only / evs-mode-switch | Shall not be present | EVS R7-R8 | 不在 SDP 中携带 |
| Supplementary service | PS SS domain preference | PS | Supplementary R5 | 补充业务走 PS |
| Conference | Conference server | `sip:mmtel@conf-factory.ims.mnc101.mcc732.3gppnetwork.org` | Supplementary R16 | 会议服务器 |
| Conference | Conference event subscription | ON | Supplementary R18 | 订阅开启 |
| SMS | SMS over SGs / CS | Yes, both | SMS R2 | SMS 域 |
| SMS | SMS over IMS | Yes, LTE and Wi-Fi only | SMS R3 | Nokia IPSMSGW |
| SMS | Phone context URI | `tel:MSISDN;phone-context=mnc101.mcc732.3gppnetwork.org` | SMS R5 | TEL URI phone-context |
| Roaming | Enable roaming VoLTE | Yes | Other R15 | VoLTE roaming |
| SIP UA | SIP User Agent | `brand model/AMX COL` | Other R17 | UA 格式 |
| XCAP | XCAP FQDN / port | `xcap.ims.mnc101.mcc732.pub.3gppnetwork.org` / 8090 HTTP | XCAP R5-R6 | XCAP |
| BSF | BSF FQDN / port | `bsf.mnc101.mcc732.pub.3gppnetwork.org` / 8080 HTTP | XCAP R7-R9 | USIM/ISIM 有不同 BSF FQDN |
| NAF | NAF FQDN | XCAP domain resolves all requests | XCAP R10 | NAF |

## 备注

- 表内 `备注=默认` 是前期人工标注，本文件只保留需求，不判断是否需要配置。
- AMX 表按 sheet 拆分很细，后续若要配置某一平台，应重新按平台默认值核对。

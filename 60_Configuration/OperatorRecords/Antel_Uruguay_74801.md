---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
operator: Antel Uruguay
mccmnc: "74801"
country: Uruguay
source: F:\Codex\Knowledge\运营商参数\Alcatel-TCL Formulario VOLTE_VOWIFI_9mayo22.xlsx
status: requirements_backup
last_updated: 2026-06-01
---

# Antel Uruguay 74801

## 阅读入口

- 本页只作为运营商需求表备份，用于按运营商、MCCMNC、业务域和原表位置回查要求。
- 不直接作为平台配置方案；需要落地配置时，回到 `60_Configuration` 下对应配置方法和目标平台代码/产物确认。
- 表内空值、N/A、默认值和未确认项按原资料保留，不主动推断。


## 基本信息

| 字段 | 值 |
|---|---|
| Operator | Antel |
| Country | Uruguay |
| MCCMNC | 74801 |
| MCC / MNC 证据 | VoLTE sheet `MCC MNC list = 748, 01` |
| 资料来源 | `Alcatel-TCL Formulario VOLTE_VOWIFI_9mayo22.xlsx` |

## 需求参数表

| 业务域 | 参数 / 问题 | 运营商要求 / 取值 | 来源 | 备注 |
|---|---|---|---|---|
| SIM | Supported SIM type for VoLTE | `USIM, ISIM` | VoLTE R4 | 支持 USIM 和 ISIM |
| APN | IMS APN name | `ims` | VoLTE R6 | IMS APN |
| APN | IMS APN IP type | `IPv4v6` | VoLTE R7 | IMS IP 类型 |
| Emergency | Emergency call over IMS | `IMS preferred` | VoLTE R8 | 紧急呼叫优先 IMS |
| Emergency APN | Emergency call APN name | `Null` | VoLTE R9 | 网络下发 SOS APN |
| Emergency APN | Emergency call APN type | `IPv4v6` | VoLTE R10 | SOS APN IP 类型 |
| VoLTE | Precondition | `ON` | VoLTE R12 | SIP precondition |
| Voice URI | TEL / SIP URI for voice call | `TEL` | VoLTE R13 | 语音呼叫 URI 偏好 |
| Codec | AMR-NB Codec | `YES` | VoLTE R14 | 支持 AMR-NB |
| Codec | AMR-WB Codec | `YES` | VoLTE R15 | 支持 AMR-WB |
| SIP transport | TCP threshold | `1300` | VoLTE R16 | SIP 大包切 TCP 阈值 |
| RTP | RTP Inactive Timer | `20s` | VoLTE R17 | RTP 静默超时 |
| SMS | TEL / SIP URI for SMS | `TEL` | VoLTE R18 | SMS URI 偏好 |
| SMS | SMS over IMS | `Yes` | VoLTE R19 | 支持 SMSoIP |
| SMS | SMS over SGs / CS | `Yes` | VoLTE R20 | 支持 SGs/CS SMS |
| IMS registration | IMS registration maintenance with 2G/3G | `OFF` | VoLTE R21 | 2/3G 保持 IMS 注册关闭 |
| Security | Auth type | `AKA and IPSEC` | VoLTE R23 | 鉴权类型 |
| Security | IPSec algorithm | `Null Yes / Aes Yes / 3des Yes` | VoLTE R24 | IPSec 算法支持 |
| Security | IPSec encryption | `Md5 Yes / Sha1 Yes` | VoLTE R25 | 完整性算法 |
| SRVCC | SRVCC | `Yes` | VoLTE R27 | 支持 SRVCC |
| SRVCC | mid-SRVCC | `Yes` | VoLTE R28 | 支持 mid-call SRVCC |
| SRVCC | aSRVCC / bSRVCC | `Yes / Yes` | VoLTE R29-R30 | 支持 aSRVCC 和 bSRVCC |
| SRVCC | SRVCC to 3G / 2G | `Yes / Yes` | VoLTE R31-R32 | 支持回落 3G 和 2G |
| Conference | Conference URI | `sip:mmtel@conf-factory.ims.mnc001.mcc748.3gppnetwork.org` | VoLTE R34 | 会议 URI |
| Conference | Conference Subscribe | `out-of-dialog` | VoLTE R35 | 会议订阅方式 |
| UT | Supplementary Services over Ut | `Yes` | VoLTE R37 | 支持 Ut/XCAP |
| UT | UT forbidden when VoLTE switch off | `Yes` | VoLTE R38 | VoLTE 关闭时禁止 UT |
| UT | UT forbidden when mobile data switch off | `Yes` | VoLTE R39 | 移动数据关闭时禁止 UT |
| APN / UT | APN for XCAP / Ut | `xcap` | VoLTE R40 | XCAP/UT APN |
| APN / UT | APN type for XCAP / Ut | `IPv4v6` | VoLTE R41 | XCAP/UT IP 类型 |
| GBA | GBA support | `GBA_ME` | VoLTE R42 | GBA 类型 |
| XCAP | XCAP Root URI | `xcap.ims.mnc001.mcc748.pub.3gppnetwork.org` | VoLTE R43 | XCAP 根 URI |
| XCAP | XCAP access protocol | `http` | VoLTE R44 | XCAP 协议 |
| NAF | NAF address / port | `xcap.ims.mnc001.mcc748.pub.3gppnetwork.org` / `80` | VoLTE R45-R46 | NAF 地址和端口 |
| BSF | BSF address / port | `bsf.mnc001.mcc748.pub.3gppnetwork.org` / `8080` | VoLTE R48-R49 | BSF 地址和端口 |
| Supplementary service | SS over UT | OIP/TIP/OIR/TIR, CDIV/NRT, CF*, ICB/OCB/BA* | VoLTE R50 | 支持的补充业务集合 |
| Call waiting | Call Waiting | `UE based` | VoLTE R51 | 终端侧呼叫等待 |
| Call waiting | CS and PS synchronize | `No` | VoLTE R52 | CW 不做 CS/PS 同步 |
| UT fallback | UT fallback CS when UT fail | `No` | VoLTE R53 | UT 失败不回落 CS |
| USSD | USSD over IMS | `No` | VoLTE R54 | USSD 使用 CSFB |
| Supplementary service | SS not support MMI code | `403 Forbidden` | VoLTE R55 | SS 不支持错误码 |
| Supplementary service | SS type forbid fallback CS | `6 to 12` | VoLTE R56 | 禁止回落的 SS 类型 |
| UT | CFNRcChangeWithCFNL | `VERDADERO` | VoLTE R57 | 原表西语 true |
| UT | setDefaultNoReplyTimer | `0` | VoLTE R58 | 无应答计时默认 |
| UT | ContentTypeMode | `0` | VoLTE R59 | HTTP content type mode |
| UT | utBsfAuthBeUsed | `VERDADERO` | VoLTE R61 | BSF 鉴权启用 |
| UT | utOIRSourceMode | `0` | VoLTE R62 | OIR source mode |
| Radio | ROHC | `ON` | VoLTE R64 | ROHC 开启 |
| Radio | TTI-bundling | `ON` | VoLTE R65 | TTI bundling 开启 |
| Radio | SPS | `ON` | VoLTE R66 | SPS 开启 |
| UI | HD icon when IMS registered / in-call / call history | `1 / 1 / 1` | VoLTE R68-R70 | IMS 注册、通话、通话记录显示 HD |
| UI | HD icon in dialer button | `0` | VoLTE R71 | 拨号按钮不显示 |
| UI | HD icon according to voice codec | `NO` | VoLTE R72 | 不按 codec 控制 |
| VoLTE UI | VoLTE calls default setting | `ON` | VoLTE R73 | VoLTE 默认开 |
| VoLTE UI | VoLTE calls display in setting menu | `1` | VoLTE R74 | 设置菜单显示 |
| VoLTE UI | Indicate user when turning off VoLTE | `NO` | VoLTE R75 | 关闭 VoLTE 不提示 |
| Roaming | VoLTE roaming | `ON` | VoLTE R76 | 漫游 VoLTE 开 |
| Emergency roaming | Emergency call support in roaming | `Yes` | VoLTE R77 | 漫游支持紧急呼叫 |

## VoWiFi 表状态

VoWIFI sheet 中有 Antel 列，但可见范围内多数运营商取值为空。空白项不从 default value 推断为 Antel 要求，后续需要运营商确认或补充表格。

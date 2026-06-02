---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v1
operator: Ooredoo Qatar
mccmnc: "42701"
country: Qatar
source: F:\Codex\Knowledge\运营商参数\Ooredoo Qatar VoLTE Details--20241017.xlsx
status: requirements_backup
last_updated: 2026-06-02
---

# Ooredoo Qatar 42701

## 记录说明

- 只记录运营商需求和原表证据，作为后续配置参考。
- 不写平台配置项、补丁、默认值判断或落地结论。
- 空白、N/A、默认值和未确认项按原资料保留，不主动推断。


## 索引信息

| 字段           | 内容                                         |
| ------------ | -------------------------------------------- |
| Operator     | Ooredoo Qatar                                |
| Country      | Qatar                                        |
| MCCMNC       | 42701                                        |
| MCC / MNC 证据 | Sheet1 R13/R14 `MCC MNC = 427 01`            |
| 资料来源         | `Ooredoo Qatar VoLTE Details--20241017.xlsx` |

## 参数需求

| 业务域 | 需求项 | 要求/取值 | 来源位置 | 备注 |
|---|---|---|---|---|
| APN                   | Non-IMS APN                                 | Data APN                                                                              | R2      | 非 IMS 应用                   |
| APN                   | Non-IMS APN IP type                         | IPv4                                                                                  | R3      | 数据 APN IP 类型               |
| APN                   | IMS APN                                     | IMS                                                                                   | R4      | IMS services               |
| APN                   | IMS APN IP type                             | IPv6                                                                                  | R5      | IMS IP 类型                  |
| APN                   | Attach APN                                  | Data APN                                                                              | R6      | LTE attach APN             |
| APN / UT              | XCAP / UT APN                               | Data APN                                                                              | R7      | 第一阶段不要求 UT feature         |
| APN / UT              | XCAP / UT APN IP type                       | IPv4                                                                                  | R8      | 第一阶段不要求 UT feature         |
| Emergency             | Emergency Call Support & APN                | VoLTE emergency supported, but not initial state                                      | R9      | 紧急 VoLTE 支持但初期不启用          |
| IMS registration      | IMS registration RAT                        | LTE only                                                                              | R10     | 只在 LTE 注册                  |
| IMS transport         | IMS APN MTU                                 | 1500 bytes                                                                            | R11     | IMS MTU                    |
| VoLTE                 | VoLTE default setting                       | ON                                                                                    | R12     | VoLTE 默认开                  |
| MCCMNC                | LTE MCC/MNC                                 | 427 01                                                                                | R13     | LTE                        |
| MCCMNC                | 3G/2G MCC/MNC                               | 427 01                                                                                | R14     | 3G/2G                      |
| SIM                   | ISIM / USIM                                 | USIM & ISIM                                                                           | R15     | 支持 USIM 和 ISIM             |
| P-CSCF                | Discovery method                            | PCO                                                                                   | R16     | 使用 PCO                     |
| P-CSCF                | Preconfigured IP for lab bundle             | No                                                                                    | R17     | 不使用静态 P-CSCF               |
| IMS deregistration    | Deregistration support                      | Register timeout; UE may de-register when not attaching to VoLTE, such as low battery | R18     | 运营商给出触发场景                  |
| IMS retry             | IMS registration retries                    | Use Retry-After for 500/503 and called party availability responses                   | R19     | 保留原始语义                     |
| SRVCC                 | SRVCC target                                | 2G/3G supported                                                                       | R20     | 网络支持 2G/3G                 |
| SRVCC                 | mid-call SRVCC                              | eSRVCC support                                                                        | R21     | eSRVCC                     |
| Preconditions         | Is precondition supported                   | Supported                                                                             | R22     | SIP precondition           |
| SIP                   | 183 Session Progress                        | Yes                                                                                   | R23     | 要求 183                     |
| SIP                   | P-Early-Media                               | Yes                                                                                   | R24     | 要求 P-Early-Media           |
| CMAS                  | CMAS over LTE                               | No                                                                                    | R25     | 不支持                        |
| Security              | SIP IPSec                                   | Supported                                                                             | R26     | 支持 IPSec                   |
| IMS auth              | USIM / ISIM AKA auth                        | Supported                                                                             | R27     | AKA 鉴权                     |
| SMS                   | SMS over SGs / CS                           | IMS when VoLTE; CS when 3G/2G; SGs for LTE-only non-VoLTE phones                      | R28     | SMS 多域策略                   |
| SMS                   | SMS over IMS                                | SMS over IMS when LTE and VoLTE registered                                            | R29     | LTE + VoLTE registered     |
| SIP timer             | SIP T1-T4                                   | As per 3GPP TS 24.229                                                                 | R30     | 标准值                        |
| SIP timer             | Ringing Timer                               | 45 seconds for MO                                                                     | R31     | 原表写 MO                     |
| SIP timer             | Ringback Timer                              | 45 seconds in IMS & CS for MT                                                         | R32     | 原表写 MT                     |
| SIP timer             | SIP INVITE timeout                          | 24s in IMS, 36s in CS                                                                 | R33     | INVITE 超时                  |
| Identity              | IMPI                                        | `IMSI@ims.mnc001.mcc427.3gppnetwork.org`                                              | R34     | IMPI 格式                    |
| Identity              | IMPU                                        | `sip:+MSISDN@ims.mnc001.mcc427.3gppnetwork.org`                                       | R35     | IMPU 格式                    |
| Identity              | Domain                                      | `ims.mnc001.mcc427.3gppnetwork.org`                                                   | R36     | IMS domain                 |
| URI                   | TEL URI                                     | Yes                                                                                   | R37     | 支持 TEL URI                 |
| URI                   | SIP URI                                     | Yes                                                                                   | R38     | 支持 SIP URI                 |
| GBA                   | GBA_ME / GBA_UICC                           | GBA_UICC based authentication                                                         | R39     | UT 鉴权方式                    |
| UT                    | UT over XCAP                                | Yes on LTE only; UT only when IMS registered                                          | R40     | 第一阶段不要求 UT                 |
| XCAP / BSF            | XCAP Root URI                               | Standard FQDN; includes `bsf.mnc001.mcc427...` and `xcap.ims.mnc001.mcc427...`        | R41     | 标准 FQDN                    |
| NAF / BSF             | FQDN based NAF & BSF and standard ports     | Yes                                                                                   | R42     | 标准端口                       |
| UT                    | Reject causes for non-provisioned customers | 403                                                                                   | R43     | 期待 UE 走 CSFB / legacy SS   |
| Supplementary service | Call forwarding over XCAP                   | Yes                                                                                   | R44     | 支持 CF                      |
| Call waiting          | Call waiting type                           | Network based                                                                         | R45     | 网络侧 CW                     |
| Supplementary service | Call barring over XCAP                      | Yes                                                                                   | R46     | 支持 CB                      |
| Conference            | In-call / out-of-call SUBSCRIBE             | Start with a new call ID                                                              | R47     | Conference subscribe 行为    |
| CDIV                  | Serve multiple CDIV rules per request       | Yes                                                                                   | R48     | 一次请求带多个 rules              |
| Conference            | Conference Calling Server                   | Yes, part of supplementary services                                                   | R49     | 未给固定 URI                   |
| Conference            | Conference event package                    | Yes                                                                                   | R50     | 支持                         |
| Call transfer         | Explicit Call Transfer                      | Yes                                                                                   | R51     | 支持 ECT                     |
| VoWiFi HO             | VoLTE to VoWiFi HO                          | No                                                                                    | R52     | 不支持                        |
| Emergency HO          | Emergency VoLTE to VoWiFi HO                | No                                                                                    | R53     | 不支持                        |
| Network info          | eUTRAN vendor                               | Nokia                                                                                 | R54     | 网络信息                       |
| Network info          | LTE bands                                   | 800, 1800, 2600                                                                       | R55     | 网络频段                       |
| Network info          | LTE bandwidth                               | 10, 15/10, 20 MHz                                                                     | R56     | 表内原始值                      |
| VoLTE coverage        | VoLTE on listed bands                       | Supported                                                                             | R57     | 全部上述 LTE band 支持           |
| UTRAN                 | UTRAN bands                                 | 900, 2100                                                                             | R58     | 3G 频段                      |
| IRAT                  | LTE to 3G                                   | Handover                                                                              | R60     | 回落方式                       |
| IMS core              | IMS core vendor / version                   | Huawei / IMS V500R011                                                                 | R62-R63 | 网络信息                       |
| P-CSCF                | P-CSCF vendor / version                     | Huawei / V500R002C10                                                                  | R64-R65 | 网络信息                       |
| TAS                   | TAS vendor / version                        | Huawei / ATS9900 V500R008C20                                                          | R66-R67 | 网络信息                       |
| EPS                   | EPS vendor / versions                       | Nokia / FNS16.5, FNG15                                                                | R68-R69 | 网络信息                       |
| Application server    | Providers                                   | MMTEL/SRVCC/IP-SMS-GW Huawei; SMS/MCA/Voicemail Telenity; CRBT/OBD 6D                 | R70-R71 | 网络信息                       |
| Media gateway         | Vendor / count / version                    | Nokia / 8 / v5                                                                        | R72-R74 | 网络信息                       |
| SBC                   | Vendor / version                            | Huawei / V500R002C10                                                                  | R75-R76 | 网络信息                       |
| Provisioning          | VoLTE provisioning                          | Default for 4G data subscribers with VoLTE-capable device                             | R77     | 开通策略                       |
| IR.92                 | Supported version                           | 8                                                                                     | R78     | IR.92 v8                   |
| Codec                 | AMR-NB / AMR-WB                             | Yes / Yes                                                                             | R82-R83 | 语音 codec                   |
| Codec                 | Codec rate adaptation                       | Yes                                                                                   | R84     | 支持                         |
| TADS                  | TADS support                                | Supported; ATS queries HSS each time                                                  | R85     | 无保持时长                      |
| CS fallback           | Fall Back to CS timer                       | 10s                                                                                   | R86     | IMS configuration CS retry |
| Carrier aggregation   | CA supported                                | No                                                                                    | R87     | CA 不支持                     |
| Carrier aggregation   | CA + VoLTE                                  | Yes                                                                                   | R88     | CA 和 VoLTE 可同时 active      |
| Entitlement           | Entitlement support                         | VoLTE                                                                                 | R89     | 仅 VoLTE                    |

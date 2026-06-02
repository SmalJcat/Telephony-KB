---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v1
operator: Vodafone Oman
mccmnc: "42206"
country: Oman
source: F:\Codex\Knowledge\运营商参数\Network Configuration-VFOM2026.xlsx
related_source: F:\Codex\Knowledge\运营商参数\Handest Survey for Vodafone.xlsx
status: requirements_backup
last_updated: 2026-06-02
---

# Vodafone Oman 42206

## 记录说明

- 只记录运营商需求和原表证据，作为后续配置参考。
- 不写平台配置项、补丁、默认值判断或落地结论。
- 空白、N/A、默认值和未确认项按原资料保留，不主动推断。


## 索引信息

| 字段 | 内容 |
|---|---|
| Operator | Vodafone / Vodafone Oman |
| Country | Oman |
| Region | Middle East |
| MCC | 422 |
| MNC | 06 |
| MCCMNC | 42206 |
| 主资料 | `Network Configuration-VFOM2026.xlsx` |
| 补充资料 | `Handest Survey for Vodafone.xlsx`，同为 Vodafone Oman / 42206，可作为补充核对 |

## 参数需求

| 业务域 | 需求项 | 要求/取值 | 来源位置 | 备注 |
|---|---|---|---|---|
| APN                   | Internet APN                           | `internet.vodafone.om`                                     | `新增` sheet；Handest Common | 数据业务 APN                                              |
| APN                   | IMS APN                                | `ims.vodafone.om`                                          | Handest Common            | IMS services                                          |
| APN                   | Attach APN                             | `internet.vodafone.om`                                     | Handest Common            | LTE attach APN                                        |
| APN / UT              | XCAP / UT APN                          | `hos.vodafone.om`                                          | Handest Common            | UT interface uses dedicated HOS APN in Handest survey |
| IMS access            | IMS registration access                | 4G/5G / LTE IMS access                                     | Sheet1                    | 表内按 IMS over 3GPP 语义描述                                |
| VoLTE                 | Voice over LTE                         | Yes / enabled                                              | Sheet1 R23/R25            | 语音 IMS 能力开启                                           |
| ViLTE                 | Video over LTE                         | Yes                                                        | Sheet1 R26                | 视频通话能力开启                                              |
| IMS auth              | IMS registration algorithm             | `AKAv1-MD5`                                                | Sheet1 R37                | 注册鉴权算法                                                |
| IMS transport         | MTU size for IMS                       | `1500` bytes                                               | Sheet1 R41                | IMS APN MTU                                           |
| SIP timer             | Ringback Timer                         | `90` seconds                                               | Sheet1 R42                | 呼出回铃等待计时                                              |
| SIP timer             | Ringing Timer                          | `90` seconds                                               | Sheet1 R43                | 被叫振铃计时                                                |
| Preconditions         | SIP preconditions                      | Yes                                                        | Sheet1 R45                | 要求支持 precondition                                     |
| SIP session           | Session Expires                        | `1800` seconds                                             | Sheet1 R48                | SIP session timer                                     |
| CS fallback           | SIP INVITE error codes triggering CSFB | `403;500;503`                                              | Sheet1 R49                | 需求表用分号分隔                                              |
| Conference            | Conference Server URI                  | `sip:conference@factory.ims.mnc006.mcc422.3gppnetwork.org` | Sheet1 R52；Handest Common | Handest 也给出同类 conference URI                          |
| Conference            | Conference event package               | Yes                                                        | Sheet1 R53                | 支持 conference event                                   |
| Conference            | Conference call dialog type            | In-dialog                                                  | Sheet1 R54                | 会议订阅方式                                                |
| AMR                   | AMR / AMR-WB                           | 默认 / 标准能力                                                  | Sheet1 R55-R58            | 表内未体现需要特殊化的 codec 值                                   |
| VoLTE roaming         | Support VoLTE in roaming area          | No                                                         | Sheet1 R60                | 需求表有效语义为不支持 VoLTE roaming                             |
| UT / XCAP             | XCAP root path                         | `/`                                                        | Sheet1 R68                | `/` 表示根路径 / 空路径语义                                     |
| UT / XCAP             | XCAP address                           | standard FQDN by MCC/MNC                                   | Sheet1 R69                | 标准 `xcap.ims.mnc006.mcc422...` 形式                     |
| UT / XCAP             | XCAP port                              | `8080`                                                     | Sheet1 R70                | HTTP port                                             |
| UT / BSF              | BSF address                            | standard FQDN by MCC/MNC                                   | Sheet1 R71                | 标准 `bsf...mnc006.mcc422...` 形式                        |
| UT / BSF              | BSF port                               | `8088`                                                     | Sheet1 R72                | BSF port                                              |
| Supplementary service | SS domain preference                   | PS only if VoLTE registered                                | Sheet1 R73                | 补充业务域选择                                               |
| UT / XCAP             | XCAP `<media>` attribute               | No                                                         | Sheet1 R75                | XCAP document 不带 media 属性                             |
| UT roaming            | Support UT in roaming area             | No                                                         | Sheet1 R80                | 漫游不支持 UT                                              |
| SMS                   | SMS over IMS / SGs                     | 表中有 SMS over IMS / SGs 相关要求                                | Sheet1                    | 后续如做 SMS 配置再展开                                        |
| Emergency             | Emergency service                      | Handest 说明网络无直连 emergency response center，能力侧支持            | Handest Apple             | 需要 ECC/emergency 专项判断                                 |
| EVS                   | EVS enable                             | Yes / enabled                                              | Sheet1 R88                | 需求表要求 EVS                                             |
| EVS                   | EVS `ch-aw-recv`                       | `-1`                                                       | Sheet1 R96                | channel-aware mode receive value                      |

## 待确认项

| 项目                              | 说明                              |
| ------------------------------- | ------------------------------- |
| VoLTE / ViLTE upgrade-downgrade | 表内有相关描述，但需要结合平台能力理解，备份中不转换为配置动作 |
| SRVCC LTE to 3G                 | 表内值为 No，具体含义需要结合网络侧 SRVCC 策略确认  |
| GRUU                            | 表内写 Yes，作为需求保留                  |
| SS CS fallback for every error  | 表内写 No，作为需求保留                   |

## 维护备注

- 这份文件只记录 Vodafone Oman 的运营商参数要求，不表示平台文件已修改。
- `Network Configuration-VFOM2026.xlsx` 是主需求表；`Handest Survey for Vodafone.xlsx` 只作为同运营商补充资料。

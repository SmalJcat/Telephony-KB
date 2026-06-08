---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: MOD
mccmnc: "60210"
country: Egypt
source: F:\Codex\Knowledge\运营商参数归档\Hytera-VoLTEKeyConfiguration1.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Egypt MOD 60210

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Egypt |
| 运营商 | MOD |
| MCCMNC | `60210` |
| MCC/MNC 证据 | 原表 `Questionnaire` R2/R3/R4 写 Carrier Name `mod`、MCC `602`、MNC `10`。 |
| 公网查证 | 本轮未在公开 MCC/MNC 列表中确认 `60210` 对应 `MOD`；本文仅按原表暂存，配置前必须人工复核运营商身份。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Hytera-VoLTEKeyConfiguration1.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | IMS/VoLTE、ViLTE、UT/XCAP、Emergency、APN、Qualcomm NV 参考列 |
| 配置前重点 | Carrier Name 只有 `mod`，国家由 MCC `602` 推定为 Egypt；不要把本文直接当成公开运营商配置结论。 |

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
| Carrier MCC? |   | 602 | Carrier Identifier | Questionnaire R3 |
| Carrier MNC(s)? |   | 10 | Carrier Identifier | Questionnaire R4 |
| What is the Conference Server URI if not per standard (3GPP 23.003)? |   | mmtel@conf-factory.ims.mnc010.mcc602.3gppnetwork.org | Voice over LTE | Questionnaire R39 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| What is your Internet APN name? |   | intra network (no internet)/ | General IMS | Questionnaire R24 |
| What is your IMS APN name? |   | ims | General IMS | Questionnaire R25 |
| What is yout Ut/XCAP APN name? |   | mod | Supplementary / Services | Questionnaire R46 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Do you suppot IMS registration over LTE - EUTRAN? |   | yes | IMS Services | Questionnaire R7 |
| Do you suppot IMS registration over 3G - UTRAN? |   | no | IMS Services | Questionnaire R8 |
| Do you suppot IMS registration over 2G - GERAN? |   | no | IMS Services | Questionnaire R9 |
| IMS Context maintained after reselection to 2G/3G |   | no | IMS Services | Questionnaire R11 |
| Do you support IMS SMS over LTE - EUTRAN? |   | yes | IMS Services | Questionnaire R12 |
| Do you support IMS SMS over 3G - UTRAN? |   | no | IMS Services | Questionnaire R13 |
| Do you support IMS SMS over 2G - GERAN? |   | no | IMS Services | Questionnaire R14 |
| Do you support VoLTE (IMS voice over LTE - EUTRAN)? |   | yes | IMS Services | Questionnaire R16 |
| Do you support Ut - XCAP based Supplimentary services over LTE - EUTRAN? |   | yes | IMS Services | Questionnaire R20 |
| Do you support Ut - XCAP based Supplimentary services over 3G - UTRAN? |   | no | IMS Services | Questionnaire R21 |
| Do you support Ut - XCAP based Supplimentary services over 2G - GERAN? |   | no | IMS Services | Questionnaire R22 |
| What is you preferred value for Timer T1? / [T1 is RTT estimate between SIP client and SIP server.] |   | set as standard | General IMS | Questionnaire R26 |
| What is you preferred value for Timer T2? / [T2= Maximum retransmit interval for non-invite requests and INVITE responses.] |   | set as standard | General IMS | Questionnaire R27 |
| What is you preferred value for Timer T4? / [T4= Maximum duration SIP message would remain in network.] |   | set as standard | General IMS | Questionnaire R28 |
| What is you preferred value for RegRetryBaseTime Timer? |   | set as standard | General IMS | Questionnaire R29 |
| What is you preferred value for RegRetryMaxTime Timer? |   | set as standard | General IMS | Questionnaire R30 |
| What is you preferred value for SIP Ringing Timer? |   | 90 | General IMS | Questionnaire R31 |
| What is you preferred value for SIP Ringback Timer? |   | 90 | General IMS | Questionnaire R32 |
| What is your preferred value for Timer B? |   | set as standard | General IMS | Questionnaire R33 |
| What is your preferred value for Timer F? |   | set as standard | General IMS | Questionnaire R34 |
| What is the phone-context URI if not per standard (3GPP 23.003)? |   | Support of TEL URI and SIP URI | General IMS | Questionnaire R35 |
| TCP Threshold for IMS |   | 1500 | General IMS | Questionnaire R36 |
| What domain preference for SMS? (SMSoIP Not Used / SMSoIP Preferrred) |   | SMSoIP Preferrred | SMS over IMS | Questionnaire R37 |
| Is Conference Event Package supported for Conference Call originator only or for all the participants |   | all participants | Voice over LTE | Questionnaire R40 |
| SUBSCRIBE for the Conference Event package sent in-dialog or out-of-dialog |   | Out of-dialog | Voice over LTE | Questionnaire R41 |
| Do you support voice over LTE when the user is roaming? |   | no roaming | Voice over LTE | Questionnaire R42 |
| What is your domain preference for Supplementary Services configuration? (Ut-XCAP / Circuit Switched) |   | Ut-XCAP | Supplementary / Services | Questionnaire R45 |
| What IP address type is used for Ut/XCap in home and roaming |   | IPv4 | Supplementary / Services | Questionnaire R47 |
| What is the BSF address? |   | bsf.ims.mnc010.mcc602.pub.3gppnetwork.org | Supplementary / Services | Questionnaire R48 |
| What is the BSF port if not standard? |   | 80 | Supplementary / Services | Questionnaire R49 |
| What is your XCAP Root URI if not per standard (3GPP 23.003)? |   | xcap.ims.mnc010.mcc602.pub.3gppnetwork.org | Supplementary / Services | Questionnaire R50 |
| What is the XCAP server port if not standard? |   | 80 | Supplementary / Services | Questionnaire R51 |
| What authentication method is used for Ub and Ua interface? |   | Auth type default value: AKA-MD5 | Supplementary / Services | Questionnaire R52 |
| What is your domain preference for USSD? (USSI / Circuit Switched) |   | PS | Supplementary / Services | Questionnaire R53 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Do you support ViLTE (IMS video over LTE - EUTRAN)? |   | yes | IMS Services | Questionnaire R18 |
| Audio codecs (e.g. AMR-WB; AMR-NB; EVS; G.711) and mode sets used |   | - AMR-WB mode-set 0,1,2,3,4,5,6,7,8& AMR-NB mode-set 0,1,2,3,4,5,6,7 | Voice over LTE | Questionnaire R38 |
| What is your preferred value of RTP inactivity timer? / If the UE detects non receipt of RTP packets for this duration, the call will be ended. |   | 60s | Voice over LTE | Questionnaire R43 |
| What is your preferred value of RTCP inactivity timer? / If the UE detects non receipt of RTCP packets for this duration, the call will be ended. |   | 60s | Voice over LTE | Questionnaire R44 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Do you suppot IMS registration over WiFi using ePDG-S2b? |   | no | IMS Services | Questionnaire R10 |
| Do you support IMS SMS over WiFi using ePDG-S2b? |   | no | IMS Services | Questionnaire R15 |
| Do you support VoWiFi (IMS voice over WiFi using ePDG-S2b)? |   | no | IMS Services | Questionnaire R17 |
| Do you support ViWiFi (IMS video over WiFi using ePDG-S2b)? |   | no | IMS Services | Questionnaire R19 |
| Do you support Ut - XCAP based Supplimentary services over WiFi using ePDG-S2b? |   | no | IMS Services | Questionnaire R23 |
| What is your ePDG FQDN if not per standard (3GPP 23.003)? |   | no voice over wifi | Voice over WiFi | Questionnaire R55 |
| In IKE signaling, what ID Type field do you use for IDr payload carrying APN name / (ID_FQDN / ID_KEY_ID) |   | no voice over wifi | Voice over WiFi | Questionnaire R56 |
| P-CSCF Ipv4 and P-CSCF IPv6 attribute if not standard |   | no voice over wifi | Voice over WiFi | Questionnaire R57 |
| What is your VoWiFi IKEv2 Re-Keying timer? |   | no voice over wifi | Voice over WiFi | Questionnaire R58 |
| What is your VoWiFi Ipsec ESP Re-Keying timer? |   | no voice over wifi | Voice over WiFi | Questionnaire R59 |
| What is your NAT keep alive timer? |   | no voice over wifi | Voice over WiFi | Questionnaire R60 |
| What is your voice domain preference on VoWiFi capable devices in Home network? / (Cellular Preferred / WiFi Preferred) |   | no voice over wifi | Voice over WiFi | Questionnaire R61 |
| Do you support voice over WiFi when the user is roaming? |   | no voice over wifi | Voice over WiFi | Questionnaire R62 |
| What is your voice domain preference on VoWiFi capable devices while roaming? / (Cellular Preferred / WiFi Preferred) |   | no voice over wifi | Voice over WiFi | Questionnaire R63 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Do you support emergency voice calls over WiFi? |   | no voice over wifi | Voice over WiFi | Questionnaire R64 |
| What APN do you use for emergency voice calls over WiFi? |   | no voice over wifi | Voice over WiFi | Questionnaire R65 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Hytera-VoLTEKeyConfiguration1.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 运营商身份 | 原表运营商名仅为 `mod`，公网未确认 `60210` 映射；配置前必须确认真实运营商/专网身份。 |

## 维护备注

- 这份资料是 MOD 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

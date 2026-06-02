---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v1
operator: Movistar Uruguay
mccmnc: "74807"
country: Uruguay
source: F:\Codex\Knowledge\运营商参数\ODM-Customization_Request_Template_5102M_TLUY_Cumbry_v2.0.xlsx
status: requirements_backup
last_updated: 2026-06-02
---

# Movistar Uruguay 74807

## 记录说明

- 只记录运营商需求和原表证据，作为后续配置参考。
- 不写平台配置项、补丁、默认值判断或落地结论。
- 空白、N/A、默认值和未确认项按原资料保留，不主动推断。


## 索引信息

| 字段 | 内容 |
|---|---|
| Operator | Movistar / Telefonica Uruguay |
| Country | Uruguay |
| MCCMNC | 74807 |
| MCC / MNC 证据 | APN sheet 写明 `Simcard inserted TELEFONICA 748 07` |
| 资料来源 | `ODM-Customization_Request_Template_5102M_TLUY_Cumbry_v2.0.xlsx` |

## 参数需求

| 业务域 | 需求项 | 要求/取值 | 来源位置 | 备注 |
|---|---|---|---|---|
| Service | Service name | Movistar | MNO Supplementary R5 | 运营商名称 |
| Service | Operating country | UY | MNO Supplementary R4 | Uruguay |
| Service | Operator type | Operator | MNO Supplementary R7 | 非 MVNO |
| APN | PC Data APN | `webapn.movistar.com.uy` | APN sheet; MNO Supplementary R8 | 数据 APN |
| APN | PC Data username / password | `movistar` / `movistar` | APN sheet; MNO Supplementary R12-R13 | 数据 APN 认证 |
| APN | PC Data connection name | `Movistar MODEM` | MNO Supplementary R10 | PC Data |
| APN | MMS APN | `apnmms.movistar.com.uy` | APN sheet | MMS APN |
| MMS | MMSC URL | `http://mmsc.movistar.com.uy` | APN sheet | MMS URL |
| MMS | MMS proxy / port | `10.0.2.29` / `8080` | APN sheet | MMS proxy |
| MMS | MMS username / password | `mmsuy` / `mmsuy` | APN sheet | MMS 认证 |
| APN | WAP APN | `apnwap.movistar.com.uy` | APN sheet | WAP / supplementary APN |
| APN | WAP proxy / port | `200.5.68.10` / `8080` | APN sheet | WAP proxy |
| APN | WAP username / password | `wapuy` / `wapuy` | APN sheet | WAP 认证 |
| IMS / UT | UT APN Name | Internet APN | Others-IMS R6 | Telefonica case 原则上与 Internet APN 相同 |
| Conference | SIP conference factory URI | `SIP:mmtel@conf-factory.ims.mnc007.mcc748.3gppnetwork.org` | Others-IMS R7 | 会议 URI |
| SMS | SMS Over IP Networks Indication | `SMSoIP Not Used` | Others-IMS R8 | SMS over IP 不使用 |
| SIP timer | Timer T1 | `2 secs` | Others-IMS R9 | SIP T1 |
| SIP timer | Timer T2 | `16 secs` | Others-IMS R10 | SIP T2 |
| SIP timer | Timer T4 | `17 secs` | Others-IMS R11 | SIP T4 |
| IMS registration | RegRetryBaseTime / RegRetryMaxTime | 空白 | Others-IMS R12-R13 | 原表未填 |
| Preconditions | Preconditions | Activate | Others-IMS R14 | SIP precondition |
| UT auth | UT Authentication | MD5 | Others-IMS R15 | GAA/GBA/Digest 字段，运营商填 MD5 |
| Supplementary service | SS Domain Setting | CS, XCAP/Ut will be available in future | Others-IMS R16 | 当前 SS 走 CS |
| USSD | USSD method | CSFB | Others-IMS R17 | 表格值写 Yes，说明为 CSFB |
| Caller ID | Calling number presentation | P-asserted-Id header | Others-IMS R18 | CLI 来源 |
| Media | Voice media on QCI=5 bearer | 空白 | Others-IMS R19 | 原表未填 |
| Media | Video media on QCI=5 bearer | Allow | Others-IMS R20 | 视频媒体允许 |
| XCAP | XCAP Root URI | Refer to IR.92 | Others-IMS R21 | 未给固定 FQDN |
| IMS | IMS Enabled | 空白 | Others-IMS R22 | 原表未填 |
| Roaming numbering | Local numbering when roaming | Geo-Local | Others-IMS R23 | 漫游本地号码策略 |
| SMS | SMSoIP only if IMS voice supported | 空白 | Others-IMS R24 | 原表未填 |
| VoWiFi | Re-keying timer | 8hrs | Others-IMS R25 | VoWiFi 安全重协商 |
| VoWiFi | NAT Keep-Alive Timer | 20 seconds | Others-IMS R26 | NAT keep alive |
| Roaming media | Voice / Video over LTE allowed when roaming | Neither | Others-IMS R28 | 漫游禁止 voice/video over LTE |
| Home media | Voice / Video over LTE allowed | Voice & Video | Others-IMS R29 | 本网允许语音和视频 |
| Access preference | PS Voice Preference Indicator | Wi-Fi preferred | Others-IMS R30 | 本网语音接入优先级 |
| Access preference | PS Voice Preference Indicator when roaming | 空白 | Others-IMS R31 | 原表未填 |
| SIP | Sending SIP 18x reliably | Send 18x reliably | Others-IMS R32 | 可靠 18x |
| XCAP access | Access for XCAP | Any access | Others-IMS R33 | XCAP 任意接入 |
| Codec | Rate Set for AMR | mode-set `0,2,4,7` | Others-IMS R34 | AMR mode-set |
| Codec | Rate Set for AMR-WB | FULL, 23.85K | Others-IMS R35 | AMR-WB |
| EVS | EVS Bit Rate | 5.9 - 24.4 supported, recommended 16.4K | Others-IMS R36 | EVS br |
| EVS | EVS Bandwidth | nb-fb | Others-IMS R37 | EVS bw |
| EVS | EVS initial partial redundancy offset receive | 空白 | Others-IMS R38 | 原表未填 |
| Data off | XCAP PS Data Off Exempt | CS, XCAP/Ut future | Others-IMS R39 | 数据关闭时 SS 当前走 CS |
| Data off | MMTEL Voice PS Data Off Exempt | Not Exempt | Others-IMS R40 | 不豁免 |
| Data off | Device Management PS Data Off Exempt | Not Exempt | Others-IMS R41 | 不豁免 |
| VoWiFi | Voice/video over Wi-Fi | Voice Only | Others-IMS R47 | Wi-Fi 只支持语音 |
| VoWiFi / XCAP | XCAP APN on WLAN | Same APN as LTE | Others-IMS R48 | 与 LTE 相同 APN |
| VoWiFi | ePDG | `epdg.epc.mnc007.mcc748.pub.3gppnetwork.org` | Others-IMS R50 | ePDG FQDN |
| Roaming icon | National roaming icon | OFF / no roaming icon when SIM MCC equals registered network MCC | PARAMETERS R61; MNO Supplementary R70 | 本地 MVO 不显示漫游图标 |
| UI | RAT indicators | GPRS / EDGE / UMTS / HSPA / HSPA+ / LTE / LTE+ / L+ | MNO Supplementary R74 | 网络制式显示 |
| Browser | Homepage | `wap.movistar.com.uy` | PARAMETERS R71; MNO Supplementary R63-R64 | Chrome / browser homepage |
| Emergency | Emergency number list | `112.911` | PARAMETERS R41 | 原表以点分隔 |
| Voicemail | Voice mail number | `6684` | PARAMETERS R37 | 语音信箱 |

## 待确认项

| 项目 | 说明 |
|---|---|
| RegRetryBaseTime / RegRetryMaxTime | 表格保留字段但运营商未填 |
| Roaming PS voice preference | 表格保留字段但运营商未填 |
| EVS initial partial redundancy offset | 表格保留字段但运营商未填 |
| Voice media on QCI=5 bearer | 表格保留字段但运营商未填 |

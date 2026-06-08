---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: STC
mccmnc: "42001"
country: Saudi Arabia
source: F:\Codex\Knowledge\运营商参数归档\STC IMS VoLTE ViLTE VoWifi RCS Config Commercial Project v2.0.xlsx
status: requirements_backup
last_updated: 2026-06-08
---

# Saudi Arabia STC 42001

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Saudi Arabia |
| 运营商 | STC |
| MCCMNC | `42001` |
| MCC/MNC 证据 | 原表 `Network Config` R87 写 `MCC:420, MNC:01`；Domain/URI 使用 `mnc001.mcc420`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Saudi Arabia STC 使用 `420 01`。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\STC IMS VoLTE ViLTE VoWifi RCS Config Commercial Project v2.0.xlsx` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、IMS/VoLTE、ViLTE、VoWiFi/ePDG、UT/XCAP、Emergency、RCS、SRVCC |
| 配置前重点 | Emergency Call over IMS 在 Feature 表写 `NO/CSFB`，不要直接配置 ECC over IMS。RCS 多处写 Not Commercial launch。 |

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
| 3.2 PublicURI |   | sip:IMSI@ims.mnc001. / mcc420.3gppnetwork.org | 业务域：VoLTE | Network Config R31 |
| 3.3 PrivateURI |   | sip:IMSI@ims.mnc001. / mcc420.3gppnetwork.org | 业务域：VoLTE | Network Config R32 |
| 3.4 Domain Name |   | ims.mnc001. / mcc420.3gppnetwork.org | 业务域：VoLTE | Network Config R33 |
| 8.1 MCC/MNC for VoLTE test environment / live network |   | MCC:420, MNC:01 | 业务域：Network | Network Config R87 |
| 10.6.9 Own URI(Idi) |   | IMSI@nai.epc.mnc001.mcc420.3gppnetwork.org | 业务域：VoWifi | Network Config R127 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| 1.3 UT interface over LTE or 2G/3G/4G | Not Commercial launch | INTERNET APN | 业务域：UT | Network Config R5 |
| APN |   | ims | 业务域：VoLTE | Network Config R9 |
| APN |   | jawalnet.com.sa | 业务域：Network | Network Config R14 |
| APN | Not Commercial launch | jawalnet.com.sa | 业务域：UT | Network Config R19 |
| 2.6 Default APN for attach (web or ims)? | Not Commercial launch |   | 业务域：RCS | Network Config R28 |
| 3.12 Disable IMS APN when Mobile data off |   | No | 业务域：VoLTE | Network Config R43 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Voice over LTE | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R2 |
| SMS over IMS | VoLTE | CSFB, SMS over SGs | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R7 |
| SRVCC(basesd on 3gpp REL8) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R8 |
| SRVCC(LTE->2G) | VoLTE | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R9 |
| SRVCC(LTE->3G) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R10 |
| aSRVCC(basesd on 3gpp REL10) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R11 |
| eSRVCC(basesd on 3gpp REL10) | VoLTE | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R12 |
| Suplemetary Service over IMS | UT | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R13 |
| USSD over IMS | N/A | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R15 |
| 1.1 Authetication by ISIM or USIM support |   | USIM | 业务域：VoLTE | Network Config R3 |
| 1.2 IMS re-registration when RAT changed |   | Yes | 业务域：VoLTE | Network Config R4 |
| Connection name |   | IMS | 业务域：VoLTE | Network Config R8 |
| Password |   | No | 业务域：VoLTE | Network Config R10 |
| IP Type |   | IPv4 | 业务域：VoLTE | Network Config R11 |
| Edit of settings enabled? |   | No | 业务域：VoLTE | Network Config R12 |
| 2.3 Ut interface Profile | Not Commercial launch |   | 业务域：UT | Network Config R18 |
| Username | Not Commercial launch | no | 业务域：UT | Network Config R20 |
| IP Type | Not Commercial launch | IPv4 | 业务域：UT | Network Config R21 |
| 3.1 PCO Enable |   | Enable | 业务域：VoLTE | Network Config R30 |
| 3.5 P-CSCF address / port number |   | Need support P-CSCF discovery | 业务域：VoLTE | Network Config R34 |
| 3.6 FQDN support |   | Yes | 业务域：VoLTE | Network Config R35 |
| 3.7 P-CSCF FQDN address |   | Yes | 业务域：VoLTE | Network Config R36 |
| 3.8 Voice domain preference |   | VoLTE prefered | 业务域：VoLTE | Network Config R37 |
| 3.9 SMS domain preference |   | SMS over SGS | 业务域：VoLTE | Network Config R38 |
| 3.10 Conference Server URI |   | sip:confuri@fmc.stc.com.sa | 业务域：VoLTE | Network Config R39 |
| 3.10.1 Conference Call set up (send REFER to users, send REFER to conference focus) |   | send REFER to conference focus | 业务域：VoLTE | Network Config R40 |
| 3.10.2 Support subscribing to the conference event? |   | Yes | 业务域：VoLTE | Network Config R41 |
| 3.11 Support of TEL URI or SIP URI |   | Both | 业务域：VoLTE | Network Config R42 |
| 3.13.0 Call waiting is Terminal based or Network based |   | Terminal Based | 业务域：VoLTE | Network Config R44 |
| 3.13.1 UT XCAP Root URI | Not Commercial launch | xcap.ims.mnc001.mcc420.pub.3gppnetwork.org | 业务域：UT | Network Config R45 |
| 3.13.2 UT agg_proxy_ip | Not Commercial launch | xcap.ims.mnc001.mcc420.pub.3gppnetwork.org | 业务域：UT | Network Config R46 |
| 3.13.3 UT proxy_port | Not Commercial launch | 80 | 业务域：UT | Network Config R47 |
| 3.13.4 UT BSF IP (IF UT support GBA) | Not Commercial launch | bsf.mnc001.mcc420.pub.3gppnetwork.org | 业务域：UT | Network Config R48 |
| 3.13.5 UT BSF port (IF UT support GBA) | Not Commercial launch | 80 | 业务域：UT | Network Config R49 |
| 3.13.6 SS domain preference | Not Commercial launch | PS, only if VoLTE Registered | 业务域：UT | Network Config R50 |
| 4.0 IMS Registraion Agorithm |   | AKAv1-MD5 | 业务域：VoLTE | Network Config R52 |
| 4.1 IMS Authentication Agorithm |   | hmac-sha-1-96 | 业务域：VoLTE | Network Config R53 |
| 4.4 Ut Authentication Agorithm | Not Commercial launch | AKAv1-MD5 | 业务域：UT | Network Config R56 |
| 4.4.1 UT GBA Support ? Or not ? | Not Commercial launch | Yes | 业务域：UT | Network Config R57 |
| 4.4.1.1 If UE support GBA, GBA-U or GBA-ME ?? | Not Commercial launch | GBA-ME | 业务域：UT | Network Config R58 |
| 5.2 aSRVCC, eSRVCC |   | Yes | 业务域：Network | Network Config R61 |
| 5.3 Mid-Call features SRVCC |   | Yes | 业务域：Network | Network Config R62 |
| 7.1 SIP Method |   | UDP/TCP(either Only UDP / or Only TCP) | 业务域：VoLTE | Network Config R76 |
| 7.2 MTU size for IMS |   | 1300bytes | 业务域：VoLTE | Network Config R77 |
| 7.3 Values for SIP timers T1-T4 |   | T1:2s / T2:16s / T4:17s | 业务域：VoLTE | Network Config R78 |
| 7.4 Ringback Timer |   | 90 | 业务域：VoLTE | Network Config R79 |
| 7.4.1 Ringing Timer |   | 90 | 业务域：VoLTE | Network Config R80 |
| 7.5 Session Expires - Refresher Method |   | Update | 业务域：VoLTE | Network Config R81 |
| 7.6 Seesion Expires(UAC / UAS) |   | 900s | 业务域：VoLTE | Network Config R82 |
| 7.7 Early Media support? |   | Yes | 业务域：VoLTE | Network Config R83 |
| 7.7.1 Early Media - Offer & Answer model ?? Or Gateway model ? |   | Offer & Answer | 业务域：VoLTE | Network Config R84 |
| 7.8 GRUU |   | No | 业务域：VoLTE | Network Config R85 |
| 8.3 Which LTE/2G IRAT capabilities are supported in the network? |   | No | 业务域：Network | Network Config R89 |
| Cell reselection idle LTE -> 2G? |   | No | 业务域：Network | Network Config R90 |
| Cell reselection idle 2G-> LTE? |   | No | 业务域：Network | Network Config R91 |
| Cell reselection connected LTE->2G? |   | No | 业务域：Network | Network Config R92 |
| Cell reselection connected 2G-> LTE? |   | No | 业务域：Network | Network Config R93 |
| Packet HO connected LTE->2G? |   | No | 业务域：Network | Network Config R94 |
| Packet HO connected 2G->LTE? |   | No | 业务域：Network | Network Config R95 |
| 8.4 Which LTE/3G IRAT capabilities are supported in the network? |   | Yes | 业务域：Network | Network Config R96 |
| Cell reselection idle LTE->3G? |   | Yes | 业务域：Network | Network Config R97 |
| Cell reselection idle 3G-> LTE? |   | Yes | 业务域：Network | Network Config R98 |
| Cell reselection connected LTE->3G? |   | Yes | 业务域：Network | Network Config R99 |
| Cell reselection connected 3G-> LTE? |   | Yes | 业务域：Network | Network Config R100 |
| Packet HO connected LTE->3G? |   | Yes | 业务域：Network | Network Config R101 |
| Packet HO connected 3G->LTE? |   | Yes | 业务域：Network | Network Config R102 |
| 8.5. IMS Network Equipment Vendor Name |   | Huawei | 业务域：Network | Network Config R103 |
| 11.1 Registration icon |   | Enable | 业务域：VoLTE | Network Config R141 |
| 12.1 Support VoLTE(IMS Regi) in Roaming |   | No | 业务域：VoLTE | Network Config R143 |
| 12.2 UT interface in Roaming |   | No | 业务域：VoLTE | Network Config R144 |

### SIP、媒体与补充业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Video over LTE | VoLTE | YES | Pending Regulatory Approval | IMS Feature R5 |
| Upgrade from VoLTE to ViLTE / Downgrade from ViLTE to VoLTE | VoLTE | Supported | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R6 |
| RCS | RCS | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R16 |
| 2.4 RCS Profile | Not Commercial launch |   | 业务域：RCS | Network Config R22 |
| Connection name | Not Commercial launch |   | 业务域：RCS | Network Config R23 |
| Proxy | Not Commercial launch |   | 业务域：RCS | Network Config R25 |
| Port | Not Commercial launch |   | 业务域：RCS | Network Config R26 |
| Edit of settings enabled? | Not Commercial launch |   | 业务域：RCS | Network Config R27 |
| 5.1 Dedicated bearers (QoS) for VoLTE |   | QCI=1(Voice),2(Video) | 业务域：Network | Network Config R60 |
| 6.1 VoLTE Codec(AMR type) |   | AMR WB | 业务域：VoLTE | Network Config R67 |
| 6.1.1 AMR mode |   | AMR WB mode(8) | 业务域：VoLTE | Network Config R68 |
| 6.2 ViLTE Codec(format, Level) | Not Commercial launch | H.264 CBP level 1.2 | 业务域：VoLTE | Network Config R69 |
| 6.3 AMR-WB 2G |   | No | 业务域：VoLTE | Network Config R70 |
| 6.4 Audio Codec Mode |   | band efficent | 业务域：VoLTE | Network Config R71 |
| 6.5 DTMF Codec |   | Support | 业务域：VoLTE | Network Config R72 |
| 6.6 Video Capabilities / - Resolution, Frame Rate | Not Commercial launch | Resolution: VGA, 720p, 1080p | 业务域：VoLTE | Network Config R73 |
| 6.7 AS-BW (Audio, Video) |   | 512kbps | 业务域：VoLTE | Network Config R74 |
| 9.1 Auto Configuration | Not Commercial launch |   | 业务域：RCS | Network Config R105 |
| Auto Configuration Support ? | Not Commercial launch |   | 业务域：RCS | Network Config R106 |
| if No , Please provide AutoConfiguration xml file | Not Commercial launch |   | 业务域：RCS | Network Config R107 |
| 9.2 Registration | Not Commercial launch |   | 业务域：RCS | Network Config R108 |
| Single registration or Dual registration | Not Commercial launch |   | 业务域：RCS | Network Config R109 |
| 9.3 RCS Product Version | Not Commercial launch |   | 业务域：RCS | Network Config R110 |
| 9.4 joyn Brand Policy | Not Commercial launch |   | 业务域：RCS | Network Config R111 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Wifi calling - without via ePDG | VoWifi | NO | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R3 |
| Voice over WiFi via ePDG | VoWIFI | YES | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R4 |
| stc VoWifi Requirement | Device Configuration |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R17 |
| Airplane Mode | VoWifi should be locked when handset turn on Airplane mode |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R18 |
| Roaming | VoWifi Roaming should be locked from the terminal device side |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R19 |
| Call Preference | VoWifi -> VoLTE -> CS (2G/3G) |   | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | IMS Feature R20 |
| 4.2 Support IPSec or not |   | Yes | 业务域：VoLTE | Network Config R54 |
| 4.2.1 Encryption Algorithm for IPSec |   | none | 业务域：VoLTE | Network Config R55 |
| 10.1 ePDG address (IP or FQDN) |   | epdg.epc.mnc001.mcc420.pub.3gppnetwork.org | 业务域：VoWifi | Network Config R113 |
| 10.2 ePDG APN |   | IMS | 业务域：VoWifi | Network Config R114 |
| 10.3 Preferred mode |   | VoWifi preffered | 业务域：VoWifi | Network Config R115 |
| 10.4 VoWiFi(ePDG) with H/O |   | Yes | 业务域：VoWifi | Network Config R116 |
| 10.5 VoWiFi(Wifi calling) with H/O |   | Yes | 业务域：VoWifi | Network Config R117 |
| 10.6.1 IKE version |   | v2 | 业务域：VoWifi | Network Config R119 |
| 10.6.2 IKE Encryption |   | AES-CBC-128 | 业务域：VoWifi | Network Config R120 |
| 10.6.3 IKEv2 Pseudo Random Function |   | PRF-HMAC-SHA1 | 业务域：VoWifi | Network Config R121 |
| 10.6.4 IKEv2 Integrity |   | HMAC-SHA1-96 | 业务域：VoWifi | Network Config R122 |
| 10.6.5 IKEv2 Diffie-Hellman Group |   | Group 2 (1024-bit) | 业务域：VoWifi | Network Config R123 |
| 10.6.6 IPSec encryption |   | AES-CBC-128 | 业务域：VoWifi | Network Config R124 |
| 10.6.7 IPSec integrity |   | HMAC-SHA1-96 | 业务域：VoWifi | Network Config R125 |
| 10.6.8 IPSec Group |   | Group 2 (1024-bit) | 业务域：VoWifi | Network Config R126 |
| 10.6.10 Remote URI(Idr) |   | KEY_ID / IMS(APN) | 业务域：VoWifi | Network Config R128 |
| 10.6.11 Subnet Type |   | IPv4 | 业务域：VoWifi | Network Config R129 |
| 10.6.12 IPSec extended sequence number(Off or 0) |   | 0 | 业务域：VoWifi | Network Config R130 |
| 10.6.13 IPSec / IKE Life Time |   | 900s | 业务域：VoWifi | Network Config R131 |
| 10.6.14 P-CSCF discovery |   | Yes | 业务域：VoWifi | Network Config R132 |
| 10.7 Enable |   | NA | 业务域：VoWifi | Network Config R133 |
| 10.7.1 VoWiFi call enable on Airplane mode | Device Manufacturer need to block these from device side | No | 业务域：VoWifi | Network Config R134 |
| 10.7.2 VoWiFi call enable on Roaming | Device Manufacturer need to block these from device side | No | 业务域：VoWifi | Network Config R135 |
| 10.8 Connection Information |   | NA | 业务域：VoWifi | Network Config R136 |
| 10.8.1 Connection Retry policy |   | ue's ability | 业务域：VoWifi | Network Config R137 |
| 10.8.2 WiFi Weak Signal reference value |   | -85dBm | 业务域：VoWifi | Network Config R138 |
| 10.9 WIFI call ON/OFF Menu |   | ue's ability | 业务域：VoWifi | Network Config R139 |

### Emergency

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| Emergency Call over IMS | Emergency Call | NO | Trial in Lab | IMS Feature R14 |
| 12.3 Emergency Call support in Roaming |   | No | 业务域：Emergeny Call | Network Config R145 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\STC IMS VoLTE ViLTE VoWifi RCS Config Commercial Project v2.0.xlsx` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| 平台默认值比对 | 本文是需求备份，未判断目标平台默认值；配置前需回到 CarrierConfig/APN/NV/ECC 方法文档和目标代码确认。 |

## 维护备注

- 这份资料是 STC 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

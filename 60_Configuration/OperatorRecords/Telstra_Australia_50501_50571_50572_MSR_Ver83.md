---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v1
operator: Telstra Australia
mccmnc: "50501;50571;50572"
country: Australia
source: F:\Codex\Knowledge\运营商参数
source_files:
  - MSR0241_Device General_Ver83 - External Version (Final).xlsx
  - MSR0585_SIM_Ver83 - External Version (Final).xlsx
  - MSR0726_Device Management_Ver83 - External Version (Final).xlsx
  - MSR0757_Submission_Ver83 - External Version (Final).xlsx
  - MSR0823_LTE_Ver83 - External Version (Final).xlsx
  - MSR0853_IPv6_Ver83 - External Version (Final).xlsx
  - MSR0868_WiFi_Ver83 - External Version (Final).xlsx
  - MSR0920_VoLTE_Ver83 - External Version (Final).xlsx
  - MSR0942_VoWiFi_Ver83 - External Version (Final).xlsx
  - MSR0983_Band Combination_Ver83 - External Version (Final).xlsx
status: requirements_backup; consolidated_msr
last_updated: 2026-06-02
---

# Telstra Australia 50501 / 50571 / 50572 MSR Ver83

## 记录说明

- 只记录运营商需求和原表证据，作为后续配置参考。
- 不写平台配置项、补丁、默认值判断或落地结论。
- Telstra MSR 文件量大，本文保留网络/IMS/SIM/IPv6/Wi-Fi/FOTA 等关键需求摘要；完整认证问卷仍回查原 xlsx。

## 索引信息

| 字段 | 内容 |
|---|---|
| 运营商 | Telstra Australia |
| 国家 | Australia |
| MCCMNC | 50501 / 50571 / 50572 |
| MCCMNC 证据 | MSR0920 R1.21 记录 `MNC=01, 71 and 72`; R1.22 记录 Telstra Wholesale IMSI `505 01 56...` / `505 01 55...` |
| Product response | TCL / Dahlia_T450H |
| 来源资料 | Telstra MSR Ver83 external version collection |

## 来源文件

| 文件 | 内容范围 | 备注 |
|---|---|---|
| `MSR0241_Device General_Ver83 - External Version (Final).xlsx` | Device General | 终端通用、CB、漫游、热点等 |
| `MSR0585_SIM_Ver83 - External Version (Final).xlsx` | SIM | SIM/USIM/ECC/SPN/PLMN 文件 |
| `MSR0726_Device Management_Ver83 - External Version (Final).xlsx` | Device Management | FOTA、提交和设备管理要求 |
| `MSR0757_Submission_Ver83 - External Version (Final).xlsx` | Submission | 认证提交材料要求 |
| `MSR0823_LTE_Ver83 - External Version (Final).xlsx` | LTE | EPS bearer、LTE 安全、PLMN、拥塞控制 |
| `MSR0853_IPv6_Ver83 - External Version (Final).xlsx` | IPv6 | IPv4v6、IPv6 single stack、CLAT、MTU |
| `MSR0868_WiFi_Ver83 - External Version (Final).xlsx` | Wi-Fi | Wi-Fi capability and hotspot |
| `MSR0920_VoLTE_Ver83 - External Version (Final).xlsx` | VoLTE | IMS/VoLTE/ROHC/SIP/业务能力 |
| `MSR0942_VoWiFi_Ver83 - External Version (Final).xlsx` | VoWiFi | IR.51、ePDG、handover、UI |
| `MSR0983_Band Combination_Ver83 - External Version (Final).xlsx` | Band Combination | LTE CA / EN-DC / SA CA |

## 参数需求

| 业务域 | 需求项 | 要求/取值 | 来源位置 | 备注 |
|---|---|---|---|---|
| Device general | Hotspot concurrent service | Hotspot mode must still receive email, SMS, MMS, voice calls including 3G, CSFB, VoLTE, VoWiFi and VoNR | MSR0241 R1.0.9 | Handset hotspot场景 |
| Cell broadcast | Cell Broadcast Service | Support ETSI TS 123.041 / TS 102.900 and listed message identifiers | MSR0241 R1.4.3-R1.4.5 | Message ID 4400 marked NA because configured range only up to 4399 |
| SIM / ECC | SIM ECC elementary file | Support SIM ECC EF `{6FB7}` | MSR0585 R5.1 | Voice-capable devices |
| SIM / ECC | USIM ECC elementary file | Support USIM ECC EF `{6FB7}` | MSR0585 R5.2 | Voice-capable devices |
| SIM / SPN | Network name display | Display network name from SPN for 5G/LTE/3G when Telstra SIM and network are available | MSR0585 R6.1 | Overseas roaming should show foreign carrier name or MCC/MNC |
| SIM / SPN | Blank SPN handling | Support SPN containing four blanks encoded as `0x20 0x20 0x20 0x20` | MSR0585 R6.2 | SPN edge case |
| SIM file | USIM phonebook and PLMN files | Support ADN/EXT1, LOCIGPRS, PLMNwACT, FPLMN, PLMNSel, HPLMN, SMSP | MSR0585 R7.2-R9.9 | SIM/USIM 文件能力 |
| Device management | FOTA transport | FOTA shall use secure connection; vendor response uses HTTPS and Android native A/B update | MSR0726 R1.1.7/R1.2.1 | Client certificate rows marked N because server does not verify client certificate |
| Device management | Retail/Wholesale firmware separation | Firmware update must not be determined only by IMSI or MCC/MNC and must preserve Retail/Wholesale/sub-brand firmware paths | MSR0726 R1.2.5-R1.2.9 | Telstra Retail / Wholesale separation |
| Emergency | Emergency during firmware download | Voice-capable device shall still be able to dial emergency numbers during download | MSR0726 R1.5.2 | FOTA scenario |
| LTE bearer | EPS bearer capability | Support network initiated dedicated EPS bearer, UE requested bearer resource modification, minimum 3 default EPS bearers, up to 8 dedicated bearers | MSR0823 R1.2-R1.13.2 | LTE bearer capability |
| LTE security | Integrity protection | If network does not support integrity protection, device shall not attach except emergency cases | MSR0823 R1.27 | LTE attach behavior |
| LTE capability | LTE category | DL Cat 7, UL Cat 13 | MSR0823 R1.28.0.1-R1.28.0.2 | Vendor response |
| LTE PLMN | EHPLMN/EPLMN/FPLMN | Support EHPLMN, reception of EPLMNs in Attach Accept, maintain FPLMN list | MSR0823 R1.40-R1.43 | LANES-related note in source |
| LTE PLMN | Forbidden network behavior | Do not automatically attach to forbidden networks except emergency attaches | MSR0823 R1.44 | FPLMN behavior |
| LTE congestion | APN-based congestion / backoff | Support APN-based session and mobility management congestion control; separate SM backoff timer per requested APN | MSR0823 R1.54-R1.56 | Backoff behavior |
| LTE congestion | LAPI / EAB | LAPI disabled; EAB not supported / NA | MSR0823 R1.59.1-R1.60.4 | Vendor response |
| IPv6 | IPv4v6 dual stack | Support IPv4 and IPv6 on a single PDP/PDN for IPv4v6 dual stack | MSR0853 R1.2 | LTE/5G capable devices |
| IPv6 fallback | Network reject behavior | Handle cause #50/#51/#52/#28/#32 and fall back according to Telstra IPv6 table | MSR0853 R1.3.1-R1.3.6 | Cause #27 starts T3396 in vendor comment |
| IPv6 single stack | IPv6 SS and CLAT | Support IPv6 single stack connectivity and handset/tablet IPv6 SS with XLAT464/CLAT | MSR0853 R2.1-R2.3 | Telstra.wap IPv6 SS note |
| IPv6 DNS | DNS via PCO | Request IPv6 DNS via PCO and both IPv4/IPv6 DNS for IPv4v6 activation | MSR0853 R6.1-R6.2 | DNS behavior |
| IPv6 MTU | Default IPv6 link MTU | Vendor response `sip_mtu[0]=1300` | MSR0853 R8.1 | Preserved as requirement-table response |
| Wi-Fi | Wi-Fi capability | 2.4 GHz Wi-Fi 4 supported; 5 GHz Wi-Fi 4, 802.11ac, 802.11ax, Wi-Fi 6E not supported | MSR0868 R1.06/R2.1-R2.4 | Product capability |
| Wi-Fi hotspot | IPv6 hotspot | Device should support use as Wi-Fi hotspot over IPv6 | MSR0868 R1.14 | Vendor response Y |
| VoLTE | IR.92 / MMTel | Support VoLTE per GSMA IR.92 version 17 or later; support MMTel capability per 3GPP R9 or later | MSR0920 R1.2/R1.3 | 5G/VoNR rows marked NA |
| VoLTE UI | VoLTE indicator and switch | VoLTE indicator displayed only when VoLTE call possible; no menu option for user to enable/disable VoLTE | MSR0920 R1.6-R1.7 | VoWiFi and VoLTE indicators must differ |
| VoLTE data-off | Packet data disabled | Disabling packet data shall not disable VoLTE voice calling | MSR0920 R1.10 | Data off behavior |
| IMS registration | IMS voice over PS | Device shall not register IMS if it does not indicate support of IMS voice over PS | MSR0920 R1.18 | IMS registration guard |
| IMS registration | Telstra MNC coverage | Support VoLTE/IMS for MNC 01, 71 and 72 | MSR0920 R1.21 | MCC 505 |
| IMS registration | Telstra Wholesale | Support Telstra Wholesale IMSI ranges `505 01 56...` and `505 01 55...` | MSR0920 R1.22 | Same MCC/MNC with wholesale ranges |
| VoLTE radio | ROHC / CDRX / bearers | Support ROHC for RTP/RTCP, short and long CDRX, and simultaneous internet/IMS/MMS/UT/tethering bearers | MSR0920 R2.2-R2.7 | IPv4 and IPv6 ROHC |
| VoLTE band | VoLTE on LTE bands | Support VoLTE on all supported LTE bands; B28/B3/B7 mandatory for Telstra | MSR0920 R2.12 | Telstra mandatory bands |
| VoLTE access | Access Class Barring skipping | Support `ac-BarringSkipForMMTELVoice` for MMTEL voice | MSR0920 R2.13 | Congestion scenario |
| SIP / IMS | Registration and timers | Follow SIP registration procedures; follow network periodic registration timer; if absent, use configurable own setting | MSR0920 R3.1/R3.5-R3.6 | 3GPP 24.229 |
| SIP / IMS | NAT keep-alive | Device should not send NAT keep-alive during IMS calls; network performs it | MSR0920 R3.7 | Source says preferred call drop if no network keep-alive |
| VoWiFi | IR.51 profile | Support GSMA IR.51 minimum version 9; vendor response says IR.51 v12.0 | MSR0942 R1.3-R1.3.1 | VoWiFi profile |
| VoWiFi | Untrusted WLAN IMS voice | Support VoWiFi calling based on IMS voice over untrusted network | MSR0942 R1.4.2 | 3GPP TS 23.402 |
| VoWiFi policy | Access selection | Allow VoWiFi only when cellular signal/quality is insufficient and Wi-Fi can support good quality call | MSR0942 R1.5 | Flight mode permitted |
| VoWiFi handover | VoWiFi to VoLTE | Support seamless handover from VoWiFi to VoLTE when LTE can support voice call | MSR0942 R1.6-R1.6.3 | Normal voice call |
| VoWiFi handover | VoLTE to VoWiFi | Support seamless handover from VoLTE to VoWiFi when cellular signal/quality becomes poor | MSR0942 R1.7-R1.7.3 | Normal voice call |
| VoWiFi thresholds | Handover thresholds | Wi-Fi idle in/out `-75/-82`; Wi-Fi call in/out `-70/-75`; LTE out/in `-118/-110 dBm`; rove timers `15s`; RTP QoS backoff `7s` | MSR0942 R1.5.1/R1.6.3 | Vendor response normalized from source |
| VoWiFi UI | User switch and indicators | VoWiFi switch supported and ON by default including roaming; separate VoWiFi icon; alert user to enable Wi-Fi if needed | MSR0942 R1.9-R1.10.2 | UI behavior |
| VoWiFi IPSec | ePDG tunnel lifetime | Do not maintain IPSec tunnel to ePDG if not registered on VoWiFi | MSR0942 R1.9.4 | ePDG/IPSec behavior |
| VoWiFi retry | SIP 503 retry interval | Follow network supplied retry interval rather than own retry algorithm | MSR0942 R1.9.3.1 | Same as VoLTE |
| VoWiFi media | IMS stack / UA / codecs | Use same IMS stack, SIP User Agent and codecs as VoLTE; EVS on VoWiFi if EVS supported for VoLTE | MSR0942 R1.11-R1.14.1 | Voice and data over Wi-Fi simultaneously |
| Band combination | LTE CA capability | LTE CA supported; max LTE CC 2; LTE DL Cat 7; LTE UL Cat 13; max LTE SS 4 | MSR0983 overview | Vendor response |
| Band combination | NR/ENDC/SA CA | EN-DC with NR CA, SA CA, SA CA with mmW marked N | MSR0983 overview | 4G product / no 5G CA |

## 待确认项

| 项目 | 说明 |
|---|---|
| Telstra MSR 全量认证条目 | 本文没有保留全部认证问卷行；完整行仍以原 xlsx 为准。 |
| APN 预配置 | Telstra APN pre-configuration requirements may refer to MSR0295, which is not part of this consolidated Ver83 file list. |
| 5G/VoNR/NR CA | 多处原表标为 NA 或 N，本文只作为产品响应备份，不推断平台配置。 |
| ECC 明细号码 | MSR0585 指向 Telstra Supporting Information 的 ECC file contents；当前文件只证明需要支持 SIM/USIM ECC EF，不包含具体号码清单。 |

## 维护备注

- Telstra 记录来自多个 MSR 文件合并，适合作为运营商要求索引，不适合作为直接配置清单。
- 后续做平台配置时，应按业务域回查原 xlsx 的 item 编号，再结合目标平台默认值和实现路径确认。

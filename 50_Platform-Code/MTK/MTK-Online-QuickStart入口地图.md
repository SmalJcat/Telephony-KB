---
doc_type: reference
domain: Platform-Code
status: active
quality: imported_reference
platform: MTK
source: Notion MTK 网络通信模块知识库 / MediaTek Online QuickStart
source_url: https://www.notion.so/35df72d579ba8195994ec1e15cea8564
search_tier: supplemental
---

# MTK Online QuickStart入口地图

## 阅读入口

这篇用于回答“MTK Online 该先看哪个栏目”。它不是代码路径文档，而是把 Smart Phone 调试宝典里的 Modem 和 Telephony 两组入口，按通信问题类型做成本地 KB 导航。

如果已经知道问题落在 AP / Framework / 应用层，先看 Telephony 栏目；如果问题落在协议栈、NAS/RRC/IMS/Data/SIM/SMS/SBP/NVRAM，先看 Modem 栏目。

## 快速选入口

| 问题类型 | 优先入口 | 联动入口 |
|---|---|---|
| 4G/5G 注册失败、Attach/TAU/Registration Reject | Modem / NAS Tech Training | RRC Tech Training、ERRC/NRRC SOP、SIM、SBP |
| 搜网、PLMN、camping、RLF、handover、ENDC、CA | Modem / RRC Tech Training | NAS、ERRC/NRRC SOP |
| VoLTE / VoNR / VoWiFi 注册与通话 | Modem / IMS Tech Training | IMS SS、WFC/ePDG、NAS/RRC |
| 数据不通、吞吐低、PDN/PDU 失败 | Modem / Data Tech Training | NAS、RRC、APN、URSP |
| SIM、ME Lock、SML、SAT/STK/UTK | Modem / SIM Tech Training | AT L5 MIPC、Telephony Framework & SIM |
| SMS / CB / SMS over IMS/SGs/WiFi | Modem / SMS Tech Training | Telephony Application、IMS、NAS |
| CS call、speech、legacy voice | Modem / CS Call Tech Training | NAS、RRC、Call 排障 |
| CarrierConfig、operator name、roaming icon、RAT mode | Telephony / Framework & SIM | NAS、SBP、CarrierConfig |
| Emergency number、IMS 开关、VoWiFi/ViLTE 配置 | Telephony / Call | IMS Tech Training、CS Call、WFC/ePDG |
| APN、IMS APN、MMS APN、Fast Dormancy | Telephony / Data Service | Modem Data、PDU Session |
| Message/MMS/CB、Contacts、Dialer、Browser/HTTP/TCP | Telephony Application | SMS Tech Training、Data Service |
| AT command、L5 flow、MIPC API/customization | Modem / AT L5 MIPC | Telephony Framework & SIM |
| 运营商差异、feature 开关、DSBP/SBP | Modem / SBP Feature Guide | IMS、NAS、Data、NVRAM |
| 持久化参数、版本切换后行为变化 | Modem / NVRAM | SBP、产物/NV 链路 |

## Modem 栏目读法

| 栏目 | 适用问题 | 第一眼看什么 |
|---|---|---|
| Project KO Guide | 项目 KO、认证、operator test、field test | FT SOP、GCF/PTCRB、operator SOP |
| Architecture Training | Modem 架构、DSDS、Dual 5G | M50/M70 差异、NR DSDS、Dual 5G |
| NAS Tech Training | 2G/3G/4G/5G 注册、PLMN、异常注册 | PLMN selection、abnormal registration、reject cause |
| RRC Tech Training | LTE/NR 小区、重选、测量、切换、CA/ENDC | AS architecture、measurement、handover |
| IMS Tech Training | IMS 注册、普通/紧急通话、handover | IMS Registration、Normal Call、Emergency Call |
| Data Tech Training | PS domain、PDP/PDN/PDU、吞吐 | DATA log example、Wireshark、EMMA |
| SIM Tech Training | SIM 识别、ME Lock、SAT/STK | SIM training、SML、ME Lock |
| SMS Tech Training | MO/MT SMS、CB、SMS over IMS/SGs/WiFi | Message 专区、MO/MT checklist |
| CS Call Tech Training | CS call、speech issue | CS Call training、Speech Issue |
| AT L5 MIPC | AT、L5 flow、MIPC | AT command description、MIPC API |
| NVRAM | AP/Modem NVRAM、持久化参数 | Modem NVRAM、AP NVRAM |
| SBP Feature Guide | 运营商差异和 feature 开关 | SBP/DSBP guideline、customization |
| ERRC/NRRC Issue SOP | RRC/AS 场景化检查 | camp-on、paging、RLF、handover、EPSFB |

## Telephony 栏目读法

| 栏目 | 适用问题 | 第一眼看什么 |
|---|---|---|
| Common | Telephony log、eService、FT SOP | FAQ21674、FAQ21691、IMS support status |
| Framework & SIM | CarrierConfig、operator name、RAT、VSIM、SIM switch | CarrierConfig、RAT mode、AT routing |
| Call | Emergency、IMS Framework、VoLTE/VoWiFi/ViLTE | IMS config、WFC、Emergency number |
| Data Service | APN、IMS APN、socket、throughput | APN Config、IMS APN、socket SOP |
| Telephony Application | SMS/MMS/CB、Contacts、Dialer、Browser | MMS/CB 提交信息、HTTP/TCP 证据 |

## 推荐阅读顺序

| 场景 | 顺序 |
|---|---|
| 新项目 / 新平台 | Project KO Guide -> Architecture Training -> SBP Feature Guide -> NVRAM |
| 注册驻网 | NAS Tech Training -> RRC Tech Training -> ERRC/NRRC SOP -> SIM/SBP |
| 语音和 IMS | IMS Tech Training -> IMS SS -> WFC/ePDG -> NAS/RRC |
| 数据业务 | Data Tech Training -> NAS/RRC -> APN/PDU/URSP -> SBP/NVRAM |
| AP/Framework 配置 | Telephony Common -> Framework & SIM -> CarrierConfig/IMS/APN |

## 本地关联

- [MTK Telephony代码架构速查](Telephony代码架构速查.md)
- [MTK-配置关系与生效链路](../../60_Configuration/MTK-配置关系与生效链路.md)
- [MTK-WFC-ePDG配置与排查索引](../../60_Configuration/MTK-WFC-ePDG配置与排查索引.md)
- [MTK-网络通信问题抓Log与提交模板](../../70_Tools-Debug/Log-Capture/MTK-网络通信问题抓Log与提交模板.md)


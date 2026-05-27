---
doc_type: index
domain: Meta
status: active
quality: imported_reference
---

# 60_Configuration

## 速查结论

- 配置问题先确认落点：AOSP 公共配置、厂商私有配置、MCC/MNC 运营商配置、SIM/卡槽维度、NV/系统属性/CarrierConfig。
- 定位时必须同时保留三类证据：配置文件、运行时 dump、log 中最终生效值。
- 本文图片已转成本地附件；非图片附件仍保留原 Outline 链接作为资料索引。

这里集中放“配置从哪里来、如何匹配、在哪一层生效、失败时怎么验证”。业务流程只链接配置影响点，不重复配置细节。

## 入口

| 文档 | 用途 |
|---|---|
| [[配置与客户定制]] | 配置类总览和旧链接兼容入口 |
| [[NV参数配置]] | NV 参数配置、NVTool、展锐 NV 参数、版本、生效、回退和验证清单 |
| [[Modem NV参数映射]] | Modem/Operator NV 字段映射总入口；字段级大表已拆到 `References/NV` |
| [[APN配置方法]] | APN 配置字段、MTK/UNISOC 路径和迁入资料 |
| [[CarrierConfig配置方法]] | CarrierConfig / CarrierSettings 配置和架构资料 |
| [[CarrierConfig参数映射]] | CarrierConfig key 总入口；字段级大表已按 Group 拆到 `References/CarrierConfig` |
| [[UNISOC-CarrierService启动与CarrierConfig加载流程]] | UNISOC `CarrierService` 绑定、`CarrierConfigLoader` 短连接加载、carrier app 长连接边界 |
| [[IMS配置方法]] | IMS 注册、MTK SBP/DSBP/CXP、VoWiFi IKE、SIP 403 配置与证据口径 |
| [[ECC配置方法]] | MTK / UNISOC EccList、紧急号码来源和参数资料 |
| [[SMS配置方法]] | SMSC、FDN、短码、Voicemail 号码来源和配置边界 |
| [[补充业务配置方法]] | Call Forwarding、Call Barring、USSD、XCAP/UT 域选与配置边界 |
| [[SIMLock配置方法]] | MTK / UNISOC SIMLock、锁网白名单、解锁次数、产物和 AP UI 同步 |
| [[User-Agent配置方法]] | IMS / SIP、MMS、Video Streaming User-Agent 客制化 |
| [[网络制式图标配置方法]] | 4G/5G/NR 图标显示、CarrierConfig 和 MobileMappings 入口 |
| [[卫星通信配置]] | Satellite Telephony feature flag 和相关配置 |
| [[运营商名称配置方法]] | EONS、PNN/OPL/SPN、运营商名称加载流程 |
| [[小区广播配置方法]] | Cell Broadcast / CBS 信道、Mainline 限制、紧急广播过滤边界 |
| [[运营商应答资料索引]] | AMX、Orange、Technical、DTR 等运营商资料入口 |

## 配置分类

| 类别 | 常见问题 | 关键证据 |
|---|---|---|
| APN | 数据连不上、IMS APN 不生效、IPv4/IPv6 不符 | APN database、`SET_INITIAL_ATTACH_APN`、data call profile |
| 运营商名 | 显示名错误、漫游名错误、SPN/PNN 优先级不符 | EFSPN、EFPNN、OPL、CarrierConfig、overlay |
| ECC | 无卡/有卡紧急号码错误、双卡号码共享争议 | EF_ECC、网络下发、database、EmergencyNumberTracker |
| SMS | 短信中心、FDN、短码、Voicemail | RILJ `SEND_SMS`、SMSC、FDN list、`SMSDispatcher` |
| 补充业务 | CF/CB/USSD/UT/XCAP 失败或回落 | AT 命令、域选、XCAP HTTP、CISS、NV/Profile |
| NV | 锁网、能力开关、modem 策略、运营商 profile | NV 源文件、版本号、刷机产物、运行时读取值 |
| CarrierConfig | 功能开关、策略门控、IMS/数据/通话能力 | `dumpsys carrier_config`、MCC/MNC/GID 匹配 |
| IMS | VoLTE/VoWiFi/VoNR/SMS over IMS、SBP、IKE/ePDG | `AT+EIMSCFG`、IMC/SBP、SIP、IKE |
| SIMLock | 非白名单卡可驻网、锁网 UI 不弹 | modem 锁网配置、产物、AP 状态同步 |
| 小区广播 | CB/CMAS/ETWS 信道、默认开关、标题/铃声/振动 | Mainline/full 版本、MCC/MNC、channel range、底层上报 |

## 放置规则

| 内容 | 放置位置 |
|---|---|
| 配置字段、匹配规则、生效链路 | `60_Configuration` |
| 配置导致的真实问题证据链 | `40_Case-Library` |
| 配置影响某个业务步骤 | 在 `20_Service-Flows` 中链接到这里 |
| 平台代码读取配置的位置 | `50_Platform-Code` |

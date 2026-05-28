---
quality: curated
doc_type: architecture
domain: Platform
layer: AP/RIL/VendorRIL/CarrierService/Modem
status: active
---

# Telephony函数级入口速查

## 使用入口

这篇回答“已经知道现象后，从哪几个函数开始读代码”。流程判断仍看 [业务流程](../../20_Service-Flows/README.md)，配置字段仍看 [配置方法](../../60_Configuration/README.md)，真实问题证据仍进 [Case Library](../../40_Case-Library/README.md)。

## Android 共性入口

| 现象 | AP 入口 | 下一层入口 | 关键 log / dump |
|---|---|---|---|
| AP 无服务 / 注册态不同步 | `ServiceStateTracker.pollState()`、`handlePollStateResult()` | `NetworkRegistrationManager.requestNetworkRegistrationInfo()`、`CellularNetworkService.requestNetworkRegistrationInfo()` | `RILJ`、`NetworkRegistrationInfo`、`ServiceState` |
| CS/PS 注册态字段错 | `CellularNetworkService.createRegistrationStateFromVoiceRegState()` / data variant | `RIL.getVoiceRegistrationState()`、`RIL.getDataRegistrationState()` | `VOICE_REGISTRATION_STATE`、`DATA_REGISTRATION_STATE` |
| 默认承载 / IA APN 不对 | `DataProfileManager`、`DataServiceManager.setInitialAttachApn()` | `RIL.setInitialAttachApn()`、`RadioDataProxy.setInitialAttachApn()` | `SET_INITIAL_ATTACH_APN`、DataProfile、ESM cause |
| Data call 已建但无网 | `DataNetworkController`、`DataServiceManager.setupDataCall()` | `RIL.setupDataCall()`、vendor data service | `setupDataCall`、DNS/TCP、NetworkMonitor |
| CarrierConfig 不生效 | `CarrierConfigManager.getConfigForSubId()` | `CarrierConfigLoader.getConfigForSubIdWithFeature()`、`updateConfigForPhoneId()` | `dumpsys carrier_config`、carrier id、MCC/MNC/GID |
| 运营商名显示错 | `ServiceStateTracker.updateSpnDisplay()`、`CarrierDisplayNameResolver` | SIM EF / CarrierConfig / local PLMN name | `EF_SPN`、`EF_PNN/OPL`、ONS/NITZ |

## CarrierService / CarrierConfig

| 目标 | 代码入口 | 判断点 |
|---|---|---|
| 触发重载 | `CarrierConfigLoader.updateConfigForPhoneId(int phoneId)`、`notifyConfigChangedForSubId(int subId)` | SIM 状态、carrier id、package change、override config 是否触发 |
| 绑定 carrier app | `CarrierConfigLoader.bindToConfigPackage(pkg, phoneId, eventId)` | 是否找到默认包或 privileged carrier app，bind 是否成功 |
| 读取默认配置 | `DefaultCarrierConfigService.onLoadConfig(CarrierIdentifier)`、`loadConfig(XmlPullParser, id)` | 默认 XML 是否按 MCC/MNC/GID/SPN 匹配 |
| 运行时查询 | `CarrierConfigLoader.getConfigForSubIdWithFeature()` | shell/app 看到的值是否是最终合并值 |
| 调试覆盖 | `CarrierConfigLoader.overrideConfig()` | 临时 override 是否污染复测，是否需要清理 |

读代码顺序：

```text
CarrierConfigManager.getConfigForSubId
-> CarrierConfigLoader.getConfigForSubIdWithFeature
-> updateConfigForPhoneId / bindToConfigPackage
-> CarrierService.onLoadConfig
-> dumpsys carrier_config 验证最终值
```

## UNISOC 入口

| 问题 | 函数 / 类 | 文件方向 | 证据 |
|---|---|---|---|
| 标准注册态请求进入 libril | `RadioImpl::getVoiceRegistrationState()`、`getDataRegistrationState()` | `hardware/ril/libril/ril_service.cpp` | RIL request serial、response error |
| 标准注册态返回 AP | `radio::getVoiceRegistrationStateResponse()`、`getDataRegistrationStateResponse()` | `hardware/ril/libril/ril_service.cpp` | `regState`、`rat`、CellIdentity、reject reason |
| IA APN 下发 | `RadioImpl::setInitialAttachApn()`、`radio::setInitialAttachApnResponse()` | `hardware/ril/libril/ril_service.cpp` | APN/protocol/auth 是否传到 RIL |
| 扩展 LTE 开关 | `RadioInteractorCore.enableLTE()`、`ExtRadioNetworkProxy.enableLTE()` | `vendor/sprd/modules/radiointeractor` | `enableLTE` response、网络模式变化 |
| 扩展 data attach | `RadioInteractorCore.attachData()`、`reAttach()`、`ExtRadioDataProxy.attachData()` | `vendor/sprd/modules/radiointeractor` | attach/re-attach response、PDP/PDN 状态 |
| 注册拒绝旁路 | `ExtRadioNetworkIndication.reasonsForRegRejectedInd()` | `vendor/sprd/modules/radiointeractor` | reject scene 字段、modem NAS reject |
| RACH 失败旁路 | `ExtRadioNetworkIndication.rachFailInd()` | `vendor/sprd/modules/radiointeractor` | RRCConnectionRequest 后是否 RACH/T300 失败 |
| 扩展注册态 | `ExtRadioNetworkIndication.networkRegStateInd()` | `vendor/sprd/modules/radiointeractor` | CS/PS state/type 与 Framework 注册态是否一致 |

UNISOC 判断顺序：

```text
标准链路先看 RILJ / CellularNetworkService / libril
-> 只有涉及平台扩展事件时再看 RadioInteractor
-> modem trace 用 EMM/ESM/LRRC/L2/PLM 证明协议事实
```

## MTK 入口

| 问题 | 函数 / 类 | 文件方向 | 证据 |
|---|---|---|---|
| RIL request 进入网络服务 | `RadioNetwork::getDataRegistrationState()`、`getVoiceRegistrationState()` | `fusion/libril/radionetwork_service.cpp` | AIDL request serial、slot、clientId |
| 注册态 response 回 AP | `radioNetwork::getDataRegistrationStateResponse()`、`getVoiceRegistrationStateResponse()` | `fusion/libril/radionetwork_service.cpp` | `RegStateResult`、reason、PLMN、CellIdentity |
| RIL request 映射 RFX | `RfxIdToMsgIdUtils` | `fusion/mtk-ril/framework` | RIL request 是否映射到 `RFX_MSG_*` |
| 网络控制器分发 | `RtcNetworkController::onHandleRequest()`、`onHandleResponse()`、`onHandleUrc()` | `fusion/mtk-ril/telcore/nw` | 手动搜网、scan、注册态请求是否被拦截或延迟 |
| AT 通道注册态 cache | `RmcNetworkUrcHandler::handleCsNetworkStateChanged()`、`handlePsNetworkStateChanged()` | `fusion/mtk-ril/mdcomm/nw` | `+EREG` / `+EGREG` 是否更新 cache |
| AT 通道注册态读取 | `RmcNetworkRealTimeRequestHandler::requestVoiceRegistrationState()`、`requestDataRegistrationState()` | `fusion/mtk-ril/mdcomm/nw` | `sendVoiceRegResponse()`、`sendDataRegResponse()` 填值 |
| MIPC 通道注册态读取 | `RmmNwRealTimeRequestHandler::requestVoiceRegistrationState()`、`requestDataRegistrationState()` | `fusion/mtk-ril/mdcomm_mipc/nw` | MIPC 分支是否与 AT 分支一致 |
| IA APN AIDL 入口 | `RadioData::setInitialAttachApn()` | `fusion/libril/radiodata_service.cpp` | APN/protocol/auth/user/password 拷贝 |
| IA APN vendor 控制 | `RtcDataController` / `RtmDataController` | `fusion/mtk-ril/telcore* / data` | `RFX_MSG_REQUEST_SET_INITIAL_ATTACH_APN` 是否进入 data controller |
| IA APN modem 下发 | `RmcDcReqHandler`、`RmmDcRequestHandler` | `fusion/mtk-ril/mdcomm* / data` | `AT+EIAAPN` 或 `MIPC_APN_SET_IA_REQ` |

MTK 判断顺序：

```text
RILJ request
-> radionetwork_service / radiodata_service
-> RfxIdToMsgIdUtils 找 RFX_MSG
-> Rtc/Rtm controller
-> Rmc/Rmm handler
-> AT 或 MIPC 到 modem
```

## 现象到代码路径

| 现象 | 优先入口 | 不要先看哪里 |
|---|---|---|
| modem 已 Attach 成功但 AP 仍无服务 | `getDataRegistrationStateResponse()`、`CellularNetworkService` 映射 | 不要先改 PLMN / APN 配置 |
| AP 显示 `REG_DENIED` 但 NAS 无 reject | vendor RIL response 中 `reasonForDenial` / cache | 不要直接判网络拒绝 |
| APN 配置正确但默认承载失败 | `DataProfileManager`、`setInitialAttachApn`、MTK `AT+EIAAPN` / MIPC、UNISOC NAS ESM | 不要只看 APN XML |
| 手动搜网列表有网但选择失败 | MTK `RtcNetworkController` / `setNetworkSelectionModeManual`；UNISOC ExtRadioNetwork + modem PLMN trace | 不要只看最终 `ServiceState` |
| 弱场移动后不回 4G | RRC/L1 测量、RACH fail、AP poll 时序 | 不要只看 AP 信号格 |
| CarrierConfig 改了不生效 | `CarrierConfigLoader.updateConfigForPhoneId()`、`bindToConfigPackage()`、`dumpsys carrier_config` | 不要只看 XML 合入 |

## 源码位置备忘

| 平台 | 已确认路径 |
|---|---|
| UNISOC full tree | `\\wsl.localhost\Ubuntu-22.04\home\wx\Project\Common\SPRDROID16_SYS_MAIN_W25.22.4\alps` |
| UNISOC vendor tree | `\\wsl.localhost\Ubuntu-22.04\home\wx\Project\Common\SPRDROID13_VND_RLS_23A\alps` |
| MTK full tree | `\\wsl.localhost\Ubuntu-22.04\home\wx\Project\MP6\alps-release-b0.mp1.rc-tb-default\alps` |

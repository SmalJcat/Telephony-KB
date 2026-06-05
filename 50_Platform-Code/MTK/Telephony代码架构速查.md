---
doc_type: architecture
domain: Platform
status: active
quality: curated
search_tier: main_entry
platform: MTK
layer: AP/RIL/VendorRIL/Modem
---

# MTK Telephony代码架构速查

## 阅读入口

这篇只做 MTK 平台代码定位入口。函数级入口先看 [Telephony函数级入口速查](../Cross-Platform/Telephony函数级入口速查.md)，跨平台主线看 [平台代码与产物速查](../Cross-Platform/平台代码与产物速查.md)，编译环境看 [MTK-Modem编译环境配置](MTK-Modem编译环境配置.md)。

## 常用代码入口

| 目标 | 入口 |
|---|---|
| Android radio service 前端 | `vendor/mediatek/proprietary/hardware/ril/fusion/libril` |
| RIL request 到 RFX message 映射 | `RfxIdToMsgIdUtils` |
| AP vendor 控制层 | `fusion/mtk-ril/telcore`、`telcore_mipc` |
| 网络注册态 handler | `RtcNetworkController`、`RmcNetworkRequestHandler`、`RmcNetworkRealTimeRequestHandler` |
| 数据和 IA APN | `RtcDataController`、`RmcDcReqHandler`、`RmmDcEventHandler` |
| AIDL/HIDL response 转换 | `radionetwork_service.cpp`、`radiodata_service.cpp` |

## 注册态主线

```text
Android RILJ poll
-> RIL request
-> RfxIdToMsgIdUtils
-> RtcNetworkController / RmcNetwork*Handler
-> RIL_VoiceRegistrationStateResponse / RIL_DataRegistrationStateResponse
-> radionetwork_service.cpp
-> Framework NetworkRegistrationInfo
```

## IA APN 主线

```text
DataProfileManager
-> RIL.setInitialAttachApn
-> radiodata_service.cpp
-> RtcDataController
-> RmcDcReqHandler / RmmDcEventHandler
-> AT+EIAAPN 或 MIPC_APN_SET_IA_REQ
```

## 函数级入口

| 场景 | 入口 |
|---|---|
| AIDL network 入口 | `RadioNetwork::getDataRegistrationState()`、`getVoiceRegistrationState()` |
| 注册态 response 回 AP | `radioNetwork::getDataRegistrationStateResponse()`、`getVoiceRegistrationStateResponse()` |
| RFX 分发 | `RfxIdToMsgIdUtils`、`RtcNetworkController::onHandleRequest()` / `onHandleResponse()` / `onHandleUrc()` |
| AT 注册态 cache | `RmcNetworkUrcHandler::handleCsNetworkStateChanged()`、`handlePsNetworkStateChanged()` |
| AT 注册态读取 | `RmcNetworkRealTimeRequestHandler::requestVoiceRegistrationState()`、`requestDataRegistrationState()`、`sendVoiceRegResponse()`、`sendDataRegResponse()` |
| MIPC 注册态读取 | `RmmNwRealTimeRequestHandler::requestVoiceRegistrationState()`、`requestDataRegistrationState()` |
| IA APN | `RadioData::setInitialAttachApn()`、`RtcDataController` / `RtmDataController`、`RmcDcReqHandler` / `RmmDcRequestHandler` |

## 定位原则

- MTK 读代码先用 `RfxIdToMsgIdUtils` 把 RIL request 映射到 `RFX_MSG_*`，再找 `Rtc/Rmc/Rmm` handler。
- AP 注册态来自 cache 时，要找 cache 更新点，不能只看当前 poll response。
- IA APN 是否真正下到 modem，以 `AT+EIAAPN`、`MIPC_APN_SET_IA_REQ` 或 `+EIAREG` 这类证据为准。
- 不同项目可能走 AT 或 MIPC 通道，排查时先确认目标分支通道。

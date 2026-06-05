---
doc_type: architecture
domain: Platform
status: active
quality: curated
search_tier: main_entry
platform: UNISOC
layer: AP/RIL/VendorRIL/Modem
---

# UNISOC Telephony代码架构速查

## 阅读入口

这篇只做 UNISOC 平台代码定位入口。函数级入口先看 [Telephony函数级入口速查](../Cross-Platform/Telephony函数级入口速查.md)，跨平台主线看 [平台代码与产物速查](../Cross-Platform/平台代码与产物速查.md)，CarrierConfig 加载细节看 [UNISOC CarrierService启动与CarrierConfig加载流程](UNISOC-CarrierService启动与CarrierConfig加载流程.md)。

## 常用代码入口

| 目标 | 入口 |
|---|---|
| 标准注册态请求/响应 | `hardware/ril/libril/ril_service.cpp`、`hardware/ril/libril/ril_commands.h` |
| Framework 注册态合成 | `frameworks/opt/telephony`、`packages/services/Telephony` |
| UNISOC 扩展 Radio HAL | `vendor/sprd/interfaces/radio/aidl/vendor/unisoc/hardware/radio/*` |
| AP 扩展服务 | `vendor/sprd/modules/radiointeractor` |
| CarrierConfig 默认服务 | `vendor/sprd/platform/packages/apps/CarrierConfig`、`packages/apps/CarrierConfig` |
| Log 工具和抓取配置 | `vendor/sprd/platform/packages/apps/LogManager` |

## 注册问题读代码顺序

```text
ServiceStateTracker
-> NetworkRegistrationManager / CellularNetworkService
-> RIL.getVoiceRegistrationState / getDataRegistrationState
-> libril ril_service.cpp
-> vendor.unisoc.hardware.radio.* 服务
-> modem NAS/RRC trace
```

## UNISOC 扩展点

| 扩展点 | 用途 |
|---|---|
| `RadioInteractor` | 平台扩展命令和 unsolicited indication 包装 |
| `ExtRadioNetworkProxy` | 网络模式、注册拒绝、RACH 失败、扩展注册态 |
| `ExtRadioDataProxy` | data attach/detach、active PDP、数据侧扩展 |
| `ExtRadioModemProxy` | modem 状态、版本、部分 NV/工程能力 |

## 函数级入口

| 场景 | 入口 |
|---|---|
| 标准 CS/PS 注册态 | `RadioImpl::getVoiceRegistrationState()` / `getDataRegistrationState()`，response 看 `radio::getVoiceRegistrationStateResponse()` / `getDataRegistrationStateResponse()` |
| Initial Attach APN | `RadioImpl::setInitialAttachApn()`，response 看 `radio::setInitialAttachApnResponse()` |
| LTE 开关 / 网络模式扩展 | `RadioInteractorCore.enableLTE()`、`ExtRadioNetworkProxy.enableLTE()`、`setPreferredNetworkTypeExt()` |
| data attach / reattach | `RadioInteractorCore.attachData()`、`reAttach()`、`ExtRadioDataProxy.attachData()` |
| 注册拒绝 / RACH 失败旁路 | `ExtRadioNetworkIndication.reasonsForRegRejectedInd()`、`rachFailInd()` |
| 扩展注册态通知 | `ExtRadioNetworkIndication.networkRegStateInd()` |

## 定位原则

- 标准注册态先看 AOSP RIL 主链，不要一开始就跳到 `RadioInteractor`。
- RACH fail、注册拒绝旁路、快速回网等平台扩展事件，再看 `ExtRadio*`。
- AP 显示无服务但 modem 已成功时，重点查 RIL response 字段、CellIdentity、PLMN、reject reason 映射。
- modem trace 不完整时，先补抓 EMM/ESM/LRRC/L2/PLM 相关 trace，再下结论。

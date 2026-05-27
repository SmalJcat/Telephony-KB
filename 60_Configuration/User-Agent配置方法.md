---
doc_type: config
domain: Configuration
status: active
quality: imported_reference
feature: User-Agent
layer: AP/IMS/MMS/Media/NV
---

# User-Agent配置方法

## 阅读入口

这篇记录 IMS / SIP、MMS、Video Streaming User-Agent 客制化入口。修改前必须同时确认配置来源、运行时 log 中最终 UA，以及是否影响多个运营商共用格式。

## IMS / SIP UA

UNISOC 参考入口：

```text
alps/vendor/sprd/modules/rild/impl-ril/impl_ril.c
OPERATOR_NV_IMS\ims_ua_name_type\sip_uaNameType\sip_uaNameType[0]
```

常见 SIP UA 组成：

```text
operator name + brand + model + operating system + firmware version + ims version
```

示例：

```text
Telstra TCL T450H Android15 450HDS1L IMS2.0
```

注意事项：

- `sip_uaNameType` 控制 UA 格式类型，不能只改字符串模板。
- 不要随意改公共 `snprintf()` 格式；多个运营商可能共用同一格式。
- 如果必须新增格式，建议新增自定义 type，再通过 NV 按运营商选择。
- IMS UA 属于 IMS/SIP 行为，真实问题 case 应放 `40_Case-Library/IMS` 或 Call/IMS 对应 case。

## MMS UA

AOSP/UNISOC 常见入口：

```text
alps/packages/services/Telephony/src/com/android/phone/PhoneInterfaceManager.java
```

默认 MMS UA 常见格式：

```text
<model>-MMS/2.0
```

客户定制时常见做法是按厂商或项目条件拼接 brand，例如：

```text
TCL T450H-MMS/2.0
```

验证时看 MMS HTTP 请求头，不要只看配置文件。

## Video Streaming UA

常见入口：

```text
alps/frameworks/av/media/module/foundation/FoundationUtils.cpp
```

原生默认值常见为：

```text
stagefright/1.2
```

客户定制可能按 `ro.product.model` 或厂商字段生成 UA，并新增 `x-wap-profile`。验证时以实际 HTTP 请求和媒体业务 log 为准。

## 来源记录

- [User Agent配置](http://192.168.3.94:8888/doc/user-agent-MtPEx09ncp) (`MtPEx09ncp`)


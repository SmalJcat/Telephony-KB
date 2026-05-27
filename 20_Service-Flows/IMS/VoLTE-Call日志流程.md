---
doc_type: flow
domain: IMS
status: active
quality: imported_reference
---

# VoLTE-Call日志流程

## 拆分说明

VoLTE Call 旧资料已按基础流程、AP log、modem log 拆分：

| 文档 | 内容 |
|---|---|
| [[VoLTE-Call基础流程]] | VoLTE Call 基础调用链和关键类 |
| [[VoLTE-Call-AP日志流程]] | AP 侧 log / framework / vendor IMS 调用链 |
| [[VoLTE-Call-Modem日志流程]] | modem 侧呼叫证据 |

## 定位建议

- 先看 [[VoLTE-Call基础流程]] 确认调用边界。
- AP 有拨号但没有下到 IMS / modem，看 [[VoLTE-Call-AP日志流程]]。
- AP 已发起但 SIP / modem 侧异常，看 [[VoLTE-Call-Modem日志流程]]。

## 来源记录

- [IMS Call流程](http://192.168.3.94:8888/doc/ims-call-b5HSCaTFMm) (`b5HSCaTFMm`)
- [视频通话流程](http://192.168.3.94:8888/doc/6keg6akr6yca6kd5rwb56il-hKcxT0jmnh) (`hKcxT0jmnh`)

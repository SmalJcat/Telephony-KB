---
doc_type: flow
domain: IMS
status: active
quality: imported_reference
---

# IMS-Call流程补充资料

## 拆分说明

这篇原来同时包含 VoLTE Call log、视频通话流程、AP log 和 modem log，单页过长。现在保留为入口页，正文拆到以下文档：

| 文档 | 内容 |
|---|---|
| [[VoLTE-Call日志流程]] | VoLTE Call log 拆分入口 |
| [[VoLTE-Call基础流程]] | VoLTE Call 基础调用链和关键类 |
| [[VoLTE-Call-AP日志流程]] | VoLTE Call AP 侧调用链和 log |
| [[VoLTE-Call-Modem日志流程]] | VoLTE Call modem 侧证据 |
| [[视频通话流程]] | 视频通话流程拆分入口 |
| [[视频通话拨号流程]] | 视频通话 MO 拨号入口和调用链 |
| [[视频通话来电流程]] | 视频通话 MT 来电入口和调用链 |
| [[视频通话界面与Log]] | 视频通话界面状态、AP log 和 modem log |
| [[IMS业务流程]] | IMS 注册、VoLTE、VoWiFi、VoNR、SMS over IP、USSD 的短流程入口 |

## 使用建议

- 查“VoLTE 呼叫是否从 AP 触发到 modem / IMS”的链路，看 [[VoLTE-Call日志流程]]。
- 查视频通话入口、来电和界面状态，看 [[视频通话流程]]。
- 查 IMS 注册、VoNR、SMS over IP 等基础流程，看 [[IMS业务流程]]。


## 来源记录

- [IMS Call流程](http://192.168.3.94:8888/doc/ims-call-b5HSCaTFMm) (`b5HSCaTFMm`)
- [视频通话流程](http://192.168.3.94:8888/doc/6keg6akr6yca6kd5rwb56il-hKcxT0jmnh) (`hKcxT0jmnh`)

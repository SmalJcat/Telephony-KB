---
doc_type: flow
domain: IMS
status: active
quality: imported_reference
search_tier: supplemental
---

# VoLTE-Call-Modem日志流程

<!-- SUPPLEMENTAL_BOUNDARY_START -->
## 使用边界

- 本页是补充资料或短专题，适合查局部步骤、旧来源和零散技巧。
- 若需要直接定位问题，优先回到对应主流程、配置方法、排障流程或 Case。
- 后续新增结论应沉淀到主文档，本页只保留来源和辅助说明。
<!-- SUPPLEMENTAL_BOUNDARY_END -->


## 阅读入口

- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

## 阅读重点

- 这篇只保留 VoLTE 呼叫 modem 侧 log 证据。
- AP 侧证据看 [[VoLTE-Call-AP日志流程]]。

## **ZR VOLTE MODEM log**

\-> PDN_CONNECTIVITY_REQUEST lg 12:14:55.209 **LTE驻网**

\-> ATTACH_REQUEST lg 12:14:55.210

<- ATTACH_ACCEPT lg 12:14:56.039

<- ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_REQUEST lg 12:14:56.043 **APN: cmnet.MNC000.MCC460.GPRS**

\-> ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_ACCEPT lg 12:14:56.044

\-> ATTACH_COMPLETE lg 12:14:56.044 **attach完成**

\-> PDN_CONNECTIVITY_REQUEST lg 12:14:56.069 **APN: ims**

Time: 15952 ATC: BuildUnsolicitedInfo, link_id:1, sim:0, len:13, string: ^CONN: 11,2,1 lg 12:14:56.333 **ims pdp激活成功**

\-> \[0\]REGISTER lg 12:14:56.506 **ims发起注册**

<- \[0\]401 lg 12:14:56.746

\-> \[0\]REGISTER lg 12:14:57.313

<- \[0\]200 lg 12:14:57.581

\-> \[0\]SUBSCRIBE lg 12:14:57.588

<- \[0\]200 lg 12:14:57.675

<- \[0\]NOTIFY lg 12:14:57.697

\-> \[0\]200 lg 12:14:57.700

ATC: ATC_RecNewLineSig,link_id:2,sim:0,len:16,line:ATD18062077083; lg 12:15:27.582 **拨号**

\-> \[0\]INVITE lg 12:15:27.598 **发起volte通话**

<- \[0\]100 lg 12:15:27.816

<- \[0\]183 lg 12:15:29.475

<- \[0\]180 lg 12:15:30.255 **ringing**

<- \[0\]200 lg 12:15:33.903

\-> \[0\]ACK lg 12:15:33.909

<- \[0\]BYE lg 12:15:52.934 **终止通话**

\-> \[0\]200 lg 12:15:52.936

## 来源记录

- [IMS Call流程](http://192.168.3.94:8888/doc/ims-call-b5HSCaTFMm) (`b5HSCaTFMm`)
- [视频通话流程](http://192.168.3.94:8888/doc/6keg6akr6yca6kd5rwb56il-hKcxT0jmnh) (`hKcxT0jmnh`)

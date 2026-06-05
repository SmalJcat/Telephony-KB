---
quality: curated
doc_type: case
domain: Registration
rat: LTE
feature: Attach / PDN reject / operator certification
platform: UNISOC
layer: Modem/NAS/ESM
symptom: "Verizon 卡先插入未认证 IMEI 设备后，再插回认证 IMEI 设备仍只能紧急驻网或无法正常数据注册"
cause: "网络侧对 LTE attach / PDN 建链返回拒绝，关键 ESM cause 为 REQ_SERV_OPT_NOT_SUBSCRIBED；需要优先排查卡状态、PS 业务开通和默认 APN"
operator: "Verizon"
project: "GF2925Z"
chipset: "UMS9117"
source_log: "CQWeb SPCSS01550358 / SPCSS01607196"
first_bad_point: "ATTACH_REQUEST 后收到 ATTACH_REJECT，同时 PDN_CONNECTIVITY_REJECT 携带 REQ_SERV_OPT_NOT_SUBSCRIBED"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - registration
  - attach-reject
  - pdn-reject
  - apn
---

# Verizon 未认证 IMEI 后 Attach / PDN 拒绝

## 现象

Verizon SIM 先插入运营商未认证 IMEI 的设备中尝试注册，随后放回运营商认可的 IMEI 设备中，仍出现只能紧急驻网或无法正常数据注册。客户关注点是：同一张卡在认证 IMEI 设备中为何没有重新恢复正常。

## 结论

该类问题不能直接归因 AP 或 modem。关键证据是网络侧已经返回 LTE attach / PDN 拒绝，且 ESM cause 为 `REQ_SERV_OPT_NOT_SUBSCRIBED`。优先确认卡是否被网络侧限制、PS 业务是否仍开通、默认 APN 是否与对比机一致。

## 关键日志

```text
-> ATTACH_REQUEST
<- ATTACH_ACCEPT
-> ATTACH_COMPLETE

<- DETACH_REQUEST
-> DETACH_ACCEPT

-> ATTACH_REQUEST
<- ATTACH_REJECT
<- PDN_CONNECTIVITY_REJECT
ESM_Cause = REQ_SERV_OPT_NOT_SUBSCRIBED
```

另一份 fail log 中也可见：

```text
plmn = 311480
apn = VZWINTERNET
PDN_Type = IPV4V6
<- ATTACH_REJECT
<- PDN_CONNECTIVITY_REJECT
ESM_Cause = REQ_SERV_OPT_NOT_SUBSCRIBED
```

RTOS/功能机场景也有同类证据：插入 `311/480` 卡后 UI 表现为失去服务或仅紧急呼叫，log 中 `PlmnStatus` 从异常/选择态变为有限服务态；modem 侧仍能看到 `ATTACH_REQUEST` 后收到 `ATTACH_REJECT`，并伴随 `PDN_CONNECTIVITY_REJECT`，排查方向仍应回到网络侧拒绝、卡签约、IMEI/认证和默认 APN，而不是只看“紧急呼叫”状态。

## 排查步骤

1. 确认同卡在另一台认证设备上是否能注册并上网，不能只确认语音或紧急状态。
2. 对比测试机与对比机的默认 APN，特别是 `VZWINTERNET`、PDN type、协议栈类型。
3. 确认 reject 前是否曾经 `ATTACH_ACCEPT`，以及之后是否被网络 `DETACH_REQUEST`。
4. 如果重新 attach 失败，记录 NAS reject cause 和 ESM cause，不要只看状态栏“紧急呼叫”。
5. 若同卡在对比机也无法上网，优先查卡状态、业务订阅、运营商侧限制或 IMEI 认证状态。

## 复用边界

这个案例适合做“网络侧拒绝第一坏点”样例。它不证明所有 Verizon 注册问题都是 APN 问题，也不证明未认证 IMEI 一定会永久影响 SIM；必须结合同卡对比机、默认 APN 和网络侧 reject cause 判断。

## 来源

- CQWeb：`SPCSS01550358`
- CQWeb：`SPCSS01607196`

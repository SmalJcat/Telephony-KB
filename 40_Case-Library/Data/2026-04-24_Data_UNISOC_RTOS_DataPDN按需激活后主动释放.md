---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: PDN / default bearer / RTOS data
platform: UNISOC
layer: Modem/L4/PDP Manager/Application
symptom: "仪表测试中注册后几分钟 UE 主动释放 data PDN"
cause: "RTOS 数据 PDN 采用按需激活策略，上层业务申请 cid 后在业务完成时触发去激活，协议层随后发送 ESM_PDN_DISCONNECT_REQUEST"
operator: "SoftBank APN test"
project: "WM137"
chipset: "UWS6121EG"
source_log: "CQWeb SPCSS01652533"
first_bad_point: "PDP Manager 收到 MMIAPIPDP_Deactive/app_handler 请求，传导到协议层 PDN disconnect"
confidence: high
status: summarized
tags:
  - cqweb
  - data
  - pdn
  - rtos
  - default-bearer
---

# RTOS Data PDN按需激活后主动释放

## 用户现象

仪表测试中，设备注册成功并建立 data PDN 后，过几分钟 UE 主动发送 `ESM_PDN_DISCONNECT_REQUEST`，导致数据承载释放。测试侧希望 UE 长时间保持 connected 状态，以便执行 HO、SYNC out、RRC 重建等连接态用例。

## 结论

该问题不是网络拒绝，也不是默认承载建立失败。RTOS 数据 PDN 默认采用按需激活策略：上层业务申请 cid 后激活 PDN，业务完成后上层触发去激活，协议层再发送 `PDN disconnect request`。如果测试需要持续连接态，应通过平台提供的默认 PDN 保持接口或关闭触发去激活的业务路径处理。

## 关键证据

```text
11:06:31 EMM_ATTACH_REQUEST
11:06:31 ESM_PDN_CONNECTIVITY_REQUEST
11:06:32 ESM_ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_REQUEST
11:06:32 ESM_ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_ACCEPT
11:16:06 ESM_PDN_DISCONNECT_REQUEST, linked EBI=5
```

L4/PDP manager 侧可见：

```text
MMIAPIPDP_Active: apn=plus.acs.jp.v6
PDP MANAGER MMIAPIPDP_Deactive, app_handler=35
MNGPRS: HandleDeactivatePdpReq
```

## 处理方式

| 方向 | 说明 |
|---|---|
| 判断来源 | 先查是否由上层业务触发 `MMIAPIPDP_Deactive`，不要只看 NAS 层 `PDN disconnect request` |
| 测试规避 | 若当前测试与 MCU/业务无关，关闭会申请/释放 PDP 的业务 |
| 持续连接态 | 使用平台接口设置默认 PDN 模式，或修改业务侧 `RequestPdpId`/去激活策略 |
| 边界 | `AT` 手动激活后很快释放时，也要确认是否被上层业务或按需策略释放 |

## 沉淀规则

看到 UE 主动释放 data PDN 时，先按“谁触发去激活”追踪：

```text
Application/MMI -> PDP Manager -> MNGPRS -> ESM_PDN_DISCONNECT_REQUEST
```

若上层业务触发链路成立，应归为应用/平台策略或测试方法问题；若无上层触发，再继续查 modem 协议状态机、网络释放或异常恢复。

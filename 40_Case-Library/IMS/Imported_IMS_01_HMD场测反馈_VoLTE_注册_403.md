---
doc_type: case
quality: curated
domain: IMS
rat: LTE
feature: VoLTE Registration / SIP 403
platform: Mixed
layer: IMS/Modem/Network
symptom: "HMD 场测 VoLTE 注册失败，网络返回 403"
cause: "IMS 注册请求到达网络后被 403 Forbidden 拒绝，响应中携带 IMEI check failed，指向运营商侧 IMEI 校验/备案问题"
source_log: "Old Outline knowledge base; split from IMS问题案例补充.md"
first_bad_point: "SIP/IMS 注册阶段网络返回 403 Forbidden: IMEI check failed"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - imported
  - ims
  - volte
  - sip-403
  - imei
---

# HMD VoLTE 注册 403：网络 IMEI 校验失败

## 用户现象

HMD 场测反馈 VoLTE 无法注册。终端侧已进入 IMS 注册链路，但最终注册失败。

## 结论

第一坏点在网络侧 IMS 注册拒绝，不是 LTE 注册、APN 或本地 VoLTE 开关。关键信息是网络返回：

```text
403 "IMEI check failed."
```

该错误通常表示运营商 IMS 核心网对终端 IMEI 做校验，当前测试设备 IMEI 未在运营商侧登记、备案或白名单中。

## 关键证据

| 证据 | 判断 |
|---|---|
| VoLTE 注册返回 `403 Forbidden` | IMS 注册请求已经到达网络 |
| `IMEI check failed` | 拒绝原因指向设备身份校验 |
| LTE 注册本身未作为失败点出现 | 不应优先按 LTE attach、默认承载或 RF 方向排查 |

## 排查要点

- 先确认是否已经有 IMS APN / P-CSCF / SIP REGISTER 证据。
- 如果 403 响应明确携带 IMEI 校验失败，优先找运营商确认 IMEI 备案状态。
- 不要用修改 VoLTE 开关、APN 或 IMS profile 掩盖该类网络侧拒绝。

## 处理建议

1. 提供 DUT IMEI、IMSI、PLMN、时间点和 403 报文给运营商侧确认。
2. 用已备案 IMEI 的对比机或同设备授权 IMEI 复测。
3. 若运营商确认无备案限制，再回头查 IMS profile、P-CSCF、ISIM/AKA 和签约。

## 关联入口

- [[../../20_Service-Flows/IMS/IMS业务流程#IMS注册流程]]
- [[../../60_Configuration/IMS配置方法]]


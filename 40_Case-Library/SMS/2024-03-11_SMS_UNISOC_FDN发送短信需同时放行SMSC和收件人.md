---
quality: curated
doc_type: case
domain: SMS
rat: 2G/3G/LTE
feature: SMS / FDN / SMSC
platform: UNISOC
layer: Framework/Telephony/SIM FDN
symptom: "FDN 已激活时，给固定拨号列表中的联系人发送短信仍失败"
cause: "FDN 对 SMS 会同时校验短信中心号码和最终收件人号码，只加入收件人号码不足以通过检查"
project: "GH6571"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01310994"
first_bad_point: "SMS FDN check 中 SMSC 未加入 FDN list"
confidence: high
status: summarized
tags:
  - cqweb
  - sms
  - fdn
  - smsc
---

# FDN 发送短信：SMSC 和收件人都要在 FDN 列表

## 用户现象

插入已激活 FDN（Fixed Dialing Number）的 SIM 卡后：

- 给不在固定拨号列表中的号码发送短信，失败，符合预期。
- 给固定拨号列表中的号码发送短信，仍失败。
- UI 提示需要把号码添加到固定拨号列表。

## 结论

这是 FDN 对 SMS 的协议要求：发送短信时不仅检查最终收件人号码，还检查 SMSC（短信中心号码）。如果只把收件人号码加入 FDN list，而没有加入 SMSC，短信仍会被拦截。

历史 CQ 的结论：

```text
For SMS, the Service Center address and the end-destination address shall be checked.
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| FDN 状态 | SIM 是否启用 FDN / Fixed number dialing |
| 收件人号码 | 是否在 FDN list 中 |
| SMSC | 短信中心号码是否也在 FDN list 中 |
| 失败提示 | “请添加号码到固定拨号列表”可能指 SMSC，而不一定是收件人 |
| log 位置 | `SmsController` / `IccSmsInterfaceManager` / FDN check |

## 处理建议

- 做 FDN + SMS 测试时，测试用例要同时准备收件人号码和 SMSC。
- 如果客户只要求联系人在 FDN 中即可发短信，需要先确认该需求是否违反协议或运营商测试规范。
- 不要把该现象误判为短信中心配置错误、短信发送链路失败或网络拒绝；第一坏点在 AP/SIM FDN 校验。

---
quality: curated
doc_type: case
domain: SMS
rat: 2G/3G/LTE
feature: SMS / premium short code / SMSDispatcher
platform: UNISOC
layer: Framework/Telephony/SMSDispatcher
symptom: "应用调用 SmsManager 发送短码短信失败，服务端未收到短信"
cause: "短信未进入 RILJ SEND_SMS；本地修改 premium short code 确认分支时把 SmsTracker 当成 SmsTracker[] 强转，引发 phone 进程异常"
project: "GH6772"
chipset: "UMS9230E"
source_log: "CQWeb SPCSS01484963"
first_bad_point: "SMSDispatcher premium short code 分支处理对象类型错误，导致发送流程在 AP 侧中断"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sms
  - short-code
  - smsdispatcher
---

# 短码短信未到 RILJ `SEND_SMS`

## 用户现象

客户应用插卡后向固定短码发送销量统计短信，应用侧调用：

```java
smsManager.sendTextMessage(destServer, null, messageText, sentIntent, null);
```

现象是短信发送失败，服务端没有收到短信。

## 结论

这类问题先不要直接看网络或 SMSC。历史 CQ 的处理口径是：如果 AP 侧接口调用成功，RILJ 应该出现 `SEND_SMS` 打印；如果没有 `SEND_SMS`，说明短信还没走到 RIL/modem，优先查 AP `SMSDispatcher` / 权限 / premium short code 确认流程。

该案例中本地修改了 premium short code 分支，对 `SmsTracker` 类型处理错误，引发：

```text
java.lang.ClassCastException:
com.android.internal.telephony.SMSDispatcher$SmsTracker
cannot be cast to com.android.internal.telephony.SMSDispatcher$SmsTracker[]
at com.android.internal.telephony.SMSDispatcher.handleMessage(...)
```

因此第一坏点在 AP `SMSDispatcher`，不是网络侧未送达。

## 排查要点

| 检查项 | 判断 |
|---|---|
| 应用 API | `SmsManager.sendTextMessage()` 是否被调用，是否有 sentIntent 回调 |
| RILJ | 是否出现 `SEND_SMS` 打印；没有则先查 AP |
| 短码分类 | 是否进入 `EVENT_CONFIRM_SEND_TO_POSSIBLE_PREMIUM_SHORT_CODE` 或 `EVENT_CONFIRM_SEND_TO_PREMIUM_SHORT_CODE` |
| 本地修改 | 是否硬编码短码白名单、跳过确认弹框或改过 `SMSDispatcher` |
| 异常 | 是否有 phone 进程 `ClassCastException`、`SecurityException` 或 permission deny |

## 处理建议

- 短码短信失败先分层：应用调用、AP SMSDispatcher、RILJ `SEND_SMS`、modem CP-DATA/RP-DATA、网络响应。
- 如果没有 RILJ `SEND_SMS`，不要把问题推到 SMSC 或运营商网络。
- 本地跳过 premium short code 确认时，应保持原生消息对象类型和分支语义，避免把单个 `SmsTracker` 强转成数组。
- 记录应用包名、目标短码、权限状态、AP crash、RILJ 是否下发，以及 modem 是否出现 SMS submit。

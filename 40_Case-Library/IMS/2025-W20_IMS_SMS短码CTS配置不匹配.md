---
quality: curated
doc_type: case
domain: IMS
rat: LTE
feature: SMS Short Code
platform: Android
layer: Framework/Telephony
symptom: "CTS 短码测试失败，伊朗号码 700791 预期 FREE_SHORT_CODE，实际识别为 POSSIBLE_PREMIUM_SHORT_CODE"
cause: "项目 `sms_short_codes.xml` 与最新 CTS 测试用例不匹配"
source_log: "internal weekly technical case"
first_bad_point: "`SmsUsageMonitorShortCodeTest#testSmsShortCodeDestination` 报 expected:<1> but was:<3>"
confidence: medium
status: summarized
---

# SMS短码CTS配置不匹配

## 场景

`CtsTelephonyTestCases` 中短码分类测试失败：

```text
android.telephony.cts.SmsUsageMonitorShortCodeTest#testSmsShortCodeDestination
country: ir number: 700791 expected:<1> but was:<3>
```

## 分类值

| 值 | 含义 |
|---|---|
| `0` | `SMS_CATEGORY_NOT_SHORT_CODE` |
| `1` | `SMS_CATEGORY_FREE_SHORT_CODE` |
| `2` | `SMS_CATEGORY_STANDARD_SHORT_CODE` |
| `3` | `SMS_CATEGORY_POSSIBLE_PREMIUM_SHORT_CODE` |
| `4` | `SMS_CATEGORY_PREMIUM_SHORT_CODE` |

## 定位过程

| 步骤 | 证据 | 判断 |
|---|---|---|
| 看失败项 | `expected:<1> but was:<3>` | 同一号码短码分类不一致 |
| 查项目配置 | `frameworks/base/core/res/res/xml/sms_short_codes.xml` | 项目短码规则可能旧 |
| 对比 AOSP | 对比最新 Google 源码中 `ir` 的规则 | CTS 和本地 XML 版本需要匹配 |
| 复测 | 使用最新 CTS/PAB 工具复测 | 排除工具包过旧导致的误判 |

## 沉淀规则

短码 CTS 失败先不要改业务逻辑。先确认 `sms_short_codes.xml` 和当前 CTS 包是否同源；配置无更新时，再用最新测试包复测。

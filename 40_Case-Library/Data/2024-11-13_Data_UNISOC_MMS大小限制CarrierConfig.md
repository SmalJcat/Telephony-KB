---
quality: curated
doc_type: case
domain: Data
rat: LTE/NR
feature: MMS size limit
platform: UNISOC
layer: Framework/CarrierConfig/MMS
symptom: "客户要求 MMS size limit 调整为 600KB"
cause: "AOSP 默认 KEY_MMS_MAX_MESSAGE_SIZE_INT 为 300 * 1024，需要通过 CarrierConfig 按运营商覆盖"
project: "GH6573 Android V"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01427933 search summary"
first_bad_point: "CarrierConfig 未按目标 MCC/MNC 覆盖 KEY_MMS_MAX_MESSAGE_SIZE_INT"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - mms
  - carrierconfig
---

# MMS size limit 调整为 600KB

## 用户现象

客户要求 MMS 大小限制为 600KB，但当前平台默认限制为 300KB 左右。

## 结论

该类问题应优先按 CarrierConfig 配置处理。搜索摘要显示，当前代码默认 `KEY_MMS_MAX_MESSAGE_SIZE_INT` 为 `300 * 1024`，若目标运营商要求 600KB，需要在 `vendor_ex.xml` 或对应运营商 CarrierConfig XML 中按 MCC/MNC 覆盖。

这个 case 的关键边界是：MMS size limit 是 AP/MMS 配置限制，不等同于 MMS APN、MMSC、proxy 或网络侧发送失败。普通 MMS 发送失败仍应先确认 APN/PDP/MMSC；只有“附件大小被 UI 或 MMS service 限制”才优先查 `maxMessageSize`。

## 关键配置

```text
CarrierConfigManager.KEY_MMS_MAX_MESSAGE_SIZE_INT
```

示意：

```xml
<carrier_config mcc="xxx" mnc="xx">
    <int name="maxMessageSize" value="614400" />
</carrier_config>
```

`614400` 是 `600 * 1024` bytes。实际 XML key 名和加载路径需按当前 Android 基线确认，并用运行时 `dumpsys carrier_config` 证明生效。

## 排查路径

| 步骤 | 检查项 |
|---|---|
| 1 | 确认需求单位是 600KB 还是 600KiB |
| 2 | 检查对应 MCC/MNC 的 CarrierConfig 文件 |
| 3 | `adb shell dumpsys carrier_config | grep -i mms` 确认运行时值 |
| 4 | 发送接近边界大小的 MMS 做实际验证 |

## 定位口径

| 判断点 | 结论 |
|---|---|
| UI 选择附件时即提示超过大小 | 优先查 `maxMessageSize` / MMS service 限制 |
| 发送阶段 PDP/HTTP 失败 | 转 APN / MMSC / proxy / DNS / 网络侧排查 |
| 需求值等于默认值 | 不需要冗余覆盖，除非运营商要求显式配置 |
| 只改 `CarrierConfigManager.java` 默认值 | 风险较大，会影响非目标运营商 |
| 运营商 XML 覆盖后未生效 | 查 MCC/MNC / carrier id / specific carrier id / `vendor_ex.xml` 覆盖顺序 |

## 处理建议

- 不要只改 `CarrierConfigManager.java` 默认值，优先做运营商维度覆盖。
- 若使用 `vendor_ex.xml`，确认其加载优先级会覆盖 assets 中同名配置。
- 变更后需要验证发送、接收、压缩策略和运营商侧限制。

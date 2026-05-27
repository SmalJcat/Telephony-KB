---
quality: curated
doc_type: case
domain: Data
rat: LTE/NR
feature: APN display / xcap
platform: UNISOC
layer: Framework/Telephony/CarrierConfig/APN
symptom: "在 APN type 中添加 xcap 后，设置中的 APN 类型不显示"
cause: "UNISOC 默认配置中存在 APN type 隐藏列表，xcap 被 KEY_HIDE_APN_TYPE_STRING_ARRAY 相关逻辑过滤"
project: "GH6591"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01052197 search summary"
first_bad_point: "ApnSettings/ApnEditor 显示 APN type 前被 CarrierConfig 隐藏列表过滤"
confidence: high
status: summarized
tags:
  - cqweb
  - apn
  - xcap
  - carrierconfig
---

# APN xcap 类型被隐藏

## 用户现象

在 APN 的 `type` 中添加 `xcap` 后，设置菜单中仍不显示该类型。

## 结论

处理点在 UNISOC 私有 CarrierConfig 默认值：`UniCarrierConfigManager.java` 中的 `KEY_HIDE_APN_TYPE_STRING_ARRAY` 会影响 APN type 的显示。若 `xcap` 被放在隐藏列表里，即使 APN XML 和 TelephonyProvider 数据库都已包含 `xcap`，Settings 中也可能不展示。

这个 case 的关键边界是：`xcap` 不显示不等于 XCAP/UT 业务不可用。显示问题看 APN UI / CarrierConfig；业务失败还要继续看 XCAP APN、URL/AUID、GBA/BSF 和 HTTP 结果。

## 关键证据

```text
CQWeb SPCSS01052197:
在 apn type 中添加 xcap 类型，发现不显示。
修改:
vendor/sprd/platform/frameworks/uniframework/base/telephony/java/android/telephony/UniCarrierConfigManager.java
sDefaults.putStringArray(KEY_HIDE_APN_TYPE...)
```

## 排查路径

| 步骤 | 检查项 |
|---|---|
| 1 | 确认 `apns-conf_*.xml` 中 APN `type` 已包含 `xcap` |
| 2 | 拉取 telephony provider 数据库，确认 APN 已写入 |
| 3 | `adb shell dumpsys carrier_config` 检查 APN type 隐藏列表 |
| 4 | 检查 `UniCarrierConfigManager` 默认值和运营商覆盖配置 |

## 定位口径

| 判断点 | 结论 |
|---|---|
| XML 有 `xcap`，DB 也有 `xcap`，Settings 不显示 | 优先查隐藏列表，不继续怀疑 APN 导入 |
| Settings 不显示，但 UT/XCAP 可用 | 只是 UI 可见性问题 |
| Settings 显示正常，但 XCAP HTTP 失败 | 转补充业务 / XCAP URL / AUID / GBA 排查 |
| 修改默认隐藏列表 | 需要确认是否影响所有运营商，优先做运营商维度覆盖 |

## 处理建议

- 如果需求是让 `xcap` 在 APN 编辑/展示界面可见，需从隐藏列表中移除 `xcap`。
- 修改后同时验证 APN 数据库、Settings 显示和 UT/XCAP 业务是否仍能正常建链。
- 仅修改 APN XML 不一定生效；显示逻辑还受 CarrierConfig 控制。

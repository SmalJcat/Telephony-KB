---
quality: curated
doc_type: case
domain: Data
rat: LTE/NR
feature: APN type display
platform: UNISOC
layer: Framework/Settings/APN
symptom: "APN XML 中配置 type=wap，Settings APN type 一栏显示为空"
cause: "Android 原生 APN type 没有 wap 类型定义，非标准类型不会像 default/mms/supl 等标准类型一样在 APN type 列表中展示"
project: "GH6772"
chipset: "UMS9230E"
source_log: "CQWeb SPCSS01460052"
first_bad_point: "APN editor/display 枚举标准 APN type 时无法匹配 wap"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - data
  - apn
  - apn-type
---

# APN `type=wap` 显示为空

## 用户现象

在 `apns-conf_8_v3.xml` 新增：

```xml
<apn carrier="Robi-WAP"
     mcc="470"
     mnc="02"
     apn="wap"
     type="wap"
     mmsproxy="10.16.18.77"
     mmsport="9028" />
```

Settings 中 APN type 一栏显示为空，APN type 列表也不存在 `wap`。

## 结论

这是预期行为：Android 原生 APN type 中没有 `wap` 这种类型定义，因此无法按 `default`、`mms`、`supl` 等标准类型显示。

## 排查要点

| 检查项 | 判断 |
|---|---|
| APN XML | 确认 `apn` 接入点名称和 `type` 字段不要混淆 |
| 标准类型 | Settings APN type 列表只展示系统支持的枚举类型 |
| 业务影响 | 若业务实际需要 WAP 接入，应确认是 APN 名称为 `wap`，还是 type 需要映射到 `default/mms` 等标准能力 |

## 处理建议

- 不建议新增非标准 APN type 并期待 Settings 默认显示。
- 若运营商资料写 `wap`，先确认它是 APN 名称、profile 名称还是业务类型。
- 需要数据/MMS能力时，应按 Android 支持的 `default`、`mms`、`supl`、`dun`、`ims`、`xcap` 等类型映射。

---
quality: curated
doc_type: case
domain: Data
rat: 2G/3G/LTE
feature: MMS / APN / PDP context
platform: UNISOC
layer: RTOS MMS / PDP / APN config
symptom: "MMS 发送失败，界面提示 Send failed, user not found"
cause: "彩信发送时激活的 PDP 使用了错误 APN，MMS HTTP POST 阶段 address unresolved"
project: "GX1961_EU"
chipset: "UMS9117-L"
source_log: "CQWeb SPCSS01232418"
first_bad_point: "MMIAPIPDP_Active 使用的 APN 与目标 MCC/MNC 的 MMS APN 配置不匹配"
confidence: medium
status: summarized
tags:
  - cqweb
  - data
  - mms
  - apn
  - pdp
---

# MMS 发送失败：彩信 PDP 使用错误 APN

## 用户现象

发送 MMS 到任意号码失败，界面提示：

```text
Send failed, user not found
```

MMS 一直保持未发送状态。

## 结论

从历史 CQ 日志看，第一坏点不是收件人号码，也不是短信中心，而是 MMS 发送时选择的 APN/PDP 不对。MMS 使用了 `hos` 这个 APN 激活 PDP，但 PDP info 显示目标为 internet APN，随后 MMS HTTP POST 阶段地址解析失败。

## 关键证据

```text
MMIAPIPDP_Active: priority:3, app_handler:0x6, apn:hos
RequestPdpId: pdp_id=1, setting_item_ptr=hos,
  pdp_info=internet.telekom.mnc030.mcc216.gprs.
MMS_PARSE: MmsLibHttpPostCnf, address unresolved!
MMS_PARSE: SendRecvFail, send mms error!
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| APN 匹配 | 先确认目标 MCC/MNC 下 MMS APN 是否配置正确 |
| APN type | 彩信 APN 必须包含 `type=mms`，不要只看 `default` 数据 APN |
| PDP 激活 | 看 `MMIAPIPDP_Active` / `RequestPdpId` 使用的 APN 名称和 profile |
| HTTP 阶段 | `address unresolved` 常见于 MMSC/proxy/FQDN/APN 路由不对 |
| UI 报错 | `user not found` 是上层提示，不应直接当成号码或联系人问题 |

## 处理建议

- MMS 发送失败时先抓 APN 数据库、MMS 设置、PDP 激活日志和网络抓包。
- 对齐运营商资料中的 `mmsc`、`mmsproxy`、`mmsport`、`apn`、`type=mms`。
- 如果同一张卡普通数据可用但彩信失败，优先查 MMS APN 是否被单独选错。
- 若修改 APN 后恢复，需要把修复点沉淀到 `apns-conf` 或对应项目/运营商配置，不要只在 UI 里临时改。

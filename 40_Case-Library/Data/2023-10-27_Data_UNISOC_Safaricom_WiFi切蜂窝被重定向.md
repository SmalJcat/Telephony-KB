---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: WiFi to cellular / NetworkMonitor / captive portal
platform: UNISOC
layer: AP/NetworkMonitor/Network
symptom: "断开 Wi-Fi 切到移动数据后看似无网络，进出飞行模式后恢复"
cause: "蜂窝 data call 已连接，APN 未变化；连通性检测被运营商重定向到 Safaricom 页面，失败侧还伴随 HTTPS 超时，第一坏点在运营商网关/门户或网络侧"
operator: "Safaricom 63902"
project: "A665L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01246382"
first_bad_point: "ConnectivityService validation failed with redirect to safaricom.zerod.live；APN 配置成功/失败前后无差异"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - data
  - networkmonitor
  - captive-portal
  - wifi-switch
---

# Safaricom Wi-Fi切蜂窝被重定向

## 用户现象

断开 Wi-Fi 后切到移动数据，UI 看起来仍然不能访问网络；关闭再打开数据仍失败，进出飞行模式后恢复。

## 结论

data call 已经从 `CONNECTING` 到 `CONNECTED`，APN 配置前后没有变化。失败侧 `NetworkMonitor` HTTPS 探测超时，并出现运营商网址重定向；这类问题不能仅凭“飞行模式恢复”判定为 AP 或 APN 问题，优先要求同卡对比和运营商网关/门户确认。

## 关键时间线

```text
09:03:36 WIFI CONNECTED -> DISCONNECTED
09:03:37 DNC onDataEnabledChanged enabled=true
09:03:37 CELLULAR CONNECTING -> CONNECTED
09:03:38 validation failed with redirect to http://safaricom.zerod.live/?c=77
09:03:48 PROBE_HTTPS read timeout

09:04:35 重新开关数据后 CELLULAR CONNECTED
09:04:35 validation failed with same redirect
09:04:45~09:04:49 PROBE_HTTPS read timeout

09:05:35 进出飞行模式
09:05:39 CELLULAR CONNECTED
09:05:40 HTTP 204 返回，HTTPS 后续 ret=204
```

## 关键判断

| 证据 | 结论 |
|---|---|
| `APN Setting: Safaricom ... default` | APN 被选中并用于 data call |
| `EVENT_NETWORK_INFO_CHANGED ... CONNECTED` | AP 侧蜂窝网络已连接 |
| `validation failed with redirect` | 系统判定网络不可用的直接原因是连通性检测被重定向 |
| 失败/成功 APN 配置无差异 | 不支持直接归因为 APN 表错误 |
| 飞行模式后恢复 | 只能说明重建无线/数据链路后网络恢复，不能单独证明 modem/AP 修复了问题 |

## 排查要点

- 抓 `dumpsys connectivity`，确认当前默认网络、validation 状态和 portal URL。
- 同步保存 AP log、radio log、netlog；netlog 里看 HTTP/HTTPS 是否被重定向或超时。
- 同卡同地点用对比机复现，确认运营商是否有零流量门户、欠费门户、套餐门户或企业网关策略。
- 若 APN、IP、DNS、路由都一致，结论要收敛到运营商网络或门户策略，避免扩大为平台切网缺陷。

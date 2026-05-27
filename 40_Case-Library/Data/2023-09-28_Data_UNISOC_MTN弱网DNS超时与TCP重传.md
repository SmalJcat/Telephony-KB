---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: DNS / NetworkMonitor / weak coverage
platform: UNISOC
layer: AP/Modem/Network
symptom: "MTN 网络已注册 4G，但移动数据很慢"
cause: "数据连接已建立，DNS 探测超时、TCP 重传明显，同时 LTE dbm 约 -106~-108、SNR 为负，第一坏点更接近弱覆盖/网络质量"
operator: "MTN"
project: "A665L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01238438"
first_bad_point: "NetworkMonitor PROBE_DNS 多域名 timeout；netlog 可见 DNS/TCP 流量但存在响应迟滞和重传"
confidence: medium
status: summarized
tags:
  - cqweb
  - data
  - dns
  - weak-signal
  - networkmonitor
---

# MTN弱网DNS超时与TCP重传

## 用户现象

设备已注册 4G 并打开移动数据，但网页和业务访问很慢。

## 结论

第一坏点不在 LTE 注册，也不在 `SETUP_DATA_CALL` 建链。数据承载已经建立并分配了 IP/DNS，后续 `NetworkMonitor` 连通性检测出现 DNS timeout，抓包中同时能看到 DNS/TCP 交互和 TCP 重传。结合现场 LTE 信号约 `-106~-108 dBm`、SNR 为负，优先按弱覆盖或运营商网络质量处理。

## 关键证据

```text
SETUP_DATA_CALL cause=NONE, ifname=seth_lte0
addresses=[10.14.170.185/32]
dnses=[10.109.7.166, 10.199.231.17]

PROBE_DNS connectivitycheck.gstatic.com 301ms FAIL Timeout
PROBE_DNS www.googleapis.cn 302ms FAIL Timeout
PROBE_DNS www.google.cn 304ms FAIL Timeout
PROBE_DNS connectivitycheck.unisoc.com 307ms FAIL Timeout

TranCellSignalStrengthImpl: [LTE] dbm: -108 / -107 / -106
```

netlog 中可见 DNS query 和 TCP SYN/ACK/重传，说明 AP 到数据面的路径不是完全断掉，而是时延、丢包或网络侧响应质量异常。

## 排查要点

| 检查项 | 判断 |
|---|---|
| Data call | `cause=NONE`、IP/DNS/ifname 已下发时，不要继续卡在 APN 建链 |
| NetworkMonitor | DNS 失败和 HTTP/HTTPS 慢返回要分开看 |
| netlog | 看 DNS 是否有响应、TCP 是否重传、上下行哪个方向先异常 |
| RF 条件 | RSRP/RSRQ/SINR/dbm 低时，先做同地点同卡对比 |
| 复测方式 | 交换 SIM、交换位置、锁同 band/小区，避免把现场弱覆盖误判为 AP bug |

## 沉淀规则

`No internet`、网速慢、视频卡顿这类问题，只有在 data call 未建立或 APN 字段明显错误时才先归 APN。若 data call 成功，应转到 DNS/TCP/RF/运营商网络质量链路继续定位。

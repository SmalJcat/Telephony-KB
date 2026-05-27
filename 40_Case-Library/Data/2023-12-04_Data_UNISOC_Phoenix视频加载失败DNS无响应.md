---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: DNS / video access / NetworkMonitor
platform: UNISOC
layer: AP/Modem/Network
symptom: "Phoenix 视频播放中无法继续加载，重启后恢复"
cause: "异常时间段 NetworkMonitor 多域名 DNS timeout，HTTP/HTTPS 因 UnknownHostException 失败；AP 侧可见 DNS/SYN 上行，CP 侧有组包但下行除 ACK 外缺少有效数据"
operator: "field after-sales"
project: "A665L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01265370"
first_bad_point: "14:19~14:20 DNS 解析无响应，随后 CELLULAR validation failed"
confidence: medium
status: summarized
tags:
  - cqweb
  - data
  - dns
  - networkmonitor
  - video
---

# Phoenix视频加载失败DNS无响应

## 用户现象

售后反馈视频播放过程中突然无法继续加载，重启手机后恢复。

## 结论

异常窗口内 AP 侧连通性检测失败，直接证据是多个 DNS 探测 6 秒超时，随后 HTTP/HTTPS 因域名无法解析失败。沟通记录中进一步确认：异常时间段 AP 侧的 SYN/DNS 数据包送到 CP 侧后有组包，但数据面下行除 ACK 包外缺少有效数据。此类问题应按 Data DNS/链路方向继续分层，不应归到注册流程。

## 关键证据

```text
14:19:21 PROBE_DNS www.googleapis.cn 6013ms FAIL Timeout
14:19:21 PROBE_DNS connectivitycheck.gstatic.com 6013ms FAIL Timeout
14:19:21 PROBE_DNS www.google.cn 6018ms FAIL Timeout
14:19:31 PROBE_HTTPS UnknownHostException
14:19:35 PROBE_HTTP UnknownHostException
14:19:35 ConnectivityService: [CELLULAR] validation failed
```

后续分析口径：

```text
异常时间段内，AP侧的SYN/DNS等数据包送到CP侧后有进行组包，
但数据面下行除ACK包外无其他数据接收。
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| DNS timeout | 先确认 query 是否发出、server 是否响应 |
| UnknownHostException | 通常是 DNS 失败后的结果，不是独立根因 |
| CP 组包 | 能证明 AP 到 modem 的上行路径存在，不代表网络下行正常 |
| 下行有效数据 | 下行只有 ACK 没有 payload 时，继续看网络侧、RLC/PDCP、弱场和局点 |
| 重启恢复 | 只能作为恢复条件记录，不能单独作为软件根因 |

## 最小证据包

- AP log：`NetworkMonitor`、`ConnectivityService`、应用访问失败时间点。
- radio log：`SETUP_DATA_CALL`、IP/DNS、data call list。
- modem log：异常窗口内数据面上下行、RLC/PDCP、无线质量。
- netlog/pcap：DNS query/response、TCP 重传、上下行方向。

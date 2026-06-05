---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: DNS / connectivity check / internet access
platform: UNISOC
layer: AP/NetworkMonitor/Netlog
symptom: "India 场测已注册 4G，开启数据后显示 No internet connection"
cause: "问题时间段 DNS query 无响应并伴随 TCP 重传，第一坏点在注册后的数据链路/DNS 侧，不在 LTE 注册流程"
operator: "India field issue"
project: "KN3"
chipset: "UMS9230E"
source_log: "CQWeb SPCSS01607450"
first_bad_point: "NetworkMonitor PROBE_DNS 多域名 6s timeout，netlog 中 DNS query 发出后无响应"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - data
  - dns
  - networkmonitor
  - netlog
---

# India 注册 4G 后 DNS 超时无法上网

## 用户现象

设备在印度场测中能够注册 4G，但开启数据连接后系统显示 `No internet connection`。同环境下对比机可以正常访问网络。

## 结论

第一坏点在注册后的数据可用性检查：AP 侧 `NetworkMonitor` 对多个域名的 DNS 探测超时，netlog 中能看到 DNS query 发出但无响应，并伴随 TCP 重传。此类问题应归到 Data，而不是 LTE 注册失败。

## 关键证据

```text
NetworkMonitor:
PROBE_DNS connectivitycheck.gstatic.com 6018ms FAIL Timeout
PROBE_DNS www.google.cn 6020ms FAIL Timeout
PROBE_DNS connectivitycheck.unisoc.com 6023ms FAIL Timeout

Netlog:
100.84.52.77 -> 117.96.122.100 DNS query
问题时间段存在 DNS 解析无响应和 TCP 重传
```

对比机在相近时间点 DNS 能正常返回，例如 `connectivitycheck.unisoc.com` 可解析出 IPv6/IPv4 地址。

## 排查要点

| 检查项 | 判断 |
|---|---|
| 注册状态 | `in service` 只能证明入网成功，不能证明数据可用 |
| data call | 先确认 IP、ifname、DNS server 是否下发 |
| NetworkMonitor | `PROBE_DNS`、`PROBE_HTTP/HTTPS` 是 AP 判断网络可用性的关键证据 |
| netlog | DNS query 是否发出、DNS server 是否响应、是否 TCP retransmission |
| 对比机 | 同卡/同地点/同 DNS server 对比，避免误判运营商局点问题 |

## 处理建议

- 数据不可用时，最小证据包要包含 AP log、radio log、netlog/pcap 和 `dumpsys connectivity`。
- 若 DNS 无响应，先确认 DNS server 来源、路由、APN protocol、IPv4/IPv6、运营商网络限制。
- 不要把 `No internet connection` 直接归入注册失败；应按 Data DNS/TCP 流程处理。

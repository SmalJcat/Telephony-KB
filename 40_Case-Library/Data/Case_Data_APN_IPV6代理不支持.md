---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: APN/Data
platform: MTK
layer: AP/Modem/Network
symptom: "APN 协议从 IPv4 改为 IPv6 后，数据连接建立但无法上网"
cause: "项目 APN 配置了 proxy，代理服务器不支持 IPv6；手动新建无 proxy 的 IPv6 APN 可上网"
source_log: "internal technical case"
first_bad_point: "IPv6-only APN 下 TCP SYN 访问由 proxy 派生的 NAT64 地址无响应，删除 proxy 后恢复"
confidence: medium
status: summarized
search_tier: case_summary
---

# APN IPv6代理不支持

## 场景

运营商要求将项目 APN 协议从 IPv4 改成 IPv6。修改后 `SETUP_DATA_CALL` 能建立数据连接，但浏览器或业务访问不可用。

## 定位过程

| 步骤 | 证据 | 判断 |
|---|---|---|
| 确认网络能力 | 同一 SIM 手动新建 IPv6 APN 可以上网 | 当地网络支持 IPv6，不能直接归因为运营商不支持 |
| 对比项目 APN | 项目 APN 比手动 APN 多 proxy 配置 | 继续看代理、DNS、TCP |
| 看 netlog | IPv6-only 场景出现 CLAT/NAT64 相关地址，TCP SYN 无响应 | 数据连接成功，但数据面被 proxy 卡住 |
| 删除 proxy | 无 proxy 的 IPv6 APN 可正常访问 | 根因落在 proxy IPv6 兼容性 |

## 关键字段

| 字段 | 检查点 |
|---|---|
| `protocol` / `roaming_protocol` | 是否改为 `IPV6` 或 `IPV4V6`，是否与网络能力一致 |
| `proxy` / `port` | IPv6-only APN 下代理是否支持 IPv6 |
| DNS | `dns_server_ipv4v6_priority`、DNS query 是否返回可用地址 |
| TCP | 是否有 SYN 重传、三次握手失败、PUT/GET timeout |

## 沉淀规则

连接成功不等于数据可用。IPv6-only APN 问题要先用“手动 APN 是否可用”切开网络能力和项目配置，再对比 proxy、DNS、TCP。手动 APN 可用而项目 APN 不可用时，优先查 APN 表差异。

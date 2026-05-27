---
quality: curated
doc_type: case
domain: Data
rat: LTE/NR/GSM/WCDMA
feature: Fast Return to LTE/Throughput
platform: MTK/UNISOC
layer: AP/Modem/RAN
symptom: "终端掉到 2G/3G 后回 LTE 慢，或吞吐量 KPI 与参考机差异大"
cause: "网络未配置 LTE 邻区、连接态无法重选、平台快速回 LTE 策略未开启或测试条件未对齐"
source_log: "internal project summary"
first_bad_point: "2/3G 场景下无 LTE 邻区或无回 LTE 触发；吞吐量场景下 DUT/REF 小区、能力、测试手法未统一"
confidence: medium
status: summarized
---

# 快速回4G与吞吐量KPI

## 快速回4G

掉到 2G/3G 后回 LTE 慢，常见不是单一 AP 问题：

| 场景 | 第一检查点 |
|---|---|
| 2G idle 无法回 LTE | SI2quater 是否配置 LTE 邻区 |
| 3G idle 无法回 LTE | SIB19 是否配置 LTE 邻区 |
| 2/3G 连接态无法回 LTE | 是否有数据传输导致不能重选，网络是否下发重定向/测量 |
| UNISOC 客制回 LTE | `AT+SPCOPSEX` 参数、手动选网保持开关 |
| MTK 快速回 LTE | 背景搜、blind 4G、`AT+ERETLTE`、SBP 和阈值 |

UNISOC 客制回 LTE 的通用 AT 参数口径见 [[Data业务流程#吞吐量分析流程|快速回4G策略]]。本 case 只记录项目结论：手动选网保持开启时，指定 PLMN 不存在可能导致长期无网，所以必须同步记录对应 NV/配置。

## 吞吐量KPI

吞吐量对比前先确认测试有效：

| 项 | 要求 |
|---|---|
| 测试次数 | 静态交替至少 10 次，动态交替至少 20 次 |
| SIM/位置 | 中途交换 SIM 卡和位置 |
| 版本/状态 | user 版本，电量大于 60%，关闭 Wi-Fi/蓝牙 |
| 小区 | DUT/REF 驻留相同小区，RSRP 差异尽量小于 5 dB |
| 软件 | Speedtest 版本、server、单线程/多线程一致 |
| Log | modem log、netlog 容量足够，netlog packet 大小建议限制到 128B |

## Wireshark分段口径

| 目标 | 方法 |
|---|---|
| 终端 IP | 测速软件、默认承载 IP、Wireshark 会话统计 |
| server IP | `dns.count.answers > 0`、`dns.qry.name contains "<server>"`、TCP 会话字节数 |
| 下行开始 | 下行阶段最小 `tcp.stream` 的三次握手时间 |
| 下行结束 | 下行 stream 最后一批 ACK |
| 上行开始 | 上行阶段最小 `tcp.stream` 的三次握手时间 |
| 上行结束 | 上行 stream 最后一批 ACK |

## 沉淀规则

快速回 4G 要先区分“网络没有邻区”和“终端策略没触发”。吞吐量问题要先证明测试条件公平，再谈 CA/DC、BLER、MCS、CQI、调度和 RF。

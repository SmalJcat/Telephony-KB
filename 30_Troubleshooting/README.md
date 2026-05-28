---
doc_type: index
domain: Meta
status: active
quality: imported_reference
---

# 30_Troubleshooting

## 使用方法

- 先按现象进入专项流程，再用业务流程确认正常链路，最后用案例库对照历史第一坏点。
- 空正文占位已删除，只保留已有分析内容和可复用截图。

这里按“用户看到的现象”组织定位顺序。它不替代流程文档，也不替代 case；作用是让后续遇到问题时能快速决定先查哪一层。

## 入口

| 文档 | 用途 |
|---|---|
| [[常见问题速查流程]] | 无服务、注册失败、数据失败、IMS 失败、通话失败、SIM 不识别、modem 异常的第一轮判断 |
| [[问题定位流程]] | 通用问题定位方法和证据组织方式 |
| [[证据缺口补证总览]] | 缺 log / 缺对比证据时，按问题域准备下次复现最小证据包 |
| [[注册失败排障流程]] | LTE/NR 注册失败第一轮分诊、最小证据包和结论边界 |
| [[数据业务失败排障流程]] | default / IMS / MMS / XCAP 等数据链路失败分诊 |
| [[通话失败排障流程]] | CS、VoLTE、ECC、USSD/SS、掉话的第一轮判断 |
| [[补充业务失败排障流程]] | Call Forwarding、Call Barring、USSD、UT/XCAP 失败或回落分诊 |
| [[SIM与运营商名排障流程]] | SIM 不识别、EF 读取和运营商名称显示异常分诊 |
| [[Modem稳定性排障流程]] | modem assert、blocked、radio unavailable、NV/产物相关稳定性分诊 |
| [[无线信号与搜网失败排查]] | RF/RACH/弱场/频段能力导致的无服务、空三角、搜网失败、数据慢分诊 |
| [[专项问题分析流程补充]] | 旧 Outline/CQ 迁入专项分析流程索引，不作为第一定位入口 |

## 放置规则

| 内容 | 放置位置 |
|---|---|
| “无服务先看 SIM 还是 PLMN 还是 RRC” | `30_Troubleshooting` |
| “LTE Attach 正常信令顺序” | `20_Service-Flows` |
| “某个项目 log 证明网络 reject cause 7” | `40_Case-Library` |
| “MTK 代码在哪解析 +EGREG” | `50_Platform-Code` |
| “APN XML 字段怎么配” | `60_Configuration` |

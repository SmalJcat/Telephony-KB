---
doc_type: index
domain: Meta
status: active
quality: curated
search_tier: main_entry
---

# SMS Cases

## 快速定位

- 先按现象、第一坏点、平台、配置项四个维度归类，再回看截图和关键 log。
- 复用案例时不要只套结论，需要确认版本、运营商、卡类型、开关默认值和最终生效配置。
- 案例里的图片已本地化，适合直接在 HTML 中对照字段和流程位置。

SMS / MMS / SMS over IMS 历史问题案例。

> 图片已保存为本地附件；非图片附件仍保留原 Outline 链接作为资料索引。

## 已整理案例

| Case | 场景 | 用途 |
|---|---|---|
| [[2024-03-11_SMS_UNISOC_FDN发送短信需同时放行SMSC和收件人]] | FDN 下给列表中联系人发短信仍失败 | 区分收件人 FDN 与 SMSC FDN 双重校验 |
| [[2023-01-24_SMS_UNISOC_CB_Full版本信道配置受Mainline限制]] | CB 信道配置后测试不通过 | 区分 full/Mainline 限制和 MCC/MNC 测试条件 |
| [[2025-03-22_SMS_UNISOC_短码发送未到RILJ_SEND_SMS]] | 应用发短码短信失败，RILJ 无 `SEND_SMS` | 先查 AP `SMSDispatcher` / premium short code 分支 |
| [[2026-04-12_SMS_UNISOC_CB关闭菜单仍收LTE紧急广播4370]] | 关闭 CB 菜单后仍收 LTE 紧急广播 | 区分普通 CB 开关和紧急告警底层上报 |
| [[../IMS/2025-07-29_IMS_SMS-over-IP配置缺失]] | SMS over IMS 走 SGs/CS 或无 IMS 注册 | 查 IMS 注册、SDM 域选、SMS over IP allowed 和 IMS profile |
| [[SMS问题案例补充]] | SMS 问题案例补充 | 迁入旧 Outline 中的 SMS 历史问题 |

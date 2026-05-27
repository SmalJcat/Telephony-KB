---
doc_type: case
quality: imported_reference
domain: Call
rat: IWLAN
feature: 'ECC'
platform: Mixed
layer: 'IMS/IWLAN/ECC'
symptom: 'vowifi 无法拨打电话'
cause: '当前只保留 VoWiFi ECC 复盘附件，缺少正文证据；应迁入 IMS 专项后按 IWLAN/ePDG/IMS emergency 域选补齐'
source_log: 'Old Outline knowledge base; split from 通话问题案例补充.md'
first_bad_point: '证据缺口在 VoWiFi ECC 域选与 IMS emergency 建呼链路，当前 markdown 只有 PPT 附件'
confidence: low
status: summarized_with_log_gap
tags:
  - imported
  - split_from_bucket
  - vowifi
  - ecc
  - ims-deferred
---

# vowifi 无法拨打电话

## 阅读入口

本 case 从旧 Outline 案例集合拆出，目前只保留 VoWiFi ECC 复盘附件入口。正文证据不足，后续应在 IMS 专项中补齐 IWLAN / ePDG / SIP emergency 链路。

## 用户现象
vowifi 无法拨打电话

## 结论

当前 markdown 只有 `Vanilla VoWiFi ECC问题复盘总结.pptx` 附件，没有足够正文证据，不能沉淀成确定 root cause。它的复用方式是作为 VoWiFi emergency 专项的资料入口，而不是放在普通 LTE 注册或 CS Call 排障中扩散。

后续 IMS 专项处理时，需要从附件中补齐：WFC 开关 / IWLAN 注册 / ePDG / IMS emergency registration / SIP INVITE / domain selection / CS retry 的完整链路。

## 关键证据

- 原始分类：一、紧急通话
- 来源：通话问题案例补充.md
- 拆分序号：4
- 附件：`attachments/outline/files/e3b69f59-0e2a-4fde-8454-de3e745d1048_Vanilla VoWiFi ECC问题复盘总结.pptx`

## 补证要求

| 证据 | 用途 |
|---|---|
| WFC / VoWiFi 开关和 CarrierConfig | 判断 AP 是否允许 VoWiFi 通话 |
| IWLAN / ePDG 注册日志 | 判断 N3GPP 接入是否建立 |
| IMS emergency capability / registration | 判断是否允许 emergency over IMS/Wi-Fi |
| SIP INVITE / SIP response | 判断建呼失败原因 |
| domain selection / retry log | 判断失败后是否回退到 LTE/CS/其它 slot |
| Wi-Fi 网络和 DNS/IPsec 证据 | 区分 Wi-Fi/ePDG 基础链路失败和通话业务失败 |

## 归属规则

- VoWiFi ECC 的“紧急号码识别、域选择入口”可在 Call/ECC 索引中保留入口。
- IMS 注册、ePDG、SIP、媒体和 WFC 能力问题应放入 IMS 专项，不混入 LTE 注册文档。

## 原始案例内容

### 案例4：vowifi 无法拨打电话

[Vanilla VoWiFi ECC问题复盘总结.pptx 1059246](..\..\attachments\outline\files\e3b69f59-0e2a-4fde-8454-de3e745d1048_Vanilla VoWiFi ECC问题复盘总结.pptx)

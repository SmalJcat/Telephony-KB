---
doc_type: reference
quality: imported_reference
domain: IMS
rat: LTE/IWLAN
feature: IMS / VoLTE / VoWiFi / XCAP
platform: MTK
layer: IMS / Operator Config / eService
symptom: 'BEEONE / ALPS 外部 IMS case 片段汇总'
cause: 'external searchable snippets; root cause varies by item'
source_log: 'eService issue_manager / external searchable snippets; collected 2026-05-27'
first_bad_point: '配置片段未拆成独立 case'
confidence: low
status: reference
external_source: https://eservice.mediatek.com/eservice-portal/issue_manager
collected: 2026-05-27
tags:
  - imported
  - external_summary
  - needs_split
---

# BEEONE / ALPS 案例汇总（外部可检索片段）

## 阅读入口

这是 IMS 外部可检索片段汇总，不作为单条 root cause 引用。后续 IMS 专项时，应按 Case ID 拆成独立 case，或者把纯配置项迁移到 IMS / CarrierConfig / XCAP 配置文档。

说明：当前在 eService 站点本体存在登录受限，我先用可公开访问的案例片段（来源与内容与 `issue_manager` 问题格式一致）先做入库，便于后续补全。

| 序号 | Case ID | 标题 | 关键点 |
|---|---|---|---|
| 1 | BEEONE-3127 | [Telecom][FR check][Spain][Digi] Implement IMS for Digi -- Emergency Call via CSFB | Emergency Call 走 CSFB，配置 `allow_ims=0 / allow_wfc=0` |
| 2 | BEEONE-3166 | [Telecom][FR check][A1MK][VDMK] IMS implementation -- Support EVS codecs | 启用 EVS codec，配置 `ua_config.evs_support` 等 |
| 3 | BEEONE-3121 | [Telecom][FR check][A1BG][IMS and LTE bands/NR bands] UE mandatory requirements -- SMS over IP | SMS over IP 启用相关 IMS 配置项与禁用白名单规则 |
| 4 | BEEONE-2960 | [UK onsite][FT][OM][3UK][VoWiFi] VoWiFi 注册偶现失败（飞行模式重启后） | 调整漫游下 Vowifi 阻止相关配置为可注册 |
| 5 | BEEONE-3278 | [Telecom][EU OM][FR check][Telekom HU][Xcap] Xcap enable even Volte off | VoLTE SIM 下无论切到2G/3G仍需 XCAP 走 PS only |
| 6 | BEEONE-2949 | [Telecom][EU OM][FR check][LCA1][VIANOVA][ITALY] How to implement VoLTE for 4G (22249) | 将 PLMN 判断为 HPLMN，保证跨网络漫游识别 |
| 7 | BEEONE-2974 | [UK onsite][FT][OM][3UK] Call waiting should be terminal based | 呼叫等待改为本地控 |
| 8 | BEEONE-3073 | [Telecom][FR check][KENA][ITALY] Xcap over VoLTE doesn't work for 22207 | 移除 22207 的 CS only 配置，恢复 XCAP over VoLTE |

关联来源：  
- `https://hntink.com/7d97f418a14bb502/eb7dc21bf61158db.html`（该页含上述案例文本片段）  
- `https://eservice.mediatek.com/eservice-portal/issue_manager`

后续可补充：若你提供 eService 登录方式，我再按你要求继续抓取 10 条以上可访问的原始 case 并拆成单条 IMS case 文件。

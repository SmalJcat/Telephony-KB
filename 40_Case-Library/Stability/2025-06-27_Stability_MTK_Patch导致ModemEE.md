---
quality: curated
doc_type: case
domain: Stability
rat: LTE/IMS
feature: Modem Patch
platform: MTK
layer: Modem/IMS
symptom: "特定会议通话重试场景触发 ModemEE"
cause: "MTK modem patch 回归，IMS call retry 过程中从 call context 取到错误 call_id"
source_log: "internal weekly technical case"
first_bad_point: "VDM 在 IMS call retry 期间访问 call_id，错误取值 255 后触发 crash"
confidence: medium
status: summarized
---

# MTK Patch导致ModemEE

## 场景

在不支持会议通话的 SIM 或网络环境下，执行会议通话并连续点击合并菜单，问题版本出现 ModemEE。

## 结论

该问题属于 modem patch 回归。MTK 侧结论是 IMS call retry 过程中从 call context 获取了错误的 `call_id`，导致 crash。后续由正式 patch 修复。

## 排查要点

| 检查项 | 说明 |
|---|---|
| 触发业务 | IMS call retry / conference call |
| 引入范围 | 只影响合入特定 P4 patch 的 GEN93 / LR12A.R3.MP modem 项目 |
| 关键字段 | `call_id=255`、VDM、IMS call retry |
| 修复方向 | 正确从 call context 获取 call_id |
| 验证方式 | 原始复现流程压力测试，确认 ModemEE 不再复现 |

## 沉淀规则

Modem patch 问题要记录 patch 包实际包含的 CR 列表，不要只记录“主申请 Patch ID”。供应商正式 patch 可能带入额外依赖 patch，真正引入问题的 CR 可能不是最初申请的那个。

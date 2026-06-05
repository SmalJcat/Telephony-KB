---
doc_type: index
domain: Meta
status: active
quality: curated
search_tier: main_entry
---

# Case Library

这里存真实问题案例。每个 case 都建议从 [[../99_Templates/Case模板|Case模板]] 复制。

## 横向索引

- [[Case横向索引|Case横向索引]]：按业务域、平台、第一坏点分类、状态和 source 反查 case。
- 该文件由 [[../70_Tools-Debug/知识库维护工具#Case横向索引|generate-case-index.ps1]] 生成，新增或修改 case 后重新生成。
- 横向索引只统计 `doc_type: case`。集合入口、外部资料片段和专题索引用 `doc_type: reference` / `doc_type: index` 保留在各域 README，不计入真实 case 数。

## 证据分层

| search_tier | 用途 | 处理口径 |
|---|---|---|
| `case_summary` | 正式 case | 有明确现象、第一坏点、关键证据和结论；HTML 搜索优先展示 |
| `supplemental` | 补充参考 | 多为旧库导入或证据链不完整，但仍有可复用字段、现象或处理方向 |
| `reference_only` | 仅回溯资料 | 低置信、缺 log、集合入口或外部片段；排障时只能作为线索，不作为最终结论 |

导入资料不要直接升级为 `case_summary`。只有补齐第一坏点、关键证据、结论边界和验证动作后，才从 `supplemental` / `reference_only` 升级。

## 分类

- [[Registration/README|Registration Cases]]
- [[Data/README|Data Cases]]
- [[IMS/README|IMS Cases]]
- [[Call/README|Call Cases]]
- [[Supplementary-Service/README|Supplementary-Service Cases]]
- [[SIM/README|SIM Cases]]
- [[SMS/README|SMS Cases]]
- [[Stability/README|Stability Cases]]
- [[Signal/README|Signal Cases]]

## 写case的最低标准

- 有明确现象。
- 有时间线。
- 有第一个异常点。
- 有关键证据。
- 有结论和置信度。
- 有下一步或修复方案。
- 有 `search_tier`，证据弱时不能标成 `case_summary`。

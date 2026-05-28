---
doc_type: index
domain: Meta
status: active
quality: curated
---

# Case Library

这里存真实问题案例。每个 case 都建议从 [[../99_Templates/Case模板|Case模板]] 复制。

## 横向索引

- [[Case横向索引|Case横向索引]]：按业务域、平台、第一坏点分类、状态和 source 反查 case。
- [案例精修清单](../00_Index/案例精修清单.md)：按 A/B/C/待合并 管理下一轮精修优先级。
- 该文件由 [[../70_Tools-Debug/知识库维护工具#Case横向索引|generate-case-index.ps1]] 生成，新增或修改 case 后重新生成。
- 横向索引只统计 `doc_type: case`。集合入口、外部资料片段和专题索引用 `doc_type: reference` / `doc_type: index` 保留在各域 README，不计入真实 case 数。

## 分类

- [[Registration/README|Registration Cases]]
- [[Data/README|Data Cases]]
- [[IMS/README|IMS Cases]]
- [[Call/README|Call Cases]]
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

---
doc_type: decision
domain: Decision
status: active
quality: curated
---

# ADR-001: 知识库采用Markdown和Case模板

## Status

Accepted

## Date

2026-05-12

## Context

通信问题定位依赖长期积累：流程、log关键字、cause code、客户定制、真实case。资料如果只散落在聊天记录、邮件、文档和压缩包中，很难复用，也不利于后续搜索。

## Decision

使用本地 Markdown 文件作为知识库核心格式，并用统一 Case 模板记录真实问题。Obsidian 作为主要浏览、搜索和双向链接工具。

## Alternatives Considered

### 只用Notion或Confluence

- 优点：适合团队共享。
- 缺点：个人本地搜索、批量编辑、版本管理不如Markdown方便；涉密log和项目资料不一定适合云端。

### 只用Word/Excel

- 优点：上手快。
- 缺点：链接、全文搜索、结构演进和版本管理较弱。

### 只保存原始log

- 优点：证据完整。
- 缺点：复用成本高，无法快速找到结论和相似case。

## Consequences

- 每个问题都应沉淀成可搜索的 Markdown case。
- 重要判断口径要写入 `90_Decisions`。
- 原始log可以另存，不建议直接塞进知识库正文。
- 知识库内容可以用 Git、压缩包或同步盘备份。


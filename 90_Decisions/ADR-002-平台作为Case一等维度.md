---
doc_type: decision
domain: Decision
status: active
quality: curated
search_tier: archived_entry
---

# ADR-002: 平台作为Case一等维度

## Status

Accepted

## Date

2026-05-12

## Context

Android通信问题虽然有共同的3GPP流程和Framework入口，但 Qualcomm、MTK、UNISOC 在 vendor RIL、IMS service、modem日志、NV/配置、工具链和客户定制位置上差异明显。同一个现象如果不记录平台，后续复用时容易误判。

## Decision

在所有 case 的 frontmatter 和基本信息中记录平台、芯片/基线、modem版本、客户定制信息。知识库仍按问题域分类，不按平台拆成三套重复目录。

## Alternatives Considered

### 按平台拆三套知识库

- 优点：平台内部资料集中。
- 缺点：LTE注册、IMS注册、Call等共性流程会大量重复，长期维护成本高。
- 结论：不采用。

### 完全不区分平台

- 优点：结构简单。
- 缺点：无法复用平台私有经验，容易把平台实现差异误判为共性问题。
- 结论：不采用。

## Consequences

- 新 case 必须填写 `platform`。
- 平台差异写在 case 的“平台差异检查”中。
- 共性流程仍维护在 `20_Service-Flows`。
- 平台工具、日志格式、客制化入口沉淀在 `50_Platform-Code` 或 `70_Tools-Debug`。


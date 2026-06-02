---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
status: active
last_updated: 2026-06-02
---

# 运营商参数备份

## 文档定位

- 本目录只保存运营商需求表整理结果，定位为 `reference_only`。
- 单个运营商页面用于回查需求来源、MCCMNC、业务域和原表字段，不直接给出平台配置方案。
- 配置落地应回到 `60_Configuration` 下 APN、ECC、CarrierConfig、NV、运营商名称等配置方法文档。


这个目录只做运营商需求表的数据保留，方便以后配置时参考。

这里不做数据库，不维护解析脚本，也不写平台配置方案。

## 文件命名

按 `运营商名_国家或地区_mccmnc.md` 保存：

| 示例 | 说明 |
|---|---|
| `Vodafone_Oman_42206.md` | Vodafone Oman，MCCMNC 42206 |
| `Ooredoo_Qatar_42701.md` | Ooredoo Qatar，MCCMNC 42701 |
| `Movistar_Uruguay_74807.md` | Movistar Uruguay，MCCMNC 74807 |

必须能从需求表里确认 MCC/MNC，才能在本目录建文件。

如果 MCC/MNC 缺失、只是从 APN/URI/FQDN 推断、或者资料是多运营商/集团级/投标问卷，没有单一明确 MCCMNC，就不要放到本目录。

## 记录原则

| 原则 | 写法 |
|---|---|
| 只保留需求 | 写运营商要求、取值、原始表位置、备注 |
| 不写配置方案 | 不写平台字段名、平台文件路径、补丁或实现细节 |
| 保留不在当前配置范围的内容 | APN、ECC、SMS、VoWiFi、运营商名等都可以作为需求备份记录 |
| 不强行解释空白 | 表格为空、N/A、默认、Not support 时原样记录 |
| 不把推断写成事实 | MCC/MNC 不明确时不建文件 |

## 每份文件结构

1. 基本信息：运营商、国家、MCC/MNC、资料来源。
2. 需求参数表：按业务域整理运营商要求。
3. 空白或待确认：只记录同一明确 MCCMNC 下的空白字段；MCC/MNC 本身待确认时不建文件。
4. 备注：版本、补充资料、容易误读的字段。

## 状态说明

| 状态 | 含义 |
|---|---|
| `requirements_backup` | 已整理成参数备份，可供后续配置参考 |
| `supplementary_source` | 补充资料，只作为同运营商参考，不覆盖主表 |

---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_record_index_v1
status: active
last_updated: 2026-06-02
---

# 运营商参数备份

## 文档定位

本目录只保存运营商需求表整理结果，定位为 `reference_only`。

这里不做数据库，不维护解析脚本，也不写平台配置方案。单个运营商页面用于回查需求来源、MCCMNC、业务域和原表字段；真正配置落地时，再回到 `60_Configuration` 下对应配置方法文档、平台默认值和目标代码/产物确认。

## 记录索引

| 运营商 | 国家/地区 | MCCMNC | 涉及范围 | 待确认状态 | 文档 |
|---|---|---|---|---|---|
| AMX / Claro Colombia | Colombia | 732101 | IMS、IMS APN、IWLAN、Emergency、SMS、SRVCC、Codec、XCAP | 暂无明确资料缺口；配置前需做平台默认值比对 | [AMX_Colombia_732101.md](AMX_Colombia_732101.md) |
| Antel | Uruguay | 74801 | SIM、APN、Emergency、VoLTE、SMS、SRVCC、UT、XCAP | VoWiFi sheet 多数取值为空，不能从 default value 推断 | [Antel_Uruguay_74801.md](Antel_Uruguay_74801.md) |
| Movistar / Telefonica Uruguay | Uruguay | 74807 | APN、MMS、IMS、VoWiFi、SMS、Emergency、UI、Voicemail | 多个 Others-IMS 字段为空，按原表未填保留 | [Movistar_Uruguay_74807.md](Movistar_Uruguay_74807.md) |
| Ooredoo Qatar | Qatar | 42701 | APN、IMS、VoLTE、Emergency、SMS、SRVCC、XCAP、Network info | 暂无明确资料缺口；网络信息不直接等同配置动作 | [Ooredoo_Qatar_42701.md](Ooredoo_Qatar_42701.md) |
| Telekom Slovenije | Slovenia | 29341 | NR、LTE、APN、MMS、VoLTE、VoWiFi、Cell broadcast | 多项为 compliant / not compliant 表述，配置前需判断是否可落地 | [Telekom_Slovenia_29341.md](Telekom_Slovenia_29341.md) |
| Telstra Australia | Australia | 50501 / 50571 / 50572 | LTE、IMS、IPv6、SIM/ECC、VoLTE、VoWiFi、Device management | MSR 多文件合并摘要，配置前需回查原 xlsx item 编号 | [Telstra_Australia_50501_50571_50572_MSR_Ver83.md](Telstra_Australia_50501_50571_50572_MSR_Ver83.md) |
| Vodafone Oman | Oman | 42206 | APN、IMS、VoLTE、ViLTE、UT、Emergency、SMS、EVS | SRVCC、GRUU、SS fallback 等字段保留原表语义，配置前需专项判断 | [Vodafone_Oman_42206.md](Vodafone_Oman_42206.md) |

## 文件命名

按 `运营商名_国家或地区_mccmnc.md` 保存。

| 示例 | 说明 |
|---|---|
| `Vodafone_Oman_42206.md` | Vodafone Oman，MCCMNC 42206 |
| `Ooredoo_Qatar_42701.md` | Ooredoo Qatar，MCCMNC 42701 |
| `Movistar_Uruguay_74807.md` | Movistar Uruguay，MCCMNC 74807 |

必须能从需求表里确认 MCC/MNC，才能在本目录建文件。如果 MCC/MNC 缺失、只是从 APN/URI/FQDN 推断、或者资料是多运营商/集团级/投标问卷且没有单一明确 MCCMNC，就不要放到本目录。

## Frontmatter

每个运营商记录统一使用以下基础字段：

```yaml
---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v1
operator: <operator name>
mccmnc: "<mccmnc>"
country: <country>
source: <source path or directory>
status: requirements_backup
last_updated: <yyyy-mm-dd>
---
```

多源资料可追加 `related_source` 或 `source_files`。`source` 路径应写真实 Windows 路径，不写 `?????`、通配符或无法回查的缺失路径。

## 页面结构

每份运营商记录按固定结构维护：

1. `阅读入口`：说明本文是需求备份，不能直接当作最终配置结论。
2. `记录说明`：说明本文只做需求备份，不做配置方案。
3. `索引信息`：运营商、国家、MCC/MNC、MCCMNC 证据、来源文件。
4. `来源文件`：仅多文件合集需要，例如 Telstra MSR。
5. `参数需求`：统一五列表，按业务域整理需求。
6. `待确认项`：记录空白、N/A、资料缺口或需要回查原表的部分；没有明确缺口也保留章节并说明配置前需平台默认值比对。
7. `维护备注`：记录版本、资料取舍和容易误读的字段。

## 参数需求表

统一使用下面的表头：

| 业务域 | 需求项 | 要求/取值 | 来源位置 | 备注 |
|---|---|---|---|---|

维护规则：

| 原则 | 写法 |
|---|---|
| 只保留需求 | 写运营商要求、取值、原始表位置、备注 |
| 不写配置方案 | 不写平台字段名、平台文件路径、补丁或实现细节 |
| 保留不在当前配置范围的内容 | APN、ECC、SMS、VoWiFi、运营商名等都可以作为需求备份记录 |
| 不强行解释空白 | 表格为空、N/A、默认、Not support 时按原表语义记录 |
| 不把推断写成事实 | MCC/MNC 不明确时不建文件；无法确认的内容放入 `待确认项` |

## 状态说明

| 状态 | 含义 |
|---|---|
| `requirements_backup` | 已整理成参数备份，可供后续配置参考 |
| `supplementary_source` | 补充资料，只作为同运营商参考，不覆盖主表 |
| `consolidated_msr` | 多个 MSR/问卷文件合并整理成一个运营商记录 |

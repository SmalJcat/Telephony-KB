---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
record_format: operator_requirement_v2
operator: Safaricom
mccmnc: "63902"
country: Kenya
source: F:\Codex\Knowledge\运营商参数归档\Generic Device Configuration _ Safaricom.xls
status: requirements_backup
last_updated: 2026-06-08
---

# Kenya Safaricom 63902

## 一页摘要

| 项目 | 内容 |
|---|---|
| 国家 | Kenya |
| 运营商 | Safaricom |
| MCCMNC | `63902` |
| MCC/MNC 证据 | 原表 `VOLTE parameters` R6 写 IMS APN MCC `639` / MNC `02`；`DATA APN setting` R11/R12 和 `MMS Settings` R11/R12 也写 MCC `639` / MNC `2`。 |
| 公网查证 | 公开 MCC/MNC 列表显示 Kenya Safaricom 使用 `639 02`，同时存在 Safaricom IoT/专用 `639 01`，本表按 `63902` 建档。 |
| 资料文件 | `F:\Codex\Knowledge\运营商参数归档\Generic Device Configuration _ Safaricom.xls` |
| 资料版本 | 原表未明确版本或未单独整理 |
| 覆盖范围 | APN、MMS、IMS/VoLTE、VoWiFi/ePDG、IKE/IPSec、Emergency、5G phone capability |
| 配置前重点 | ePDG FQDN 行疑似写成 `epdg.epc.mnc639.mcc002`，与 MCC/MNC 常规格式不一致，配置前必须回查运营商确认。 |

## 使用边界

- 本文只保存和运营商网络参数相关的需求，便于后续配置 APN、CarrierConfig、Modem NV、ECC 或排查 IMS/VoWiFi 问题时回查。
- 本文不记录载波聚合组合明细，也不记录与网络参数无关的客户定制项。
- 需求正文保留原表字段口径：`Requirement Name`、`Requirement Description`、`Requirement Value`。其中 `Requirement Value` 对应原表的运营商取值/反馈列。
- 中文只用于分区、备注和风险说明，不替代原始需求文本。
- 本文不判断目标平台默认值，也不直接给出落地配置结论；真正配置前仍需结合目标平台代码、默认值缓存、生成产物和运行时证据确认。
- 各需求表最后一列保留原 xlsx/xls 的 sheet/row，便于人工回查。

## 配置相关重点

### 身份与匹配

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| PublicURI / PrivateURI format | IMPU/IMPI format | IMPU sip:imsi@ims.mnc002.mcc639.3gppnetwork.org; IMPI imsi@ims.mnc002.mcc639.3gppnetwork.org | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VOLTE parameters R7-R8 |

### APN 与数据业务

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| IMS APN MCC/MNC | IMS APN information | MCC: 639; MNC: 02; APN: ims; APN Type: ims; APN Protocol: IPV4/IPV6; APN Roam Protocol: IPV4 | 来自 .xls 的 VOLTE parameters sheet。 | VOLTE parameters R6 |
| DATA APN | Default data APN settings | Name=Safaricom; APN=safaricom; MCC=639; MNC=2; APN type=default,supl; protocol=IPv4/IPv6; roaming=IPv4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | DATA APN setting R1-R16 |
| MMS APN | MMS settings | Name=Safaricom MMS; APN=safaricom; MMSC=http://mms.gprs.safaricom.com; proxy=proxy.safaricom.com; port=8080; MCC=639; MNC=2; type=mms | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | MMS Settings R1-R16 |

### IMS 与 VoLTE

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| IMS RAT support | Which RATs are supported for your IMS | LTE | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VOLTE parameters R5 |

### VoWiFi 与 ePDG

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| ePDG FQDN | ePDG IP address or FQDN format | epdg.epc.mnc639.mcc002.3gppnetwork.org | 疑似 MCC/MNC 顺序写反，需复核。 | VOLTE parameters R11 |
| IKE/IPSec algorithms | IKE/ESP security parameters | IKE AES128,3DESC; Integrity HMAC_SHA1_96; PRF HMAC_SHA1_96; DH GROUP_MODP_1024; ESP AES128,3DESC/HMAC_SHA1_96 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VOLTE parameters R16-R21 |
| IKE timers | NAT/DPD/lifetime/retransmit | NAT keep alive 30s; DPD 60s; IKE SA 86400s; ESP SA 86400s; rekey before expiry 180s; retransmit timeout 2s; max retransmit 4 | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | VOLTE parameters R22-R29 |

### 网络能力要求

| Requirement Name | Requirement Description | Requirement Value | 备注 | 来源 |
|---|---|---|---|---|
| 5G/LTE band summary | Generic device network capability | LTE FDD bands 3/20; 5G NR TDD n38/n40/n41/n78; 5G NR FDD n1/2/3/4/5/8/20/25/28/65; VoLTE mandatory | 按原表记录；配置前需结合平台默认值确认是否需要落地。 | 5G Phone Parameters R9-R35 |

## 原表回查索引

| Source | 本文保留内容 | 何时回查原表 |
|---|---|---|
| `F:\Codex\Knowledge\运营商参数归档\Generic Device Configuration _ Safaricom.xls` | 运营商网络参数需求、APN、IMS/VoLTE、VoWiFi/ePDG、Emergency 和网络能力摘要。 | 需要配置或核对具体平台参数前，按本文 `来源` 列回查 sheet/row。 |

## 待确认项

| 项目 | 说明 |
|---|---|
| ePDG FQDN 格式 | 原表 `VOLTE parameters` R11 写 `epdg.epc.mnc639.mcc002...`，和 IMS 域 `mnc002.mcc639` 不一致，不能直接照抄配置。 |

## 维护备注

- 这份资料是 Safaricom 的运营商网络参数备份，当前只保留网络相关内容。
- 载波聚合组合明细和非网络客户定制内容已按维护规则移除。
- 本文件不判断哪些值等于平台默认值，也不判断是否需要在 CarrierConfig、APN XML、NV 或 ECC 数据库中落地。
- 后续做平台配置时，应按业务域回查原表的 sheet/row，再结合目标平台默认值和实现路径确认。

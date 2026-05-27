---
quality: curated
doc_type: case
domain: Stability
rat: 2G/3G/LTE
feature: NVTool / RDNV / CustNV
platform: UNISOC
layer: Modem NV / NVTool
symptom: "打开 RDNV 工程不修改直接 Save Image 后，双 SIM 场景 modem 崩溃"
cause: "客户侧 CustNV 修改导致；保存前后 customer nvitem 差异需要与基线 NV 工程对比确认"
project: "GH6551L"
chipset: "SC9863A"
source_log: "CQWeb SPCSS00783213"
first_bad_point: "sharkl3_pubcp_customer_nvitem.bin 与原始/基线 NV 工程差异过大"
confidence: high
status: summarized
tags:
  - cqweb
  - stability
  - nvtool
  - rdnv
---

# RDNV 保存后双卡 Modem 崩溃与 CustNV 差异

## 结论

CQWeb `SPCSS00783213` 的最终结论是客户侧 `CustNV` 修改导致。这个案例适合沉淀为 NVTool / RDNV 排查模板：如果打开 RDNV 工程不修改直接 Save Image 后出现双卡 modem 崩溃，先比较保存前后的 `sharkl3_pubcp_customer_nvitem.bin` 和客户 NV 工程，不要直接归因工具问题。

## 现象

- 平台：UNISOC SC9863A。
- 操作：使用 Modem NVTool 打开 RDNV 工程，不修改内容直接 Save Image。
- 表现：双 SIM 场景下 modem 崩溃；同样需求用 OperatorNV 路径保存时未复现。

## 关键判断

| 证据 | 判断 |
|---|---|
| 保存前后只有少数字节差异，且为时间相关字段 | 通常不影响功能 |
| `sharkl3_pubcp_customer_nvitem.bin` 差异很大 | 继续对比客户 NV 工程和基线 NV 工程 |
| 客户 NV 工程与基线版本差异很大 | 优先排查 CustNV 修改，不应直接认定 NVTool bug |
| 只在双卡场景崩溃 | 同步检查卡槽/SIM/NV bitmask 类配置 |

## 排查步骤

1. 记录 NVTool 版本、modem base 版本、RDNV 工程路径和 Save Image 操作步骤。
2. 保存前后分别导出 `sharkl3_pubcp_customer_nvitem.bin`。
3. 二进制对比保存前后差异；若差异超出时间戳字段，继续对比 NV 工程。
4. 拿客户 NV 工程和对应 modem base 的原始 NV 工程对比。
5. 分别验证单卡、双卡、RDNV、OperatorNV 路径，确认崩溃触发条件。
6. 若涉及 Operator NV 修改，仍按文档确认应打开的工程入口，不要因为 OperatorNV 临时可用就跳过 RDNV 差异分析。

## 复用边界

这个案例不是“RDNV 一定不能保存”的结论。它说明 RDNV 保存后出现崩溃时，必须用保存前后 bin 差异和基线 NV 工程差异来定位第一坏点。

## 来源

- CQWeb：`SPCSS00783213`

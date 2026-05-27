---
doc_type: case
quality: imported_reference
domain: Registration
rat: Mixed
feature: 'CellSelection'
platform: Mixed
layer: 'Mixed'
symptom: 'CM52没有切到吞吐量更高的小区'
cause: '原始资料只有现象，缺少测量、重选、负载或策略证据，暂不能判断为何优先驻留 n78 20MHz 而非 n78 60MHz'
source_log: 'Old Outline knowledge base; split from 注网问题案例补充.md'
first_bad_point: '证据缺口：缺少 NR 小区测量、重选/切换策略、SIB 优先级和吞吐量对比 log'
confidence: low
status: summarized_with_log_gap
tags:
  - imported
  - split_from_bucket
  - evidence-gap
  - nr-cell-selection
---

# CM52没有切到吞吐量更高的小区

## 阅读入口

本 case 从旧 Outline 案例集合拆出，当前保留原始内容和初步 frontmatter。复用前需要核对平台、版本、运营商和完整 log。

## 用户现象
CM52没有切到吞吐量更高的小区

## 结论

当前只能作为“证据不足样例”。原始资料描述 DUT 间歇性优先使用 n78 20 MHz 小区而不是 n78 60 MHz 小区，导致吞吐低，但没有保留测量值、优先级、负载、NR RRC/测量报告或切换/重选决策 log。

后续复现时应先补齐证据，再判断是小区选择策略、负载均衡、CA/ENDC 能力、网络配置还是测试环境问题。

## 关键证据

- 原始分类：四、小区选择
- 来源：注网问题案例补充.md
- 拆分序号：8
- 现象：`n78 20MHz Cell 905` 与 `n78 60MHz Cell 192` 同时可用时，设备间歇性优先驻留 20 MHz 小区。
- 缺口：原始“问题分析 / 根本原因 / 解决方案”为空。

## 补证要求

| 证据 | 目的 |
|---|---|
| NR serving / neighbor measurement | 判断两个小区的 RSRP / RSRQ / SINR 是否真的同等可用 |
| SIB / priority / barred 信息 | 判断网络是否通过优先级或限制引导驻留 |
| 吞吐测试时间线 | 对齐驻留小区变化和吞吐下降时间点 |
| CA/ENDC 能力和 band combo | 判断是否受终端能力或组合限制影响 |
| 对比机 log | 判断是否是网络策略，还是 DUT 平台行为差异 |

## 原始案例内容

### 案例：CM52没有切到吞吐量更高的小区

Intermittently, device prioritizing n78 20Mhz (Cell id 905) instead of N78 60Mhz (Cell id 192) when both cells are available which resulting in poor throughput

**问题分析：**


**根本原因：**


**解决方案：**

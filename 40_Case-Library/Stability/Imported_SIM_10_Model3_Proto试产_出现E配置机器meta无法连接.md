---
doc_type: case
quality: imported_reference
domain: Stability
rat: Mixed
feature: 'SML / META connection'
platform: Mixed
layer: 'Config/Modem/AP'
symptom: 'Model3 Proto试产，出现E配置机器meta无法连接'
cause: 'modem assert 位于 custom_nvram_extra.c 的 SML 数据读取链路，SML data 为空；缺少最终 SML 侧结论'
source_log: 'Old Outline knowledge base; split from SIM问题案例补充.md'
first_bad_point: 'custom_nvram_extra.c line 11520，SML data 为空导致 META 连接失败'
confidence: medium
status: summarized_with_log_gap
tags:
  - imported
  - split_from_bucket
  - sml
  - meta
  - modem-assert
---

# Model3 Proto试产，出现E配置机器meta无法连接

## 阅读入口

本 case 从旧 Outline 案例集合拆出，当前保留原始内容和初步 frontmatter。复用前需要核对平台、版本、运营商和完整 log。

## 用户现象
Model3 Proto试产，出现E配置机器meta无法连接

## 结论

首坏点在 modem 侧 SML/NVRAM 读取链路。assert 位于 `custom_nvram_extra.c`，历史分析认为 SML data 取出为空，导致 E 配置机器 META 无法连接。当前资料缺少 SML 侧最终 root cause 和修复补丁，因此保留为证据缺口 case。

## 关键证据

- 原始分类：一、Modem 崩溃
- 来源：SIM问题案例补充.md
- 拆分序号：10
- assert：`mcu/pcore/custom/modem/common/ps/custom_nvram_extra.c line=11520`
- 参数：`para0/para1/para2 = 0`
- 分析方向：SML data 为空。

## 补证要求

| 证据 | 用途 |
|---|---|
| SML 数据生成/写入日志 | 确认是否产线未写入 |
| META 连接失败前 modem log | 确认是否每次卡在同一 assert |
| SML 侧代码/配置 diff | 确认空数据来源 |
| 修复版本复测 | 验证 META 连接恢复 |

## 原始案例内容

### 案例：Model3 Proto试产，出现E配置机器meta无法连接

分析：此部分打到了SML部分，看起来sml data数据拿出来为空， 需要SML那边协助排查一下原因

```java
<5>[   92.575090]  (4)[310:ccci_fsm1][ccci1/fsm]filename = mcu/pcore/custom/modem/common/ps/custom_nvram_extra.c
<5>[   92.575101]  (4)[310:ccci_fsm1][ccci1/fsm]line = 11520

<5>[   92.575110]  (4)[310:ccci_fsm1][ccci1/fsm]assert para0 = 0x00000000, para1 = 0x00000000, para2 = 0x00000000
```

 ![](../../attachments/outline/ac2308bd-6324-4b18-924a-dc437f6ab3e5.png)

## 复用边界

- 本 case 来自旧 Outline 迁入资料，状态为 partial。
- 复用时需要重新核对平台、项目、运营商、版本、log 时间窗和第一坏点。
- 如果后续补齐完整证据链，再把 status 改为 summarized 或 closed。

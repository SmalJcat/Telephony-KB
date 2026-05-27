---
doc_type: case
quality: imported_reference
domain: SIM
rat: Mixed
feature: 'NVRAM / Modem Assert'
platform: Mixed
layer: 'Modem/NVRAM/Flash tool'
symptom: 'WM58使用工厂工具刷机后，不识卡'
cause: '工厂工具刷机后 modem 在 nvram_main.c assert，原始资料未保留完整根因，需按 NVRAM / 产物 / 分区一致性补证'
source_log: 'Old Outline knowledge base; split from SIM问题案例补充.md'
first_bad_point: 'ccci1/fsm 上报 mcu/service/nvram/src/nvram_main.c assert，para1 = 0x20'
confidence: low
status: summarized_with_log_gap
tags:
  - imported
  - split_from_bucket
  - modem-assert
  - nvram
  - evidence-gap
---

# WM58使用工厂工具刷机后，不识卡

## 阅读入口

本 case 从旧 Outline 案例集合拆出，当前保留原始内容和初步 frontmatter。复用前需要核对平台、版本、运营商和完整 log。

## 用户现象
WM58使用工厂工具刷机后，不识卡

## 结论

当前只能定位到工厂工具刷机后 modem 在 `nvram_main.c` assert，导致不识卡；原始资料没有保留最终根因和修复动作，不能直接写成 SIM 卡问题。

后续复现应按 NVRAM / 产物 / 分区一致性补证：刷机工具、download 选项、modem image、NVRAM/fixnv/custnv、校准写码流程必须一起核对。

## 关键证据

- 原始分类：一、Modem 崩溃
- 来源：SIM问题案例补充.md
- 拆分序号：4
- assert 文件：`mcu/service/nvram/src/nvram_main.c`。
- assert 参数：`para1 = 0x00000020`。
- 证据缺口：原始“根本原因 / 解决方案”未保留文本。

## 补证要求

| 证据 | 目的 |
|---|---|
| 工厂工具版本和刷机选项 | 判断是否擦写/覆盖 NVRAM、modem 分区或校准区 |
| modem image / DB / NVRAM 版本 | 判断产物是否匹配 |
| assert 完整 dump | 确认 `nvram_main.c` assert 对应的 NVRAM item / error code |
| 刷机前后 NVRAM 回读 | 判断是否有 NV 损坏、缺项或格式不兼容 |

## 原始案例内容

### 案例：WM58使用工厂工具刷机后，不识卡

分析：

```javascript
<5>[   11.015998][T600449] [ccci1/fsm]filename = mcu/service/nvram/src/nvram_main.c
<5>[   11.016003][T600449] [ccci1/fsm]line = 3131
<5>[   11.016006][T600449] [ccci1/fsm]assert para0 = 0x00000000, para1 = 0x00000020, para2 = 0x00000000
```

 ![](../../attachments/outline/157e6ae7-f644-4633-8475-8bdcc5097f9b.png)根本原因：

 ![](../../attachments/outline/6cd7b308-0447-4a1a-bd65-2d45fc510d20.png)

## 复用边界

- 本 case 来自旧 Outline 迁入资料，状态为 partial。
- 复用时需要重新核对平台、项目、运营商、版本、log 时间窗和第一坏点。
- 如果后续补齐完整证据链，再把 status 改为 summarized 或 closed。

---
doc_type: case
quality: imported_reference
domain: SIM
rat: Mixed
feature: 'SIM'
platform: Mixed
layer: 'SIM/HW/ATR'
symptom: '6601 蓝鸟售后反馈不识卡'
cause: '原始资料只确认没有收到 ATR，要求拆机检查和测量 VSIM/RST/IO 波形，未保留最终根因'
source_log: 'Old Outline knowledge base; split from SIM问题案例补充.md'
first_bad_point: 'No ATR；贴纸垫高后仍不识卡，需测量 VSIM/RST/IO 波形'
confidence: low
status: summarized_with_log_gap
tags:
  - imported
  - split_from_bucket
  - no-atr
  - hardware
  - evidence-gap
---

# 6601 蓝鸟售后反馈不识卡

## 阅读入口

本 case 从旧 Outline 案例集合拆出，当前保留原始内容和初步 frontmatter。复用前需要核对平台、版本、运营商和完整 log。

## 用户现象
6601 蓝鸟售后反馈不识卡

## 结论

当前只能定位到 No ATR / 硬件链路方向。原始资料确认没有收到卡返回的 ATR，贴纸垫高后仍不识卡，但没有保留最终根因和修复动作。

后续复现时按 SIM 不识别“三段式”处理：先确认插卡事件，再看上电/ATR，最后才看 EF / AP subscription。

## 关键证据

- 原始分类：二、硬件配置问题
- 来源：SIM问题案例补充.md
- 拆分序号：17
- 原始分析：没有收到卡返回的 ATR。
- 卡片后面贴纸片仍不识卡。
- 建议动作：拆机检查明显故障，测量检卡时的 `vsim/rst/io` 波形。

## 补证要求

| 证据 | 目的 |
|---|---|
| 插卡中断 / detect | 判断是否进入 SIM 上电流程 |
| VSIM/RST/CLK/IO 波形 | 判断卡座、电源和复位时序 |
| No ATR log | 判断是完全无响应还是 ATR 不完整 |
| 卡/机交叉 | 区分卡片问题、卡座问题和主板硬件问题 |

## 原始案例内容

### 案例：6601 蓝鸟售后反馈不识卡

**问题分析：**

没有收到卡回的ATR，卡片后面贴纸片也是不识卡。需要拆机查看有无明显故障，并测量检卡时的 vsim,rst,io 的波形

 ![](../../attachments/outline/654cd402-5173-4f40-af22-254418d1cc70.png) ![](../../attachments/outline/7a13dfc9-c553-4244-a1a8-5c08453e016c.png)

 ![](../../attachments/outline/b9f76d8b-7d32-4c70-b3d4-2dcda3636470.png)

**根本原因：**

引脚脱焊或虚焊导致

 ![](../../attachments/outline/2b8123af-7c83-471d-8bdf-764925dc0a5b.png)

**解决方案：**

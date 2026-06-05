---
quality: template
search_tier: reference_only
doc_type: template
target_doc_type: case
domain: Template
rat: TBD
feature: TBD
platform: TBD
layer: TBD
symptom: TBD
cause: TBD
operator: TBD
project: TBD
chipset: TBD
vendor_customization: TBD
android_version: TBD
modem_version: TBD
source_log: TBD
first_bad_point: TBD
confidence: medium
status: active
tags:
  -
---

# Case: 标题

## 基本信息

| 项目 | 内容 |
|---|---|
| 日期 |  |
| 项目 |  |
| 平台 | Qualcomm / MTK / UNISOC |
| 芯片/基线 |  |
| 厂商客制化 | NV / modem config / carrier policy / framework overlay / vendor IMS |
| Android版本 |  |
| Modem版本 |  |
| 原始log |  |
| 第一坏点 |  |
| SIM/运营商 |  |
| RAT | 2G / 3G / 4G / 5G / IWLAN |
| 场景 | 开机 / 插卡 / 飞行模式 / 弱网 / 漫游 / 拨号 / 移动性 |
| 复现概率 |  |

## 状态说明

`status` 取值参考 [[../00_Index/内容归属规则#Case-状态值|Case 状态值]]。新增 case 优先用：

- `raw_import`：刚导入，未精修。
- `partial`：有可用片段，但证据链不完整。
- `summarized`：已整理成可复用案例。
- `open`：仍待补证据或跟踪。

## 用户现象

一句话描述用户看到的问题。

## 结论

一句话说明当前判断。没有证据时写“暂未定论”。

## 输入材料

- AP log：
- Modem log：
- bugreport：
- 版本信息：
- 其他：

## 时间线

| 时间 | 来源 | 事件 | 含义 | 重要性 |
|---|---|---|---|---|
|  | AP |  |  |  |
|  | Modem |  |  |  |

## 正常流程对比

参考流程：

- [[../20_Service-Flows/Network-Registration/LTE注册流程]]
- [[../20_Service-Flows/Network-Registration/NR注册流程]]
- [[IMS业务流程#IMS注册流程|IMS注册流程]]
- [[IMS业务流程#VoLTE-MO流程|VoLTE-MO流程]]
- [[IMS业务流程#VoWiFi注册流程|VoWiFi注册流程]]
- [[Call业务流程#CS-Call流程|CS-Call流程]]
- [[SIM业务流程#SIM识别流程|SIM识别流程]]

## 第一个异常点

```text
第一个坏点：
上一条正常证据：
下一条异常证据：
影响层级：
```

## 关键证据

```text
只贴关键log行，不贴整段大log。
```

## 异常分析

### 事实

- 

### 推断

- 

### 待确认

- 

## 平台差异检查

| 检查项 | 结果 |
|---|---|
| 是否只在单一平台复现 |  |
| Qualcomm/MTK/UNISOC是否路径不同 |  |
| 是否涉及NV或modem配置 |  |
| 是否涉及vendor RIL/IMS service实现 |  |
| 是否涉及客户overlay或CarrierConfig |  |
| 是否需要平台侧工具解析 | QXDM/QCAT / ELT / Logel / 其他 |

## 可能原因排序

| 排名 | 可能原因 | 证据 | 置信度 |
|---|---|---|---|
| 1 |  |  |  |
| 2 |  |  |  |
| 3 |  |  |  |

## 处理方案

- 临时规避：
- 正式修复：
- 需要供应商/运营商确认：

## 复盘

下次遇到类似问题，优先检查：

-

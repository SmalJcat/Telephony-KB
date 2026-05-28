---
doc_type: index
domain: Meta
status: active
quality: curated
---

# Telephony-KB

这是一个面向 Android 通信模块问题定位的个人知识库。目标不是收藏资料，而是把问题定位能力沉淀成可复用结构：

- 流程：正常路径、异常分叉、第一坏点。
- 案例：真实问题、证据链、根因、修复方案。
- 代码：不同平台代码入口、状态同步链路、产物关系。
- 配置：APN、运营商名、ECC、NV、CarrierConfig、SIMLock。
- 工具：log 抓取、解码、adb/dumpsys、健康检查、HTML 导出。
- 基础：术语、cause code、协议概念。
- 排障：常见现象的标准定位顺序。

推荐用 Obsidian 打开本目录：

```text
F:\Codex\Knowledge\Telephony-KB
```

## 入口

| 目标 | 入口 |
|---|---|
| 根目录首页 | [Home](Home.md) |
| 总首页 | [Home](00_Index/Home.md) |
| 业务域导航 | [业务知识地图](00_Index/业务知识地图.md) |
| 常用速查 | [速查](00_Index/速查.md) |
| 内容归属规则 | [内容归属规则](00_Index/内容归属规则.md) |
| Case 横向索引 | [Case横向索引](40_Case-Library/Case横向索引.md) |
| 证据缺口补证总览 | [证据缺口补证总览](30_Troubleshooting/证据缺口补证总览.md) |
| Telephony函数级入口速查 | [Telephony函数级入口速查](50_Platform-Code/Cross-Platform/Telephony函数级入口速查.md) |
| 配置方法模板 | [配置方法模板](99_Templates/配置方法模板.md) |
| Case 精修清单 | [案例精修清单](00_Index/案例精修清单.md) |
| 写作和维护规则 | [使用说明](00_Index/使用说明.md) |
| Case 模板 | [Case模板](99_Templates/Case模板.md) |
| 时间线模板 | [时间线模板](99_Templates/时间线模板.md) |

## 目录分层

| 目录 | 定位 |
|---|---|
| `00_Index` | 入口、导航、放置规则，不沉淀大段正文 |
| `10_Basics` | 基础概念、cause code、缩写、标签体系 |
| `20_Service-Flows` | 各业务正常流程、异常分叉、厂商差异点 |
| `30_Troubleshooting` | 按现象组织的速查流程和第一坏点判断 |
| `40_Case-Library` | 历史真实问题、证据链、根因和复盘 |
| `50_Platform-Code` | Android / MTK / UNISOC / Qualcomm 代码架构和产物链路 |
| `60_Configuration` | APN、运营商名、ECC、SMS、CB、NV、CarrierConfig、SIMLock 等配置方法 |
| `70_Tools-Debug` | 工具使用、log 抓取、解码、脚本、调试技巧 |
| `90_Decisions` | 长期有效的知识库维护决策和分析口径 |
| `99_Templates` | Case、流程、时间线、ADR 模板 |

## 知识库原则

1. 一个真实问题沉淀成一个 case，不塞回流程正文。
2. 流程文档写“正常路径 + 常见分叉 + 第一坏点”，不要只贴协议摘要。
3. 平台差异写在流程或代码架构中，但真实 log 证据放 case。
4. 配置问题单独进 `60_Configuration`，不要散落在各业务文档里。
5. 对不确定判断标注置信度，避免把猜测写成事实。
6. 导入资料必须有阅读入口和 `quality: imported_reference`，可复用结论继续沉淀到主流程、配置、排障或独立 case。
7. 新增或修改 case 后运行 [[70_Tools-Debug/知识库维护工具#Case横向索引|Case横向索引生成]]。
8. 大幅调整后运行 [[70_Tools-Debug/知识库维护工具#知识库健康检查|知识库健康检查]]，再导出 [[70_Tools-Debug/知识库维护工具#HTML导出|HTML]]。

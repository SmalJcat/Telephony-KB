---
doc_type: index
domain: Meta
status: active
quality: curated
search_tier: main_entry
---

# 70_Tools-Debug

## 使用入口

- 先确认目标：抓 log、解 log、写卡、导入参数、射频/校准、专项验证。
- 操作类内容优先看截图；遇到版本差异时检查工具菜单、依赖环境和输入文件格式。
- 本文图片已转成本地附件；非图片附件仍保留原 Outline 链接作为资料索引。

这里放工具、命令、log 抓取、解码方法、维护脚本。业务结论不放这里，工具只回答“怎么拿证据、怎么看字段”。

## 入口

| 文档 | 用途 |
|---|---|
| [常用命令](Commands/常用命令.md) | adb、logcat、dumpsys、telephony / phone / ims / carrier_config 状态 |
| [场测Log抓取SOP](Log-Capture/场测Log抓取SOP.md) | AP、modem、bugreport 抓取规范 |
| [MTK网络通信问题抓Log与提交模板](Log-Capture/MTK-网络通信问题抓Log与提交模板.md) | MTK 注册、IMS/WFC、Data、MMS/CB、Call、RRC、SIM/AT 等问题的 log 包和 eService 描述模板 |
| [Log分析方法](Log-Analysis/Log分析方法.md) | Android AP 侧 log 和 modem trace 通用分析方法 |
| [LTE注册-平台Log速查](Log-Analysis/LTE注册-平台Log速查.md) | LTE 注册平台 log 字段和关键模块 |
| [Log工具使用补充](Log-Analysis/Log工具使用补充.md) | ELT、Logel、Wireshark 使用方法补充 |
| [[知识库维护工具]] | Case 横向索引、配置文档模板化、导入资料治理、Markdown 健康检查脚本和 HTML 同步导出 |

## 参考资料

以下为导入合集或低频资料，只在主 SOP 没覆盖时查阅：

| 文档 | 用途 |
|---|---|
| [Catch Log补充](Log-Capture/Catch-Log补充.md) | MTK/UNISOC/Qualcomm/Wi-Fi sniffer 抓取资料 |
| [通信工具使用补充](Tools/通信工具使用补充.md) | SpeechAnalyzer、GRSIMWrite、META、MCF 等工具资料 |
| [调试技巧补充](Debug-Tips/调试技巧补充.md) | 锁小区、信号强度、IKE 解密、实时 modem log 等调试技巧 |

## 目录说明

| 目录 | 用途 |
|---|---|
| `Commands` | adb、dumpsys、shell、logcat |
| `Log-Capture` | 抓 log SOP、复现记录、证据包规范 |
| `Log-Analysis` | AP / modem / 平台 log 字段解释 |
| `Tools` | 专用通信工具使用说明 |
| `Debug-Tips` | 现场调试技巧和专项验证 |
| 根目录脚本 | 知识库维护脚本 |

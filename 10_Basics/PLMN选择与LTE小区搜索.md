---
doc_type: concept
domain: Basics
status: active
quality: imported_reference
---

﻿# PLMN选择与LTE小区搜索

> 兼容入口：PLMN 基础概念看 [[PLMN基础与术语]]；小区搜索看 [[LTE小区搜索与扫频]]；PSS/SSS 看 [[LTE-PSS-SSS检测]]。

## 拆分说明

这篇原来同时包含 PLMN 选择、LTE 小区扫频、PSS/SSS 检测和少量 5G 注册资料，单页过长。现在保留为入口页，正文拆到以下文档：

| 文档 | 内容 |
|---|---|
| [[PLMN基础与术语]] | HPLMN、RPLMN、EPLMN、FPLMN、VPLMN、RAT、suitable cell 等基础概念 |
| [[PLMN选择流程]] | 旧 PLMN 选择拆分入口 |
| [[LTE小区搜索与扫频]] | LTE 小区搜索概述、扫频场景、扫频流程 |
| [[LTE-PSS-SSS检测]] | 物理小区 ID、PSS/SSS、时频域位置和检测方法 |
| [NR注册流程](../20_Service-Flows/Network-Registration/NR注册流程.md) | 已拆出的 5G 注册资料 |

## 使用建议

- 定位“为什么没有进入注册”时，先看 [[PLMN基础与术语]]、[[PLMN自动选网流程]] 和 [[LTE小区搜索与扫频]]。
- 定位“扫到频点但不同步 / PCI 不对 / 小区识别失败”时，看 [[LTE-PSS-SSS检测]]。
- 定位真实项目问题时，把证据沉淀到 `40_Case-Library/Registration`。

## NR/5G注册资料拆分

5G注册流程、MRDC、VoNR/EPSFB 相关片段已移动到 [[NR注册流程]]。本文只保留 PLMN 选择、LTE 小区搜索、PSS/SSS 等基础内容。

## 来源记录

- [从协议层面理解找网流程——PLMN选择](http://192.168.3.94:8888/doc/plmn-cBqf3HJyqL) (`cBqf3HJyqL`)
- [LTE学习--小区搜索之概述及扫频](http://192.168.3.94:8888/doc/lte-91YMbjV3pr) (`91YMbjV3pr`)
- [LTE学习--小区搜索之PSS&SSS检测](http://192.168.3.94:8888/doc/lte-psssss-Ht8zaJhX0A) (`Ht8zaJhX0A`)


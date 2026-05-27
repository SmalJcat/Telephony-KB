---
doc_type: concept
domain: Basics
status: active
quality: curated
---

# PLMN基础与术语

## 阅读入口

这篇只解释 PLMN 选择相关基础概念。自动选网、手动选网和小区选择流程分别看 [PLMN自动选网流程](PLMN自动选网流程.md)、[PLMN手动选网与小区选择](PLMN手动选网与小区选择.md) 和 [LTE小区搜索与扫频](LTE小区搜索与扫频.md)。

## 术语速查

| 术语 | 含义 | 定位时关注点 |
|---|---|---|
| HPLMN | Home PLMN，归属 PLMN，通常由 IMSI MCC/MNC 决定 | 是否把归属网误判成漫游网 |
| EHPLMN | Equivalent HPLMN，与 HPLMN 等价的 PLMN | 是否影响归属网优先级和显示 |
| RPLMN | Registered PLMN，上次成功注册的 PLMN | 开机和回网时是否优先尝试 |
| EPLMN | Equivalent PLMN，与当前注册 PLMN 等价的 PLMN | TAU / 小区重选后是否仍允许驻留 |
| UPLMN | User Controlled PLMN，用户控制优选 PLMN | SIM EF 或用户配置是否影响顺序 |
| OPLMN | Operator Controlled PLMN，运营商控制优选 PLMN | 运营商优选列表是否影响选网 |
| FPLMN | Forbidden PLMN，禁止 PLMN | Attach/TAU reject 后是否被加入禁止列表 |
| VPLMN | Visited PLMN，拜访 PLMN | 漫游场景和 HPLMN 周期搜索 |
| RAT | Radio Access Technology，制式 | 同一 PLMN 下 LTE/NR/WCDMA/GSM 优先级 |
| suitable cell | 适合驻留的小区 | PLMN、barred、S 准则、TAC/LAI 是否满足 |

## 定位口径

| 问题 | 先看 |
|---|---|
| 开机搜不到网 | RPLMN、HPLMN/EHPLMN、支持 RAT、band、SIM 状态 |
| 有网络列表但选不上 | FPLMN、手动选网目标 RAT、小区 suitable、注册 reject cause |
| reject 后长时间无服务 | FPLMN、退避定时器、回落 RAT、HPLMN 搜索周期 |
| AP 显示运营商名异常 | SPN/PNN/OPL、RPLMN、当前注册 PLMN、漫游标志 |

## 不放在这里

| 内容 | 应放位置 |
|---|---|
| Attach / TAU / 默认承载流程 | `20_Service-Flows/Network-Registration` |
| 某次 reject 的真实 log 和根因 | `40_Case-Library/Registration` |
| 运营商名称、SPN、PNN/OPL 配置方法 | `60_Configuration/运营商名称配置方法.md` |
| 平台代码如何解析注册态 | `50_Platform-Code` |


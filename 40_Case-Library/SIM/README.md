---
doc_type: index
domain: Meta
status: active
quality: curated
search_tier: main_entry
---

# SIM Cases

## 快速定位

- 先按现象、第一坏点、平台、配置项四个维度归类，再回看截图和关键 log。
- 复用案例时不要只套结论，需要确认版本、运营商、卡类型、开关默认值和最终生效配置。
- 案例里的图片已本地化，适合直接在 HTML 中对照字段和流程位置。

SIM识别、UICC状态、IMSI/ICCID读取、ISIM、PIN/PUK、热插拔、多卡订阅相关 case 放这里。

## 已整理案例

| Case | 场景 | 用途 |
|---|---|---|
| [[2024-09-26_SIM_UNISOC_热插拔无中断与NV路径]] | SIM 热插拔不触发 | 确认热插拔 NV 路径、SIM 中断日志和硬件触发 |
| [[2024-08-14_SIM_UNISOC_eSIM空卡与euicc配置]] | SIM1 + eSIM 调试 | 区分空 eSIM、euicc feature、RIL/FW diff 与后续 modem assert |
| [[2023-11-21_SIM_UNISOC_VSIM退出后物理卡不显示]] | VSIM 退出后物理卡不显示 | 检查 VSIM 模式退出、slot mapping、`vsim_set_nv` 返回值 |
| [[2025-08-22_SIM_UNISOC_Idea漫游显示Airtel与漫游图标配置]] | Idea 漫游到 Airtel 不显示漫游图标但显示 Airtel | 区分 non-roaming 配置和运营商名称显示链路 |
| [[2024-02-05_SIM_UNISOC_单双卡单软多硬NV卡槽配置不匹配]] | 单软多硬 singlesim 不识卡 | 对齐 SKU、硬件卡槽和 modem NV slot mapping |
| [[2022-06-20_SIM_UNISOC_手动搜网列表运营商名MNC位数不匹配]] | 手动搜网列表名称为空/不一致 | 检查 `numeric_operator.xml` 5/6 位 MCCMNC key |
| [[2023-02-24_SIM_UNISOC_MVNO名称SPN_PNN未命中回退本地PLMN]] | MVNO 卡显示主网 PLMN 名称 | 区分 APN MVNO 字段、SPN/PNN 命中和本地 PLMN fallback |
| [[2023-03-08_SIM_UNISOC_MVNO_EFPNN读取与pnn_len为0]] | MVNO 卡运营商名称错误 | 建立 EF_OPL 匹配、PNN index、`pnn_len` 的排查顺序 |
| [[2024-04-12_SIM_UNISOC_SimLock锁卡状态MCCMNC为空]] | SimLock 锁卡状态 MCC/MNC 为空 | 区分 `NETWORK_LOCKED` 与 READY 后读卡，避免误判 AP SubInfo |
| [[2024-05-17_SIM_UNISOC_手动搜网名称PNN_OPL5G误用]] | 手动搜网名称显示错误 | 区分 PNN/OPL/EFOPL5G 与 ROM operator name fallback |
| [[2024-12-10_SIM_UNISOC_PLMN名称ONS空值与numeric_operator双来源]] | PLMN 名称显示错误 | 检查 ONS 空值返回、FWK/RIL 双来源 numeric_operator |
| [[2025-11-06_SIM_UNISOC_NITZ名称飞行模式后缓存失效]] | 飞行模式后 NITZ 运营商名回退 | 区分 NITZ 是否收到、缓存清理和 `updateSpnDisplay` fallback |
| [[2026-02-27_SIM_UNISOC_PLMN列表与SIM短信参数能力确认]] | SIM/USIM EF 能力确认 | 区分 PLMN 列表容量、`EF_SMSP`、USIM data download 和 UICC 去激活需求 |
| [[2025-05-19_SIM_不识卡_NO_ATR或无中断]] | 工厂 SIM 不识卡 | 区分 No ATR、无插卡中断、AP 订阅链路问题 |
| [[2026-05-27_SIM_UNISOC_Dahlia插卡无ATR后掉卡]] | Dahlia singlesim 插卡无 ATR 后掉卡 | 螺丝松动导致结构压合不充分；按紧/锁紧螺丝后 ATR/ICCID 恢复 |


## 已拆分旧 Outline 案例

| Case | 原始分类 | 用途 |
|---|---|---|
| [[Imported_SIM_01_WM28+_连不上Meta]] | 一、Modem 崩溃 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_02_CC51_safracom_CA超出平台能力_导致无法注册网络]] | 一、Modem 崩溃 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_04_WM58使用工厂工具刷机后_不识卡]] | 一、Modem 崩溃 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_05_GH66B2Astech售后反馈不识卡]] | 一、Modem 崩溃 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_12_WM58卡托检查代码修改问题_导致Modem_Assert]] | 一、Modem 崩溃 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_16_Dahlia_451H_卡二识卡后_会自动掉卡]] | 二、硬件配置问题 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_17_6601_蓝鸟售后反馈不识卡]] | 二、硬件配置问题 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_18_VINCA_SIM_PIN掉卡问题]] | 三、驱动配置问题 | SIM/稳定性旧 Outline case 拆分项 |
| [[Imported_SIM_19_GH6683_sunking_sim_pin_issue_report]] | 四、软件机制 | SIM/稳定性旧 Outline case 拆分项 |

## 已迁移到 Stability

写码、升级、IMEI unknown、Meta 连接和 RF 参数导致的 modem assert 已归并到 [[../Stability/NVRAM与产物链路问题索引]]，不再放在 SIM 主线里维护。

建议命名：

```text
YYYY-MM-DD_SIM_现象_根因.md
```

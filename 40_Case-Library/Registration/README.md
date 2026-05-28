---
doc_type: index
domain: Meta
status: active
quality: curated
search_tier: main_entry
---

# Registration Cases

## 阅读入口

- 本页是当前目录入口，优先按表格进入已整理主题；来源记录只用于回溯。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

网络注册相关 case 放这里，包括 2G/3G/LTE/NR 注册失败、搜网失败、reject、TAU、PLMN选择、漫游限制等。

## 已整理案例

| Case | 场景 | 用途 |
|---|---|---|
| [[2026-05-14_Registration_UNISOC_LTE开机注册成功]] | 展锐LTE开机注册成功 | 正常Attach/默认承载/AP同步对照 |
| [[2026-05-14_Registration_UNISOC_LTE飞行模式开关回网成功]] | 展锐飞行模式开关后LTE回网 | 对照PS power off/on、re-Attach、默认承载恢复 |
| [[2026-05-14_Registration_UNISOC_LTE手动搜网选网成功]] | 展锐手动搜网、选择46001 | 对照PLMN list、manual selection、TAU/Service Request |
| [[2026-05-14_Registration_MTK_LTE开机注册成功]] | MTK LTE开机注册成功 | 对照debuglogger、EMM/ESM attach、AT注册URC、AP ServiceState同步 |
| [[2026-05-14_Registration_LTE第一坏点样例集]] | LTE注册失败第一坏点 | 区分RRC失败、Attach Reject、reject后选网策略 |
| [[2025-W21_Registration_SIMLock锁网不生效_产物错误]] | 市场版本非白名单卡仍可驻网 | 判断锁网配置是否进入 modem 产物和编译流水线 |
| [[2024-06-24_Registration_UNISOC_手动选网CarrierConfig策略]] | 手动选网成功/失败后的自动模式策略 | 解释 `oem_key_restore_auto_mode`、`oem_key_permanent_auto_sel_mode_bool` 与失败弹框分支 |
| [[2024-05-16_Registration_UNISOC_Spectranet_B40不支持无信号]] | Spectranet 无信号 | 用 Band 能力矩阵解释 `NO_SUITABLE_CELL_IN_TA` 和 LIMITED_SERVICE |
| [[2024-03-27_Registration_UNISOC_3GOnly联通弱场无法驻网]] | 3G only 联通弱场空三角 | 区分全 Band 测量、历史频点、SFO fail 导致的驻网差异 |
| [[2026-03-06_Registration_UNISOC_Kenya_Safaricom_LTE拒绝后3G建链失败]] | Safaricom LTE reject 后 3G 回落失败 | 区分 LTE cause 15 和后续 3G RACH/建链第一坏点 |
| [[2025-10-15_Registration_UNISOC_Verizon未认证IMEI后Attach_PDN拒绝]] | Verizon 卡插入未认证 IMEI 后回插认证设备仍拒绝 | 用 `ATTACH_REJECT` + `PDN_CONNECTIVITY_REJECT` 判断网络侧/订阅/APN第一坏点 |
| [[2026-04-01_Registration_UNISOC_赞比亚双卡全制式无信号_RF掉底]] | 赞比亚售后双卡全制式无信号 | 用 RSSI 掉底判断 RF/天线链路问题 |
| [[2025-05-18_Registration_UNISOC_弱场移动后无法回4G_Log证据不足]] | 弱场移动后无法回 4G | 强调 DSP/ARM 时间点对齐和弱场证据要求 |
| [[2025-07-16_Registration_UNISOC_UECapability缺少2G能力_网络模式客制化]] | LTE UECapability 不带 2G/GSM 能力 | 按 CarrierConfig 网络模式客制、`AT+SPTESTMODEM` 和 RRC 能力上报定位 |


## 已拆分旧 Outline 案例

| Case | 原始分类 | 用途 |
|---|---|---|
| [[Imported_Registration_01_DAHLIA_450A软件刷在450H手机上_能搜到网络_但是注册不上网络]] | 一、RF 参数未配置 | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_02_BB印度实网反馈_无法注册网络]] | 二、网络Reject | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_03_MTN_Uganda售后反馈_无法注册网络]] | 二、网络Reject | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_04_GH67M1_OMEGA无法注册网络]] | 二、网络Reject | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_05_MP6漫游失败]] | 二、网络Reject | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_06_WM58_使用物联网卡_无法注册上网络]] | 三、RF参数未校准 | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_07_GH6733B_Symphony反馈信号波动频繁]] | 四、小区选择 | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_08_CM52没有切到吞吐量更高的小区]] | 四、小区选择 | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_09_CM52在宁波实验室测试_待机功耗高]] | 五、搜网功耗高 | 注册类旧 Outline case 拆分项 |
| [[Imported_Registration_10_Steering_of_Roaming_Cause17]] | 六、搜网驻网策略 | 注册类旧 Outline case 拆分项 |

建议命名：

```text
YYYY-MM-DD_Registration_现象_根因.md
```

---
doc_type: config
domain: Configuration
status: active
quality: curated
layer: AP/Framework/CarrierConfig
source: 运营商配置参考.xlsx; CarrierConfigManager.java
---

# CarrierConfig参数映射

## 阅读入口

- 本文是 CarrierConfig key 的总入口，只保留配置原则、分组统计和参数索引。
- 字段级大表已按 Group 拆到 References/CarrierConfig；查具体 key 时先用索引定位分组，再回目标平台 CarrierConfigManager.java 复核默认值和消费者。


## 学习摘要

| 项目 | 结论 |
|---|---|
| 来源 | 早期运营商配置参考表；当前已按目标分支 `CarrierConfigManager.java` 过滤和补充。 |
| 默认值基准 | `/home/wx/Project/Common/SPRDROID16_SYS_MAIN_W25.22.4/alps/frameworks/base/telephony/java/android/telephony/CarrierConfigManager.java` 中的 key 和 `sDefaults`；跨平台使用前必须切到目标平台源码复核。 |
| 当前覆盖 | 平台列按 UNISOC、MTK、Qualcomm(qssi) 三份 `CarrierConfigManager.java` 计算；三平台均存在记为 `common`，否则记录实际支持平台。厂商自定义 key 不放入 common 映射。 |
| 使用边界 | 本表是字段含义和默认值索引，不等于可直接配置清单；实际配置仍需确认 MCC/MNC、carrier id、specific carrier id、GID/SPN/IMSI 匹配条件和运行时覆盖顺序。 |

## CarrierConfig配置原则

1. 先以目标分支 `frameworks/base/telephony/java/android/telephony/CarrierConfigManager.java` 作为最终 key 和默认值基准。
2. 运营商 XML 只配置 `CarrierConfigManager.java` 中存在的 key；如果查不到常量或默认值，先标记为 `Needs study`。
3. 需求值与 `CarrierConfigManager` 默认值一致时不配置，避免冗余覆盖；只有需要改变默认行为时才写入 carrier XML。
4. 其他运营商 XML、厂商文档和历史知识库只用于辅助理解，不替代当前分支源码判断。
5. `平台` 列为 `common` 表示 UNISOC、MTK、Qualcomm(qssi) 三平台均存在；如果不是三平台都有，则写实际支持平台，例如 `UNISOC/MTK`。
6. 本文件不再维护原生标记列；厂商自定义 key 若后续确有代码消费者，应另建厂商扩展映射并标明读取点。

## 分组统计

| Group | 数量 |
|---|---:|
| 5G | 7 |
| APN | 7 |
| Call | 50 |
| DATA | 6 |
| Dialer | 8 |
| IMS | 30 |
| MMS | 31 |
| Network | 25 |
| Other | 7 |
| SIM | 4 |
| Statusbar | 1 |
| VVM | 6 |
| WIFI | 1 |

## 使用规则

1. 先用需求术语匹配 `Group` 和 `Description`，不要只凭英文描述改值。
2. 再到目标平台搜索 `Name`，确认加载路径、覆盖顺序、匹配条件和默认值。
3. 如果需求值等于 `Default`，通常不要写入运营商 XML；如果仍需显式覆盖，必须说明原因。
4. 修改前记录匹配条件、旧值、目标文件；修改后用 `adb shell dumpsys carrier_config` 或相关日志验证运行时值。

## 拆分说明

字段级表格已按 Group 拆到 References/CarrierConfig。主文件只维护配置原则和索引；如果需要新增或刷新 key，优先刷新对应分组文件，同时保持本页统计和索引一致。

## 参数映射索引

| Group | 数量 | 入口 |
|---|---:|---|
| 5G | 7 | [References/CarrierConfig/5G.md](References/CarrierConfig/5G.md) |
| APN | 7 | [References/CarrierConfig/APN.md](References/CarrierConfig/APN.md) |
| Call | 50 | [References/CarrierConfig/Call.md](References/CarrierConfig/Call.md) |
| DATA | 6 | [References/CarrierConfig/DATA.md](References/CarrierConfig/DATA.md) |
| Dialer | 8 | [References/CarrierConfig/Dialer.md](References/CarrierConfig/Dialer.md) |
| IMS | 30 | [References/CarrierConfig/IMS.md](References/CarrierConfig/IMS.md) |
| MMS | 31 | [References/CarrierConfig/MMS.md](References/CarrierConfig/MMS.md) |
| Network | 25 | [References/CarrierConfig/Network.md](References/CarrierConfig/Network.md) |
| Other | 7 | [References/CarrierConfig/Other.md](References/CarrierConfig/Other.md) |
| SIM | 4 | [References/CarrierConfig/SIM.md](References/CarrierConfig/SIM.md) |
| Statusbar | 1 | [References/CarrierConfig/Statusbar.md](References/CarrierConfig/Statusbar.md) |
| VVM | 6 | [References/CarrierConfig/VVM.md](References/CarrierConfig/VVM.md) |
| WIFI | 1 | [References/CarrierConfig/WIFI.md](References/CarrierConfig/WIFI.md) |

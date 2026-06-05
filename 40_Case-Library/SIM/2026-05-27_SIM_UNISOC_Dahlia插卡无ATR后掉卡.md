---
quality: curated
doc_type: case
domain: SIM
rat: LTE
feature: SIM Detection
platform: UNISOC
layer: SIM/Modem/HW
symptom: "Dahlia singlesim 设备正常插卡无反应；SIM 卡背面贴纸增厚后可正常识别"
cause: "螺丝松动导致结构压合不充分，SIM 接触不良；按紧/锁紧螺丝后恢复"
operator: unknown
project: T450A / Dahlia_singlesim
chipset: sc9863A / 4G_MODEM_22B_W24.47.2
vendor_customization: unknown
android_version: Android 15
modem_version: "4G_MODEM_22B_W24.47.2|sc9863A_modem"
source_log: "F:\\Log\\NOSIM\\ylog; F:\\Log\\NOSIM\\OK\\ylog"
first_bad_point: "10:05:47 插卡后 CARDSTATE_PRESENT 但 ATR/ICCID 为空，AT+SPATR? 返回空，约 1 秒后回落到 ABSENT/ERROR"
confidence: high
search_tier: case_summary
status: summarized
tags: "SIM, No ATR, hotplug, EIC, contact, card socket, Dahlia, singlesim, UNISOC"
---

# Dahlia singlesim 插卡无 ATR 后掉卡

## 基本信息

| 项目 | 内容 |
|---|---|
| 记录日期 | 2026-05-27 |
| 故障 Log 时间 | 2025-09-02 10:05:41 - 10:07:21 |
| OK Log 时间 | 2025-09-02 10:39:38 - 10:40:01 |
| 项目/版本 | T450A，Dahlia_singlesim，Android 15 |
| 基带 | `4G_MODEM_22B_W24.47.2/sc9863A_modem` |
| SIM 配置 | `ro.boot.sim_count=1`，`persist.radio.multisim.config=ssss` |
| 当前状态 | `summarized`，闭环为螺丝松动导致结构压合不充分，按紧/锁紧螺丝后恢复 |

## 状态说明

本 case 已用对比 log、贴纸增厚实验和硬件复核闭环到结构压合问题。最终结论是螺丝松动导致结构压合不充分，SIM 卡接触不良；按紧/锁紧螺丝后恢复。

## 用户现象

插入 SIM 卡后用户侧看起来没有反应，故障 log 最终系统属性中 `gsm.sim.state=ABSENT`。同一问题在 SIM 卡背面贴纸增厚后可以正常识别，OK log 中能读到 ATR 和 ICCID。

## 结论

这不是纯 AP Framework 或订阅刷新无反应。故障 log 中 AP/RIL 已经收到一次插卡事件，并短暂上报 `CARDSTATE_PRESENT`，但 ATR 和 ICCID 为空，`UiccCardApplication` 仍停在 `APPTYPE_UNKNOWN/APPSTATE_DETECTED`，随后约 1 秒内回落为 `CARDSTATE_ABSENT`/`CARDSTATE_ERROR`。

贴纸增厚后的 OK log 中，AP/RIL 成功读到 ATR `3B9F95801FC78031E073FE211B57378660D6020000E6` 和 ICCID，`APPTYPE_USIM` 建立，状态进入 `PIN_REQUIRED`/`NETWORK_LOCKED`。这说明软件链路、slot mapping、RIL/FW 订阅更新链路可以工作，根因收敛为物理压合接触不足。硬件复核进一步确认是螺丝松动导致结构压合不充分，处理方式为按紧/锁紧螺丝。

`PIN_REQUIRED`/`NETWORK_LOCKED` 是卡自身锁定/个性化状态，不是识卡失败。

## 输入材料

| 类型 | 路径 |
|---|---|
| 故障 phone.info | `F:\Log\NOSIM\ylog\phone.info` |
| 故障 AP radio log | `F:\Log\NOSIM\ylog\ap\000-0902_100541--0902_100721\0-android_radio.log` |
| 故障 Modem log | `F:\Log\NOSIM\ylog\modem\md_20250902-100548.log` |
| 贴纸后 OK phone.info | `F:\Log\NOSIM\OK\ylog\phone.info` |
| 贴纸后 OK AP radio log | `F:\Log\NOSIM\OK\ylog\ap\000-0902_103940--0902_104001\0-android_radio.log` |
| 贴纸后 OK Modem log | `F:\Log\NOSIM\OK\ylog\modem\md_20250902-103943.log` |

## 时间线

| 时间 | 现象 | 判断 |
|---|---|---|
| 10:05:41 | RIL 上报 `plug Out`，`CARDSTATE_ABSENT`，`atr=, iccid=` | 初始无卡 |
| 10:05:47 | `setSimPresent[0] hasSim = 1`，`CARDSTATE_PRESENT` | AP/RIL 收到插卡事件 |
| 10:05:47 | `IccCardState` 中 `atr=, iccid=`，ATR 校验报错 | 插卡后无有效 ATR |
| 10:05:47 | `UiccApp` 为 `APPTYPE_UNKNOWN/APPSTATE_DETECTED`，`SIM_OPEN_CHANNEL` 返回 `GENERIC_FAILURE` | 卡应用未完成识别，open channel 失败是无 ATR 的后续影响 |
| 10:05:48 | `plug Out`，`hasSim = 2`，`CARDSTATE_ERROR` 后进入 `ABSENT` | 卡状态不稳定，短暂 present 后掉卡 |
| 10:07:21 | 系统维持 `CARDSTATE_ABSENT` | 用户侧表现为插卡无反应 |
| 10:39:43 | 贴纸后 OK log 中先出现 `CARDSTATE_PRESENT`，初始仍短暂 `atr=, iccid=` | 插卡事件正常到达 |
| 10:39:44 | `IccCardState` 进入 `CARDSTATE_PRESENT`，`APPTYPE_USIM/APPSTATE_PIN`，带有效 ATR 和 ICCID | 基础识卡恢复 |
| 10:39:44 | `AnswerToReset` 成功解析 ATR | ATR 链路恢复 |
| 10:39:44 | `updateSimState: PIN_REQUIRED`，`updateSubscription` 找到 `iccId` 和 `subId=4` | AP 订阅链路恢复 |
| 10:39:50 | 状态进入 `NETWORK_LOCKED`，卡仍为 `CARDSTATE_PRESENT` | 后续为卡锁/个性化状态，不是掉卡 |

## 正常流程对比

正常插卡链路应为：

1. 热插拔中断/EIC 检测到插卡。
2. Modem SIM driver 给 SIM 上电，拉 RST/CLK/IO。
3. SIM 返回有效 ATR，`AT+SPATR?` 可读到 ATR。
4. RIL 上报 `CARDSTATE_PRESENT` 且带 ATR/ICCID。
5. AP 继续读取 EF_IMSI/ICCID/SPN，更新 `UiccController` 和 subscription。

本 case 停在第 2 到第 3 步之间：插卡事件和上电流程存在，但没有读到有效 ATR。

## 第一个异常点

插卡后的第一个异常点是 AP/RIL 侧 `CARDSTATE_PRESENT` 已出现，但 ATR/ICCID 仍为空：

```text
IccCardState {CARDSTATE_PRESENT,...,atr=,iccid=,...}
AnswerToReset: Valid ATR string must at least contains TS and T0.
UiccApp: {APPTYPE_UNKNOWN,APPSTATE_DETECTED}
```

Modem 侧也能看到热插拔/EIC 与上电相关日志，但 `AT+SPATR?` 后返回空 `+SPATR:`，没有有效 ATR 内容。

```text
EICDRV: call sim card callback function, state = 0
EICDRV: call sim card callback function, state = 8
APP_MN_SIM_POWER_ON_CNF
AT+SPATR?
+SPATR:
```

贴纸增厚后的 OK log 中，ATR/ICCID 恢复：

```text
IccCardState {CARDSTATE_PRESENT,...{APPTYPE_USIM,APPSTATE_PIN,...},atr=3B9F95801FC78031E073FE211B57378660D6020000E6,iccid=898603230[****],...}
AnswerToReset: Successfully parsed the ATR string 3B9F95801FC78031E073FE211B57378660D6020000E6
UiccController: updateSimState: phoneId=0, state=PIN_REQUIRED, reason=PIN
SMSVC: updateSubscription: Found iccId=898603230[****] on phone 0
```

Modem 侧 OK log 也能看到 `AT+SPATR?` 返回有效 ATR：

```text
AT+SPATR?
+SPATR:3B9F95801FC78031E073FE211B57378660D6020000E6
```

## 关键证据

| 证据 | 含义 |
|---|---|
| 故障 log 中 `CARDSTATE_PRESENT` 只短暂出现 | AP/RIL 不是完全没有收到插卡事件 |
| 故障 log 中 `atr=, iccid=` | 卡未完成基本 ATR/ICCID 读取 |
| 故障 log 中 `APPTYPE_UNKNOWN/APPSTATE_DETECTED` | UICC 应用没有进入 SIM/USIM ready 链路 |
| 故障 log 中 `CARDSTATE_ERROR` 后回到 `ABSENT` | 物理检测或电气链路不稳定 |
| 故障 modem log 中 `+SPATR:` 为空 | Modem 侧未拿到有效 ATR |
| OK log 中同卡贴纸后 ATR/ICCID 正常 | 证明 RIL、AP subscription、slot mapping 主链路可工作 |
| 贴纸增厚这一单变量实验有效 | 强指向结构压合接触不足 |
| 按紧/锁紧螺丝后恢复 | 最终闭环为螺丝松动导致结构压合不充分 |

## 异常分析

### 事实

- 设备是 singlesim SKU，`ro.boot.sim_count=1`，`persist.radio.multisim.config=ssss`。
- 初始状态为 `ABSENT`。
- 插卡时 RIL 收到 `setSimPresent[0] hasSim = 1` 和 `CARDSTATE_PRESENT`。
- 插卡后的 `IccCardState` 没有 ATR/ICCID。
- 约 1 秒后状态回落到 `CARDSTATE_ABSENT`，中间出现 `CARDSTATE_ERROR`。
- Modem log 中存在 EIC 回调、SIM power on confirm 和空 `+SPATR:`。
- 用户在 SIM 卡背面贴纸增厚后，设备可以正常识别 SIM。
- 硬件复核结论为螺丝松动、结构压合不充分。
- 按紧/锁紧螺丝后问题恢复。
- OK log 中 ATR `3B9F95801FC78031E073FE211B57378660D6020000E6` 被成功解析，ICCID 被读取，subscription 找到 `subId=4`。

### 推断

- 根因是结构压合不足导致 SIM 物理接触不良，不是 AP 订阅链路。
- `SIM_OPEN_CHANNEL` 失败不应作为第一坏点，它发生在 ATR/应用识别未完成之后。
- OK log 已证明同一软件链路能读 ATR/ICCID，`sim_hot_plug_cfg`、slot mapping、RIL/FW 不再是优先怀疑点。

### 硬件闭环

- 最终失效点：螺丝松动，结构压合不充分。
- 解决方案：按紧/锁紧螺丝，恢复 SIM 卡压合接触。
- 量产关注：螺丝锁附扭矩、点胶/防松设计、整机压合余量和产线锁附检查。

## 平台差异检查

- 本 case 是 UNISOC Dahlia singlesim，不能直接套用双卡 card2 掉卡结论。
- 历史 Dahlia 451H card2 掉卡案例提示：Dahlia 系列遇到识卡后掉卡时，应优先把 AP SIM state、modem SIM event 和示波器波形对齐，尤其关注 SIM power、IO、RST、CLK。
- 本 case 已经由贴纸增厚实验和硬件复核闭环到螺丝松动导致结构压合不充分。Dahlia 系列后续遇到类似“短暂 present、无 ATR、贴纸或按压后恢复”的问题，应优先检查整机锁附和压合结构。

## 可能原因排序

| 优先级 | 方向 | 理由 | 下一步 |
|---|---|---|---|
| P0 | 螺丝松动导致结构压合不充分 | 贴纸增厚和按紧螺丝后 ATR/ICCID 恢复 | 按紧/锁紧螺丝，确认锁附扭矩和防松措施 |
| P1 | 卡座/卡托/SIM 压合接触不足 | 未贴纸时上电后无 ATR，贴纸后有 ATR | 检查卡座弹片高度、卡托限位、SIM 厚度和触点压痕 |
| P2 | VSIM/RST/CLK/IO 接触边界异常 | 故障 log 中 present 后回落到 absent/error | 若结构确认无问题，再对比未贴纸/贴纸后波形 |
| P3 | AP Framework subscription 链路 | OK log 已经能建 subscription | 暂不作为根因方向 |

## 处理方案

1. 按紧/锁紧螺丝，恢复整机结构压合。
2. 产线侧确认螺丝锁附扭矩、漏锁/松动检查和防松措施。
3. 复测 SIM 插拔，确认 ATR/ICCID 稳定读取，不再出现短暂 `CARDSTATE_PRESENT` 后掉卡。
4. 不要把贴纸作为量产修复，只作为定位验证手段。
5. 软件侧当前无修复点。

## 复盘

看到“插卡无反应”时不要直接跳到 AP 订阅链路。只要 log 中出现过短暂 `CARDSTATE_PRESENT`，就应继续确认 ATR、ICCID、EIC、上电和波形；无 ATR 的第一坏点通常在卡接触/电气/热插拔链路。

本 case 的关键闭环是单变量实验和硬件复核：SIM 背面贴纸增厚后，OK log 中 ATR/ICCID 和 subscription 都恢复；进一步检查发现螺丝松动，按紧/锁紧螺丝后恢复。根因是结构压合不充分导致 SIM 接触不良，而不是软件流程。

---
quality: curated
doc_type: case
domain: SIM
rat: LTE
feature: SIM Detection
platform: UNISOC
layer: SIM/Modem/HW
symptom: "Dahlia singlesim 设备正常插卡无反应；SIM 卡背面贴纸增厚后可正常识别"
cause: "卡座/卡托/SIM 压合接触不足；贴纸增厚后接触恢复，ATR/ICCID 可正常读取"
operator: unknown
project: T450A / Dahlia_singlesim
chipset: sc9863A / 4G_MODEM_22B_W24.47.2
vendor_customization: unknown
android_version: Android 15
modem_version: "4G_MODEM_22B_W24.47.2|sc9863A_modem"
source_log: "F:\\Log\\NOSIM\\ylog; F:\\Log\\NOSIM\\OK\\ylog"
first_bad_point: "10:05:47 插卡后 CARDSTATE_PRESENT 但 ATR/ICCID 为空，AT+SPATR? 返回空，约 1 秒后回落到 ABSENT/ERROR"
confidence: high
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
| 当前状态 | `summarized`，贴纸增厚后恢复，闭环到卡座/卡托/SIM 压合接触不足 |

## 状态说明

本 case 已用对比 log 和用户实验闭环到物理接触/压合问题。仍可继续细分是卡座弹片、卡托限位、SIM 厚度公差还是整机结构压合问题。

## 用户现象

插入 SIM 卡后用户侧看起来没有反应，故障 log 最终系统属性中 `gsm.sim.state=ABSENT`。同一问题在 SIM 卡背面贴纸增厚后可以正常识别，OK log 中能读到 ATR 和 ICCID。

## 结论

这不是纯 AP Framework 或订阅刷新无反应。故障 log 中 AP/RIL 已经收到一次插卡事件，并短暂上报 `CARDSTATE_PRESENT`，但 ATR 和 ICCID 为空，`UiccCardApplication` 仍停在 `APPTYPE_UNKNOWN/APPSTATE_DETECTED`，随后约 1 秒内回落为 `CARDSTATE_ABSENT`/`CARDSTATE_ERROR`。

贴纸增厚后的 OK log 中，AP/RIL 成功读到 ATR `3B9F95801FC78031E073FE211B57378660D6020000E6` 和 ICCID，`APPTYPE_USIM` 建立，状态进入 `PIN_REQUIRED`/`NETWORK_LOCKED`。这说明软件链路、slot mapping、RIL/FW 订阅更新链路可以工作，根因收敛为卡座/卡托/SIM 之间的压合接触不足。

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
| 贴纸增厚这一单变量实验有效 | 强指向卡座/卡托/SIM 压合接触不足 |

## 异常分析

### 事实

- 设备是 singlesim SKU，`ro.boot.sim_count=1`，`persist.radio.multisim.config=ssss`。
- 初始状态为 `ABSENT`。
- 插卡时 RIL 收到 `setSimPresent[0] hasSim = 1` 和 `CARDSTATE_PRESENT`。
- 插卡后的 `IccCardState` 没有 ATR/ICCID。
- 约 1 秒后状态回落到 `CARDSTATE_ABSENT`，中间出现 `CARDSTATE_ERROR`。
- Modem log 中存在 EIC 回调、SIM power on confirm 和空 `+SPATR:`。
- 用户在 SIM 卡背面贴纸增厚后，设备可以正常识别 SIM。
- OK log 中 ATR `3B9F95801FC78031E073FE211B57378660D6020000E6` 被成功解析，ICCID 被读取，subscription 找到 `subId=4`。

### 推断

- 根因方向是 SIM 物理接触/压合链路，不是 AP 订阅链路。
- `SIM_OPEN_CHANNEL` 失败不应作为第一坏点，它发生在 ATR/应用识别未完成之后。
- OK log 已证明同一软件链路能读 ATR/ICCID，`sim_hot_plug_cfg`、slot mapping、RIL/FW 不再是优先怀疑点。

### 待确认

- 具体失效件是卡座弹片高度、卡托限位、SIM 厚度公差、SIM 变形，还是整机结构压合不足。
- 量产处理动作是调整卡座/卡托结构、提升触点弹力、增加压合余量，还是限定 SIM 厚度/供应商。

## 平台差异检查

- 本 case 是 UNISOC Dahlia singlesim，不能直接套用双卡 card2 掉卡结论。
- 历史 Dahlia 451H card2 掉卡案例提示：Dahlia 系列遇到识卡后掉卡时，应优先把 AP SIM state、modem SIM event 和示波器波形对齐，尤其关注 SIM power、IO、RST、CLK。
- 本 case 已经由贴纸增厚实验闭环到卡座/卡托/SIM 压合接触不足。若后续硬件拆解确认具体器件或尺寸公差，需要补充到最终处理动作。

## 可能原因排序

| 优先级 | 方向 | 理由 | 下一步 |
|---|---|---|---|
| P0 | 卡座/卡托/SIM 压合接触不足 | 贴纸增厚后 ATR/ICCID 立即恢复 | 检查卡座弹片高度、卡托限位、SIM 厚度和触点压痕 |
| P1 | VSIM/RST/CLK/IO 接触边界异常 | 未贴纸时上电后无 ATR，贴纸后有 ATR | 对比未贴纸/贴纸后波形，确认是否为接触断续 |
| P2 | SIM_DET/EIC 抖动 | 故障 log 中 present 后回落到 absent/error | 若结构确认无问题，再抓 SIM_DET 波形和 EIC 去抖 |
| P3 | AP Framework subscription 链路 | OK log 已经能建 subscription | 暂不作为根因方向 |

## 处理方案

1. 不要把贴纸作为量产修复，只作为定位验证手段。
2. 硬件侧检查卡座弹片高度、触点压痕、卡托限位、SIM 厚度公差和整机结构压合余量。
3. 用未贴纸/贴纸后两组状态同步对比 VSIM/RST/CLK/IO 和 SIM_DET 波形。
4. 量产修复建议优先从结构压合和卡座触点可靠性入手；软件侧当前无修复点。
5. 若硬件给出具体器件或尺寸结论，再补充到本 case 的最终处理动作。

## 复盘

看到“插卡无反应”时不要直接跳到 AP 订阅链路。只要 log 中出现过短暂 `CARDSTATE_PRESENT`，就应继续确认 ATR、ICCID、EIC、上电和波形；无 ATR 的第一坏点通常在卡接触/电气/热插拔链路。

本 case 的关键闭环是单变量实验：SIM 背面贴纸增厚后，OK log 中 ATR/ICCID 和 subscription 都恢复，说明根因在物理接触压合，而不是软件流程。

---
quality: curated
doc_type: case
domain: Registration
rat: LTE
feature: LTE registration recovery
platform: UNISOC
layer: AP/Modem
symptom: 飞行模式关闭后LTE快速回网
cause: normal-flow
operator: China Unicom / 46001
project:
chipset:
vendor_customization:
android_version:
modem_version:
source_log:
  - 'F:\Log\流程Log\展锐飞行模式开关注册\ylog'
  - 'F:\Log\流程Log\展锐飞行模式开关注册\ylog\modem\md_20260514-104312_armlog'
first_bad_point: none
confidence: high
status: closed
tags:
  - registration
  - lte
  - unisoc
  - airplane-mode
  - attach
---

# Case: UNISOC LTE飞行模式开关回网成功

## 基本信息

| 项目 | 内容 |
|---|---|
| 日期 | 2026-05-14 |
| 平台 | UNISOC / 展锐 |
| SIM/运营商 | China Unicom / `46001` |
| RAT | LTE |
| 场景 | 飞行模式开启后关闭，LTE重新注册 |
| 复现概率 | 本次样例为成功链路 |

## 用户现象

用户打开飞行模式后关闭，终端LTE快速回网，数据网络恢复。

## 结论

本例飞行模式开启时modem按PS power off / detach / shutdown链路收口；飞行模式关闭后走PS power on、重新Attach和默认承载建立。它不是单纯TAU恢复，而是一次重新Attach成功样例。

## 输入材料

- AP log：`F:\Log\流程Log\展锐飞行模式开关注册\ylog`
- Modem log：`F:\Log\流程Log\展锐飞行模式开关注册\ylog\modem\md_20260514-104312_armlog`
- 参考流程：[[LTE注册流程]]

## 时间线

| 时间 | 来源 | 事件 | 含义 | 重要性 |
|---|---|---|---|---|
| 10:43:15.097 | AP | `Tile.AirplaneModeTile handleClick airplaneModeEnabled=false` | 用户开启飞行模式 | 高 |
| 10:43:15.247 | AP | `SST setRadioPower power false` | AP请求关闭radio | 高 |
| 10:43:15.272 | AP | `onTearDownAllDataNetworks reason=AIRPLANE_MODE_ON` | 数据网络按飞行模式断开 | 高 |
| 10:43:16.045 | AP | `radioStateChanged 0` | radio off完成 | 高 |
| 10:43:17.695 | AP | `hasDeregistered=true, hasDataDetached=true` | AP确认离网/PS detach | 高 |
| 10:43:18.125 | AP | 再次点击飞行模式tile | 用户关闭飞行模式 | 高 |
| 10:43:18.424 | AP | `SST setRadioPower power true` | AP请求打开radio | 高 |
| 10:43:18.622 | AP | `radioStateChanged 1` | radio on完成 | 高 |
| 10:43:19.361 | AP | `hasRegistered=true, hasDataAttached=true` | LTE与数据已恢复 | 高 |
| 10:43:21.366 | AP | `newState=METERED` | 数据网络恢复可用 | 中 |
| 未对齐 | Modem | `AT+SFUN=5` | 进入PS power off / 飞行模式关闭协议栈链路 | 高 |
| 未对齐 | Modem | `EMM_ATTACH_REQUEST` / `EMM_ATTACH_ACCEPT` | 飞行模式关闭后重新Attach成功 | 高 |

## 正常流程对比

参考流程：

- [[LTE注册流程]]

本例覆盖的主链路：

```text
飞行模式开启
-> AP setRadioPower false
-> modem PS power off / detach / shutdown
-> 飞行模式关闭
-> AP setRadioPower true
-> modem PS power on
-> 小区选择 + MIB/SIB
-> RRC建链
-> Attach + 默认承载
-> AP ServiceState / data恢复
```

## 第一个异常点

```text
第一个坏点：无，本例是成功样例。
上一条正常证据：radioStateChanged=1、EMM_ATTACH_ACCEPT、默认承载accept。
下一条异常证据：无。
```

## 关键证据

### 飞行模式开启：PS power off / detach / shutdown

```text
AT+SFUN=5
APP_MN_PS_POWER_OFF_CNF
MSG_ID_MN_PHONE_PS_POWER_OFF_REQ
MSG_ID_MNM_PHONE_DEACTIVATE_PROTOCOL_STACK_REQ
MSG_ID_GMMREG_POWEROFF_PS_REQ
MSG_ID_MMCTRL_EMM_SWITH_OFF_REQ
MSG_ID_MM_PLM_DEACT_REQ
MSG_ID_GMMREG_DETACH_CNF
MSG_ID_EMM_DETACH_UE_REQUEST
MSG_ID_CMD_RLM_DETACH_REQUEST
MSG_ID_EMM_ESM_CLEAN_UP_EPS_BEARERS_IND
MSG_ID_CMD_ASM_SHUT_DOWN
MSG_ID_CMD_RLM_SHUT_DOWN
MSG_ID_HAL_SEC_POWER_OFF_PROTOCOL_COMPLETE
MSG_ID_GMMREG_POWEROFF_PS_CNF
MSG_ID_MNM_PHONE_DEACTIVATE_PROTOCOL_STACK_CNF
```

### 飞行模式关闭：PS power on + re-Attach

```text
MSG_ID_MN_PHONE_PS_POWER_ON_REQ
MSG_ID_GMMREG_DEFAULT_APN_CFG_REQ
MSG_ID_MMCTRL_EMM_ATTACH_REQ
MSG_ID_GMMREG_POWERON_PS_REQ
MSG_ID_MMCTRL_EMM_POWER_UP_REQ
MSG_ID_CMD_ASM_POWER_ON
MSG_ID_CMD_RLM_POWER_ON
MSG_ID_EMM_ESM_POWER_ON_REQ
MSG_ID_ESM_EMM_POWER_ON_CNF
MSG_ID_LTEAS_POWER_ON_CONFIRM_IND
MSG_ID_EMM_PLM_POWER_ON_COMP_IND
MSG_ID_MM_PLMN_INFO_IND
MSG_ID_CMD_ASM_SELECT_CELL_REQUEST
MSG_ID_CMD_RLM_SELECT_CELL
MSG_ID_LTE_CPHY_FREQ_SEARCH_CELL_REQ / CNF
MSG_ID_IND_PAL_CELL_DETECTED
MSG_ID_LTE_CPHY_SYNC_REQ / CNF
MSG_ID_LTE_CPHY_MIB_IND
MSG_ID_BCCH_BCH_MSG_TYPE
MSG_ID_LTE_CPHY_SIB1_CONFIG_REQ / CNF
MSG_ID_LTEAS_PLMN_LIST_IN_IND
NAS_UE_MSG_IND_AS_AL_PLMN_FOUND
MSG_ID_LTEAS_CELL_SELECT_CNF
MSG_ID_ESM_PDN_CONNECTIVITY_REQUEST
MSG_ID_EMM_ATTACH_REQUEST
MSG_ID_CMD_ASM_ESTABLISH_CONNECTION_REQUEST
MSG_ID_CMD_RLM_CONNECTION_REQUEST
RRCCONNECTIONREQUEST
RRCCONNECTIONSETUP
RRCCONNECTIONSETUPCOMPLETE
MSG_ID_EMM_AUTHENTICATION_REQUEST / RESPONSE
MSG_ID_EMM_SECURITY_MODE_COMMAND / COMPLETE
MSG_ID_ESM_ESM_INFORMATION_REQUEST / RESPONSE
MSG_ID_EMM_ATTACH_ACCEPT
MSG_ID_ESM_ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_REQUEST / ACCEPT
MSG_ID_EMM_ATTACH_COMPLETE
MSG_ID_GMMREG_ATTACH_CNF
MSG_ID_SMREG_PDP_ACTIVATE_DEFAULT_IND
MSG_ID_MNM_PHONE_ATTACH_CNF
```

## 异常分析

### 事实

- AP侧从开启飞行模式到确认 `hasDeregistered=true/hasDataDetached=true`，radio off链路闭合。
- AP侧关闭飞行模式后，`radioStateChanged=1` 很快返回。
- Modem侧明确出现 `MMCTRL_EMM_ATTACH_REQ`、`EMM_ATTACH_REQUEST`、`EMM_ATTACH_ACCEPT`、默认EPS bearer request/accept。

### 推断

- 本次短间隔飞行模式恢复是re-Attach成功，不是只做TAU恢复。
- 如果类似问题不回网，应先分层：AP radio是否打开、modem是否PS power on、小区选择是否成功、RRC是否建立、Attach/默认承载是否完成。

### 待确认

- 项目、芯片、modem版本未从当前资料中整理出来。

## 平台差异检查

| 检查项 | 结果 |
|---|---|
| 是否只在单一平台复现 | 本例为UNISOC成功样例 |
| Qualcomm/MTK/UNISOC是否路径不同 | 使用展锐PS power on/off和 `MSG_ID_*` 内部消息 |
| 是否涉及NV或modem配置 | 未见异常 |
| 是否涉及vendor RIL实现 | AP侧RIL/Telephony用于确认radio和注册态恢复 |
| 是否需要平台侧工具解析 | Logel / armlog |

## 可能原因排序

| 排名 | 可能原因 | 证据 | 置信度 |
|---|---|---|---|
| 1 | 正常飞行模式回网 | AP radio恢复、modem re-Attach、默认承载均成功 | 高 |

## 处理方案

- 临时规避：无。
- 正式修复：无。
- 需要供应商/运营商确认：无。

## 复盘

下次遇到类似问题，优先检查：

- 关闭飞行模式后是否收到 `radioStateChanged=1`。
- Modem侧是否走到PS power on和小区选择。
- 是重新Attach，还是TAU/Service Request恢复。

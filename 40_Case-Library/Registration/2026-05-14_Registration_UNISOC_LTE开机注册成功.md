---
quality: curated
doc_type: case
domain: Registration
rat: LTE
feature: LTE registration
platform: UNISOC
layer: AP/Modem/Network
symptom: 开机后LTE注册成功
cause: normal-flow
operator: China Unicom / 46001
project:
chipset:
vendor_customization:
android_version:
modem_version:
source_log:
  - 'F:\Log\流程Log\展锐Lte注册流程\ylog\poweron\modem\md_20260514-091138_armlog'
  - 'F:\Log\流程Log\展锐Lte注册流程\ylog\ap\001-0514_091134--0514_091333_poweron'
first_bad_point: none
confidence: high
search_tier: case_summary
status: closed
tags:
  - registration
  - lte
  - unisoc
  - poweron
  - attach
  - esm
---

# Case: UNISOC LTE开机注册成功样例

## 基本信息

| 项目 | 内容 |
|---|---|
| 日期 | 2026-05-14 |
| 平台 | UNISOC / 展锐 |
| SIM/运营商 | China Unicom / `46001` |
| RAT | LTE |
| 场景 | 开机注册 |
| 复现概率 | 本次样例为成功链路 |

## 用户现象

开机后终端完成LTE找网、驻留、Attach、默认承载建立，AP侧最终进入LTE IN_SERVICE。

## 结论

这是一次完整的UNISOC LTE开机注册成功样例，可作为后续注册失败问题的正常流程对照。

## 输入材料

- Modem log：`F:\Log\流程Log\展锐Lte注册流程\ylog\poweron\modem\md_20260514-091138_armlog`
- AP log：`F:\Log\流程Log\展锐Lte注册流程\ylog\ap\001-0514_091134--0514_091333_poweron`
- 参考流程：[[LTE注册流程]]

## 时间线

| 时间 | 来源 | 事件 | 含义 | 重要性 |
|---|---|---|---|---|
| 09:12:21 | AP | `UNSOL_RESPONSE_RADIO_STATE_CHANGED` | AP侧看到modem radio on | 高 |
| 09:12:21 | AP | `UNSOL_RESPONSE_SIM_STATUS_CHANGED` | SIM状态刷新，触发注册状态poll | 中 |
| 09:12:22 | AP | `DATA/VOICE_REGISTRATION_STATE REG_HOME LTE` | AP侧收到LTE注册成功状态 | 高 |
| 09:12:24 | AP | `SST Poll ServiceState done` | Voice/Data均为IN_SERVICE | 高 |
| 09:13:10 | AP | `SET_DATA_PROFILE` / `SET_INITIAL_ATTACH_APN` | APN profile下发给RIL | 中 |
| 未对齐 | Modem | `AT+SFUN=4` | AP激活协议栈/射频相关流程 | 高 |
| 未对齐 | Modem | `MSG_ID_CMD_ASM_SELECT_CELL_REQUEST` | 发起LTE小区选择 | 高 |
| 未对齐 | Modem | MIB/SIB1/SIB2成功，`Cell is Suitable` | 小区可驻留 | 高 |
| 未对齐 | Modem | `ATTACH_ACCEPT` + 默认EPS bearer request/accept | NAS/ESM注册成功 | 高 |
| 未对齐 | Modem | `MSG_ID_GMMREG_ATTACH_CNF` / `MSG_ID_MNM_PHONE_ATTACH_CNF` | 展锐内部确认Attach完成 | 高 |

## 正常流程对比

参考流程：

- [[LTE注册流程]]

本例覆盖的主链路：

```text
AT+SFUN=4
-> PLMN/RAT选择
-> 频点搜索
-> MIB/SIB1/SIB2
-> Cell is Suitable
-> RRCConnectionRequest / Setup / SetupComplete
-> Attach Request
-> Authentication / Security Mode
-> Attach Accept
-> Activate Default EPS Bearer Context Request / Accept
-> Attach Complete
-> AP ServiceState IN_SERVICE
```

## 第一个异常点

```text
第一个坏点：无，本例是成功样例。
上一条正常证据：Attach Accept + 默认EPS bearer accept。
下一条异常证据：无。
```

## 关键证据

### AP激活与选网前置

```text
AT+SFUN=4
ue_prefer_rat=0x13
user_preferred_rat=0x2
user_prefer_multimode_rat=0x10
current_rat=0x10
rplmn id=46001f
```

### 找网、驻留与系统消息

```text
plm_send_cell_select_req_to_lteas(history_frequency_srch=0, is_search_lte_pre_freq=0)
MSG_ID_LTE_CPHY_FREQ_SEARCH_CELL_REQ
MSG_ID_LTE_CPHY_FREQ_SEARCH_CELL_CNF
MSG_ID_LTE_CPHY_SYNC_REQ
MSG_ID_LTE_CPHY_SYNC_CNF
MSG_ID_LTE_CPHY_BCCH_CONFIG_REQ(MIB)
MSG_ID_LTE_CPHY_MIB_IND
Receive SIB1 successfully
MSG_ID_LTE_CPHY_SIB1_CONFIG_REQ / CNF
LTE is on PLMN 46001 (CAMPED_PLMN)
Cell is Suitable
Receive SIB2 successfully
MSG_ID_LTE_CPHY_IDLE_CONFIG_REQ / CNF
Cell 159 on frequency 2452 is selected
```

### Attach与默认承载成功链

```text
PDN_CONNECTIVITY_REQUEST
ATTACH_REQUEST
RRCCONNECTIONREQUEST
RRCCONNECTIONSETUP
RRCCONNECTIONSETUPCOMPLETE
UECAPABILITYENQUIRY
UECAPABILITYINFORMATION
IDENTITY_REQUEST
IDENTITY_RESPONSE
AUTHENTICATION_REQUEST
AUTHENTICATION_RESPONSE
SECURITY_MODE_COMMAND
SECURITY_MODE_COMPLETE
ESM_INFORMATION_REQUEST
ESM_INFORMATION_RESPONSE
RRCCONNECTIONRECONFIGURATION
RRCCONNECTIONRECONFIGURATIONCOMPLETE
ATTACH_ACCEPT
ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_REQUEST
ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_ACCEPT
ATTACH_COMPLETE
EMM_INFORMATION
```

展锐内部确认：

```text
MSG_ID_EMM_MMCTRL_ATTACH_CNF
MSG_ID_GMMREG_ATTACH_CNF
MSG_ID_MNM_PHONE_ATTACH_CNF
```

AP侧确认：

```text
DATA/VOICE_REGISTRATION_STATE
regState: REG_HOME
rat: LTE
registeredPlmn: 46001
SST Poll ServiceState done
mVoiceRegState=0(IN_SERVICE)
mDataRegState=0(IN_SERVICE)
```

## 异常分析

### 事实

- `AT+SFUN=4` 后出现PLMN/RAT选择、小区搜索、MIB/SIB读取和驻留成功证据。
- NAS侧完成Attach、鉴权、安全模式、默认EPS bearer激活。
- AP侧最终上报 `REG_HOME` / `IN_SERVICE`。
- 该包 `log_stat` 曾显示少量丢包，主链路完整，个别内部消息缺失时应结合前后状态判断。

### 推断

- 该样例可作为UNISOC LTE开机注册的正常模板。
- 如果后续失败样例缺失其中任一阶段，应按“上一条正常证据 + 下一条异常证据”定位第一坏点。

### 待确认

- 项目、芯片、modem版本未从当前资料中整理出来。

## 平台差异检查

| 检查项 | 结果 |
|---|---|
| 是否只在单一平台复现 | 本例为UNISOC成功样例 |
| Qualcomm/MTK/UNISOC是否路径不同 | 使用展锐 `MSG_ID_*` 内部消息 |
| 是否涉及NV或modem配置 | 未见异常 |
| 是否涉及vendor RIL实现 | AP侧仅作为状态同步确认 |
| 是否需要平台侧工具解析 | Logel / armlog |

## 可能原因排序

| 排名 | 可能原因 | 证据 | 置信度 |
|---|---|---|---|
| 1 | 正常注册成功 | Attach、默认承载、AP ServiceState均成功 | 高 |

## 处理方案

- 临时规避：无。
- 正式修复：无。
- 需要供应商/运营商确认：无。

## 复盘

下次遇到类似问题，优先检查：

- `AT+SFUN=4` 后是否进入PLMN/RAT选择。
- 是否完成MIB/SIB1/SIB2读取和 `Cell is Suitable`。
- 是否同时看到 `ATTACH_ACCEPT`、默认EPS bearer accept、`ATTACH_COMPLETE`。
- AP侧是否同步到 `REG_HOME` / `IN_SERVICE`。

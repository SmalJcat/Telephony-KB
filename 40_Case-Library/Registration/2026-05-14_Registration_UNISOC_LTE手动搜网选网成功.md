---
quality: curated
doc_type: case
domain: Registration
rat: LTE
feature: manual network selection
platform: UNISOC
layer: AP/Modem/Network
symptom: 手动搜网后选择46001并保持LTE注册
cause: normal-flow
operator: China Unicom / 46001
project:
chipset:
vendor_customization:
android_version:
modem_version:
source_log:
  - 'F:\Log\流程Log\展锐手动搜网\ylog'
  - 'F:\Log\流程Log\展锐手动搜网\ylog\modem\md_20260514-104542_armlog'
first_bad_point: none
confidence: high
status: closed
tags:
  - registration
  - lte
  - unisoc
  - manual-network-selection
  - plmn-search
  - tau
---

# Case: UNISOC LTE手动搜网选网成功

## 基本信息

| 项目 | 内容 |
|---|---|
| 日期 | 2026-05-14 |
| 平台 | UNISOC / 展锐 |
| SIM/运营商 | China Unicom / `46001` |
| RAT | LTE |
| 场景 | 手动搜网、选择PLMN |
| 复现概率 | 本次样例为成功链路 |

## 用户现象

用户触发可用网络扫描，列表返回多个PLMN；用户选择 `46001` 后，AP侧确认手动选网模式并保持LTE `REG_HOME`。

## 结论

本例是手动搜网/选网成功样例。Modem侧流程是PLMN list search、停止搜索返回列表、`AT+COPS=1,2,"46001",7` 手动选择、`GMMREG_USER_SELECT_PLMN_CNF`确认，随后通过TAU/Service Request保持或恢复EPS上下文，不是从零开始的完整Attach。

## 输入材料

- AP log：`F:\Log\流程Log\展锐手动搜网\ylog`
- Modem log：`F:\Log\流程Log\展锐手动搜网\ylog\modem\md_20260514-104542_armlog`
- 参考流程：[[LTE注册流程]]

## 时间线

| 时间 | 来源 | 事件 | 含义 | 重要性 |
|---|---|---|---|---|
| 10:45:49.161 | AP | `RILJ START_NETWORK_SCAN [PHONE0]` | 用户触发手动搜网 | 高 |
| 10:45:49.188 | AP | `START_NETWORK_SCAN {scanStatus=1, scanError=0}` | 扫描请求被接受 | 中 |
| 10:45:52.177 | AP | `UNSOL_NETWORK_SCAN_RESULT scanStatus=1` | 中间扫描结果 | 中 |
| 10:45:55.194 | AP | `UNSOL_NETWORK_SCAN_RESULT scanStatus=1` | 继续返回候选网络 | 中 |
| 10:46:04.172 | AP | `RILJ STOP_NETWORK_SCAN [PHONE0]` | 用户/系统停止扫描 | 中 |
| 10:46:04.230 | AP | `UNSOL_NETWORK_SCAN_RESULT scanStatus=2, scanError=0` | 扫描结束 | 高 |
| 10:46:08.056 | AP | `QUERY_NETWORK_SELECTION_MODE {1}` | AP侧确认手动选网模式 | 高 |
| 10:46:08.057 | AP | `DATA_REGISTRATION_STATE REG_HOME LTE` | 数据域保持LTE注册 | 高 |
| 10:46:08.065 | AP | `VOICE_REGISTRATION_STATE REG_HOME LTE` | 语音域保持LTE注册 | 高 |
| 10:46:08.129 | AP | `isManualNetworkSelection=true(manual)` | Framework确认manual mode | 高 |
| 未对齐 | Modem | `MN_PHONE_PLMN_LIST_REQ` / `USER_SEARCH_PLMN_REQ` | Modem开始PLMN列表搜索 | 高 |
| 未对齐 | Modem | `APP_MN_PLMN_LIST_CNF` | 搜索停止并返回列表 | 高 |
| 未对齐 | Modem | `AT+COPS=1,2,"46001",7` | 用户选择联通LTE PLMN | 高 |
| 未对齐 | Modem | `GMMREG_USER_SELECT_PLMN_CNF` | 手动选网确认 | 高 |
| 未对齐 | Modem | `EMM_ESM_TAU_IND` / `EMM_SERVICE_REQUEST` | TAU/Service Request恢复或保持上下文 | 高 |

## 正常流程对比

参考流程：

- [[LTE注册流程]]

本例覆盖的主链路：

```text
START_NETWORK_SCAN
-> modem PLMN list search
-> PLMN_LIST_IN_IND / PLMN_FOUND
-> STOP_NETWORK_SCAN
-> APP_MN_PLMN_LIST_CNF
-> AT+COPS=1,2,"46001",7
-> USER_SELECT_PLMN_CNF
-> TAU / Service Request
-> AP QUERY_NETWORK_SELECTION_MODE=manual
-> DATA/VOICE REG_HOME LTE
```

## 第一个异常点

```text
第一个坏点：无，本例是成功样例。
上一条正常证据：APP_MN_PLMN_LIST_CNF、GMMREG_USER_SELECT_PLMN_CNF、REG_HOME LTE。
下一条异常证据：无。
```

## 关键证据

### 用户触发搜索网络列表

```text
MSG_ID_MN_PHONE_PLMN_LIST_REQ
MSG_ID_MNM_PHONE_GET_PLMN_LIST_REQ
MSG_ID_GMMREG_USER_SEARCH_PLMN_REQ
MSG_ID_CMD_ASM_RELEASE_CONNECTION_REQUEST
MSG_ID_CMD_RLM_CONNECTION_REQUEST
MSG_ID_MM_PLM_PLMN_SRCH_REQ
MSG_ID_CMD_ASM_START_PLMN_SEARCH
MSG_ID_CMD_RLM_PLMN_SEARCH_REQUEST
```

### 搜索过程中上报PLMN

```text
MSG_ID_CMD_RMH_POWER_SWEEP_IND
MSG_ID_LTE_CPHY_SUCC_SYNC_CELLS_IND
MSG_ID_LTE_PAL_SUCC_SYNC_CELLS_IND
MSG_ID_LTE_CPHY_BCCH_CONFIG_REQ
MSG_ID_LTE_CPHY_MIB_IND
MSG_ID_BCCH_BCH_MSG_TYPE
MSG_ID_BCCH_DL_SCH_MSG_TYPE
MSG_ID_LTEAS_PLMN_LIST_IN_IND
NAS_UE_MSG_IND_AS_AL_PLMN_FOUND
MSG_ID_GMMMN_PRE_NW_PLMN_IND
MSG_ID_MNM_PRE_NW_PLMN_IND
```

### 停止搜索并返回列表

```text
MSG_ID_MN_PHONE_ABORT_PLMN_SEARCH_REQ
MSG_ID_MNM_PHONE_PLMN_SELECTION_ABORT_REQ
MSG_ID_GMMREG_USER_ABORT_PLMN_SEARCH_REQ
MSG_ID_MM_PLM_ABORT_SEARCH_REQ
MSG_ID_CMD_ASM_STOP_PLMN_SEARCH
MSG_ID_CMD_RLM_PLMN_SEARCH_REQUEST
MSG_ID_LTE_CPHY_SYNC_CELL_STOP_REQ / CNF
APP_MN_PLMN_LIST_CNF
```

### 手动选择46001

```text
AT+COPS=1,2,"46001",7
MSG_ID_MN_PHONE_PLMN_SELECT_REQ
MSG_ID_MNM_PHONE_START_REG_REQ
MSG_ID_GMMREG_USER_SELECT_PLMN_REQ
MSG_ID_MM_PLM_PLMN_SEL_REQ
MSG_ID_CMD_ASM_SELECT_CELL_REQUEST
MSG_ID_CMD_RLM_SELECT_CELL
MSG_ID_LTE_CPHY_FREQ_SEARCH_CELL_REQ / CNF
MSG_ID_IND_PAL_CELL_DETECTED
MSG_ID_LTE_CPHY_SYNC_REQ / CNF
MSG_ID_LTE_CPHY_MIB_IND
MSG_ID_LTE_CPHY_SIB1_CONFIG_REQ / CNF
MSG_ID_LTEAS_CELL_SELECT_CNF
MSG_ID_EMM_ESM_TAU_IND
MSG_ID_GMMREG_USER_SELECT_PLMN_CNF
MSG_ID_MNM_PHONE_START_REG_CNF
APP_MN_PLMN_SELECT_CNF
OK
AT+COPS? -> +COPS: 1,2,"46001",7
```

### Service Request / RRC恢复

```text
MSG_ID_EMM_SERVICE_REQUEST
MSG_ID_CMD_ASM_ESTABLISH_CONNECTION_REQUEST
MSG_ID_CMD_RLM_CONNECTION_REQUEST
RRCCONNECTIONREQUEST
RRCCONNECTIONSETUP
RRCCONNECTIONSETUPCOMPLETE
MSG_ID_EMM_GMM_UPDATE_LTE_RRC_CONN_STATE_IND
MSG_ID_EMM_ESM_EST_CONN_CNF
MSG_ID_EMM_ESM_DRB_ESTABLISHED_IND
```

## 候选网络字段

| PLMN | 运营商 | `mRegistered` | EARFCN / PCI / TAC / CI | 信号 | 用途 |
|---|---|---|---|---|---|
| `46001` | China Unicom / CUCC | `YES` | `3737 / 139 / 59018 / 204952105` | `rsrp=-98`、`rsrq=-12` | 当前可用联通LTE候选/服务小区之一 |
| `46011` | China Telecom | `NO` | `3737 / 139 / 59018 / 204952105` | `rsrp=-98`、`rsrq=-12` | 同物理小区广播的其他PLMN |
| `46001` | China Unicom / CUCC | `YES` | `1650 / 251 / 59018 / 81839670` | `rsrp=-98`、`rsrq=-11` | 后续ServiceState稳定到该LTE小区 |
| `46011` | China Telecom | `NO` | `1650 / 251 / 59018 / 81839670` | `rsrp=-98`、`rsrq=-11` | 同小区多PLMN广播 |
| `46001` | China Unicom / CUCC | `YES` | `2452 / 159 / 59018 / 81810967` | `rsrp=-105~-108`、`rsrq=-17~-16` | 另一联通LTE候选 |
| `46000` | China Mobile | `NO` | `1300 / 8 / 22592 / 214164803` | `rsrp=-106`、`rsrq=-10` | 异运营商候选 |
| `46015` | China Broadnet | `NO` | `1300 / 8 / 22592 / 214164803` | `rsrp=-106`、`rsrq=-10` | 同小区多PLMN广播 |

## 异常分析

### 事实

- AP侧 `START_NETWORK_SCAN scanError=0` 只代表请求被接受，后续 `UNSOL_NETWORK_SCAN_RESULT` 才是网络列表。
- `STOP_NETWORK_SCAN` 后modem侧有 `APP_MN_PLMN_LIST_CNF`，表示列表搜索结束并返回。
- `AT+COPS=1,2,"46001",7` 后有 `GMMREG_USER_SELECT_PLMN_CNF` 和 `APP_MN_PLMN_SELECT_CNF`。
- 后续出现 `EMM_ESM_TAU_IND` 和 `SERVICE_REQUEST`，AP侧确认manual mode和LTE `REG_HOME`。

### 推断

- 本例是手动选网成功，不是从零Attach样例。
- 相同 `ci/pci/tac/earfcn` 下出现多个PLMN，是共享小区/多PLMN广播现象，不能理解为注册到多个运营商。

### 待确认

- 项目、芯片、modem版本未从当前资料中整理出来。

## 平台差异检查

| 检查项 | 结果 |
|---|---|
| 是否只在单一平台复现 | 本例为UNISOC成功样例 |
| Qualcomm/MTK/UNISOC是否路径不同 | 使用展锐PLMN list/search/select内部消息 |
| 是否涉及NV或modem配置 | 未见异常 |
| 是否涉及vendor RIL实现 | AP侧RIL/Telephony用于确认手动模式和注册态 |
| 是否需要平台侧工具解析 | Logel / armlog |

## 可能原因排序

| 排名 | 可能原因 | 证据 | 置信度 |
|---|---|---|---|
| 1 | 正常手动搜网/选网成功 | `APP_MN_PLMN_LIST_CNF`、`AT+COPS=1,2,"46001",7`、`GMMREG_USER_SELECT_PLMN_CNF`、AP `REG_HOME` | 高 |

## 处理方案

- 临时规避：无。
- 正式修复：无。
- 需要供应商/运营商确认：无。

## 复盘

下次遇到类似问题，优先检查：

- `START_NETWORK_SCAN` 后是否有真实 `UNSOL_NETWORK_SCAN_RESULT`。
- Modem侧是否有 `PLMN_LIST_IN_IND` 和 `APP_MN_PLMN_LIST_CNF`。
- 手动选择后是否有 `GMMREG_USER_SELECT_PLMN_CNF`。
- 如果注册态已存在，要按TAU/Service Request看，不要强行要求完整Attach。

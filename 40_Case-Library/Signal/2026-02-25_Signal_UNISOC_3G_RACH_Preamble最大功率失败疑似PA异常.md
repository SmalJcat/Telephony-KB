---
quality: curated
doc_type: case
domain: Signal
rat: LTE/3G
feature: 3G RACH / PA / RF calibration
platform: UNISOC
layer: Modem/WPHY/RF
symptom: "Safaricom LTE Attach Reject 后回落 3G，但 3G 下反复 RRCCONNECTIONREQUEST，状态栏空三角"
cause: "对比机 3G CS 注册成功，DUT 3G RACH preamble 始终发不成功且功率已打到最大，历史处理方向为检查 3G PA 在位、RF 校准或单机硬件"
operator: "Safaricom / Kenya"
project: "KN3"
chipset: "UMS9230E"
source_log: "CQWeb, see related Registration case"
related_case: "../Registration/2026-03-06_Registration_UNISOC_Kenya_Safaricom_LTE拒绝后3G建链失败.md"
first_bad_point: "WRRC_MM_SIGNALLING_ESTABLISH_CNF est_success=0，WPHY 显示 TX_RACH_Preamble 多次发送且功率达到网络/硬件上限"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - signal
  - rach
  - pa
  - rf-calibration
---

# 3G RACH Preamble 最大发射仍失败：疑似 PA / RF 单机异常

## 用户现象

肯尼亚 Safaricom 场景，设备无法驻网，状态栏显示空三角。开机后 LTE 找到小区并发起 Attach，但网络返回 `NO_SUITABLE_CELL_IN_TA`；随后回落到 3G，DUT 反复发起 `RRCCONNECTIONREQUEST` 仍建链失败。

## 结论

第一坏点不是 AP ServiceState，也不是 LTE reject 本身。对比机同卡在 3G HPLMN CS 注册成功，而 DUT 在 3G 下 RACH 失败，`RRCCONNECTIONREQUEST` 多次发送后 `est_success=0`。WPHY 进一步显示 RACH preamble 发送不成功，功率已经打到最大，历史处理方向是检查 3G PA 在位、RF 校准和单机硬件。

## 关键证据

LTE 阶段：

```text
ATTACH_REQUEST
ATTACH_REJECT
EMM_Cause = EMM_CAUSE_NO_SUIT_CELLS_IN_TA
```

3G 建链阶段：

```text
WRRC_MM_PLMN_CAMPING_CNF ARFCN=2971 PGC=64
RRCCONNECTIONREQUEST
WRRC_MM_SIGNALLING_ESTABLISH_REQ
WRRC_MM_SIGNALLING_ESTABLISH_CNF est_success = 0
GMMAS_ESTABLISH_REJ
```

WPHY 侧：

```text
Serving_Cell DL_UARFCN=2971, Band=8, PGC=64
Stored meas result ... ECN0_2=-53, RSCP=-468, RSSI=-416
TX_RACH_Preamble, Pre Power=86, Ramp_Offset=36, nv_max_power:26dbm, net_max_power:24 dbm
TX_RACH_Preamble, Pre Power=94, Ramp_Offset=38, nv_max_power:26dbm, net_max_power:24 dbm
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| LTE reject | `NO_SUITABLE_CELL_IN_TA` 是前置现象，后续 3G 回落失败需要单独分析 |
| 3G 建链 | 多次 `RRCCONNECTIONREQUEST` 后 `est_success=0`，说明失败发生在 AS/RACH 建链 |
| WPHY 发射 | preamble 功率打满仍失败，优先怀疑 PA/RF/校准/单机硬件 |
| 对比机 | 同卡同地 3G CS 注册成功，能排除纯网络侧不可用 |
| GSM only | 若 GSM 可连接但重启后 3G 不恢复，更支持 3G PA/RF 单链路异常 |

## 处理建议

- 先执行 RF 校准和 CRC 检查：

```text
AT+SGMR=0,0,3,0
AT+SGMR=0,0,3,1,1
AT+SGMR=0,0,3,3,1
AT+SPCALICRCCHECK
```

- 如果校准无异常，使用 Pandora 或射频工具读取 3G PA/RFFE 器件在位状态。
- 售后单机问题建议保留主板回寄分析，不要直接按平台软件问题推动 patch。
- 复测时保留 DUT/REF 的 modem ARM、WPHY/DSP、AP log，并记录同卡同地对比结果。

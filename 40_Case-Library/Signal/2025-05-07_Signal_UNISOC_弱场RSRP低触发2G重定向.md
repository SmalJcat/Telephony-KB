---
quality: curated
doc_type: case
domain: Signal
rat: LTE/GSM
feature: weak coverage / inter-RAT redirection / measurement threshold
platform: UNISOC
layer: Modem/LRRC/L1/RF
symptom: "斯里兰卡外场弱信号场景，DUT 无法长时间保持 4G，对比机可较长时间注册 4G"
cause: "同时间同小区下 DUT LTE RSRP 低于网络配置的异系统测量门限，网络下发到 GSM 的重定向；DUT 接收指标比对比机差，优先按 RF/天线/校准/弱场差异排查"
operator: "Sri Lanka field network"
project: "GH6911"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01502273"
first_bad_point: "DUT 在 LTE 小区上报测量后收到 RRCConnectionRelease redirectedCarrierInfo=GERAN，同时同时间 RSRP 约 -123 dBm，明显差于对比机约 -114 dBm"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - signal
  - weak-field
  - lte
  - redirection
---

# 弱场 RSRP 低触发 2G 重定向

## 用户现象

斯里兰卡外场弱信号场景，DUT 无法长时间保持 4G，等待一段时间后才可能重新注册；同场景对比机可以较长时间保持 4G。最初怀疑点是默认承载未建立或 `PDN_CONNECTIVITY_REQUEST` 未收到 accept。

## 结论

第一坏点不在 APN 或默认承载。DUT 在同一时间、同一 LTE 小区上的接收指标比对比机差，RSRP 已低于网络配置的异系统测量门限，随后网络下发 GSM 测控/重定向，UE 离开 LTE。该类问题应优先按弱场、天线朝向、手握、RF/天线/校准差异排查。

## 关键证据

DUT：

```text
LRRC: RMH: ASM signal information ... rsrp = -12309, rsrq = -1366, arfcn = 2530, cell_id = 186
LRRC: RMH: ASM signal information ... rsrp = -12304, rsrq = -1340, arfcn = 2530, cell_id = 186
LTE -> MEASUREMENTREPORT
LTE <- RRCCONNECTIONRECONFIGURATION
LTE <- RRCCONNECTIONRELEASE
redirectedCarrierInfo
    geran
        startingARFCN = 12
        bandIndicator = dcs1800
```

对比机：

```text
LRRC: RMH: ASM signal information ... rsrp = -11468, rsrq = -1306, arfcn = 2530, cell_id = 186
LRRC: RMH: ASM signal information ... rsrp = -11381, rsrq = -1206, arfcn = 2530, cell_id = 186
```

历史分析中还记录到同时间接收回报值：

```text
DUT two antennas: -123 dBm / -130 dBm
REF two antennas: -114 dBm / -127 dBm
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| 同时同地对比 | DUT/REF 必须同时间、同小区、同卡或同等卡状态测试 |
| RSRP/RSRQ/SINR | DUT 比 REF 差 8-10 dB 时，先按 RF/天线/校准差异处理 |
| 网络门限 | 低于网络配置的异系统测量门限后，网络可能要求测量 GSM/3G |
| 重定向证据 | `RRCConnectionRelease redirectedCarrierInfo=geran` 说明网络已指示离开 LTE |
| 默认承载 | 若 LTE 已被网络重定向，不要把后续数据不可用直接写成 APN/PDN 根因 |

## 处理建议

1. 复测时记录手机摆放、手握、天线朝向，DUT/REF 尽量并排同步抓 log。
2. 同步保留 AP log、modem ARM log、L1/DSP 测量日志，避免只有 AP 状态。
3. 若 DUT 稳定比 REF 低多个 dB，先做天线、RF path、RFFE/PA/RFIC 在位和校准检查。
4. 结论中分开写：LTE 是否注册过、是否默认承载建立、是否被网络重定向到 GSM、重定向前的射频指标。

## 来源

- CQWeb：`SPCSS01502273`

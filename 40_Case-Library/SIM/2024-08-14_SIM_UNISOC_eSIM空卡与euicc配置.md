---
quality: curated
doc_type: case
domain: SIM
rat: LTE/NR
feature: eSIM / SIM slot detection
platform: UNISOC
layer: SIM/Modem/RIL/Framework
symptom: "SIM1 + eSIM 设计中卡2 eSIM 不识别，AP 侧读不到有效 EID/ICCID"
cause: "卡2在 modem 侧已被识别为空 eSIM，但 AP/RIL/FW eSIM 能力与配置未完全打通；后续还需确认 euicc feature、RIL/FW diff、NV/RF资源配置"
operator:
project: "GH67A1"
chipset: "UMS9621S"
source_log: "CQWeb SPCSS01386630"
first_bad_point: "USIMDRV[1] 收到 ATR，但 EF/应用读取为空；AP GET_SIM_STATUS 显示 APPTYPE_UNKNOWN、ICCID/EID 为空"
confidence: medium
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - esim
  - euicc
---

# eSIM 空卡与 AP euicc 配置：卡2不识别

## 用户现象

项目设计为 SIM1 物理卡、SIM2 eSIM。调试时卡2 eSIM 不识别，早期测量显示 VSIM 有 1.8V，但 RST/CLK 信号异常。去掉项目 DTS 中对 SIM1 相关 pin 的复用配置后仍未解决。

## 结论

该问题不能只按“没有 RST/CLK”判断硬件坏点。modem log 后续显示卡2已经被识别为空 eSIM 并上报 AP，说明需要继续检查 AP eUICC feature、RIL/FW eSIM 修改和 eSIM 应用读取链路。

CQ 中平台侧给出的关键处理点：

- AP 侧需要添加 `android.hardware.telephony.euicc`，否则上层认为无 eSIM 功能。
- eSIM 调出后，还需要合入 modem/RIL/FW 侧 eSIM 相关修改。
- 平台提供 FWK/RIL 修改后，基本功能验证通过。
- 后续出现 modem assert 时，根因转为 NR N41 2T4R RF 资源分配失败；该项目不支持 N41 2T4R，需要使用更新的 NV 工程。

## 关键证据

```text
USIMDRV[1]: [CheckReceiveBuf] ALL ATR received
USIMDRV[1]: resp_data_len[0], sw [0x6a, 0x82]
ATC: BuildUnsolicitedInfo ... +ECIND: 3,0,0,2

RILJ:
GET_SIM_STATUS IccCardState {
  CARDSTATE_PRESENT,
  APPTYPE_UNKNOWN,
  atr=3B9F...,
  iccid=00000000000000000000,
  eid=
}
```

## 排查路径

| 层级 | 检查项 | 目标 |
|---|---|---|
| 硬件 | VSIM/RST/CLK/IO 波形 | 先确认 eSIM 上电和时钟是否存在 |
| Modem SIM | ATR、PPS、EF 选择返回值 | 区分无卡、空 eSIM、EF 读取失败 |
| AP feature | `android.hardware.telephony.euicc` | 确认 Settings/RIL 按 eSIM 设备处理 |
| RIL/FW | eSIM 相关 diff | 确认 EID/ICCID/slot port mapping 能正确上报 |
| NV/RF | NR N41 2T4R 配置 | 处理合入后出现的 modem assert |

## 处理建议

- eSIM 不识别时，不要只看 `CARDSTATE_PRESENT`，必须同步看 `APPTYPE`、`ICCID`、`EID`、ATR 和 EF 选择结果。
- 如果 modem 已经能收到 ATR，但 AP 显示空 EID/ICCID，优先检查 euicc feature 和 RIL/FW eSIM diff。
- 合入 eSIM 修改后如果出现 modem assert，需要重新分流到 NV/RF 资源配置，不要继续按 SIM 识别问题追。

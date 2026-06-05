---
quality: curated
doc_type: case
domain: Stability
rat: LTE
feature: modem boot / RFIC detection / radio unavailable
platform: UNISOC
layer: MODEM_CTRL / RF driver / hardware
symptom: "售后单机不识卡，查询不到 IMEI 和 modem 版本，RIL 返回 MODEM_NOT_ALIVE / radio_not_available"
cause: "sysdump 中 modem assert 指向 RFIC type 读取失败，g_rfic_type=-1 超出有效范围；历史处理方向为检查 RFIC 焊接或交叉 RFIC"
project: "A665L"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01290608"
first_bad_point: "Modem assert in drv_rf_iram.c when Get RFIC type, g_rfic_type=-1"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - stability
  - modem-boot
  - rfic
  - hardware
---

# RFIC 读取失败导致 modem 起不来

## 用户现象

售后单机不识卡，AP 层查询不到 IMEI 和 modem 版本。RIL/ATCI 侧只看到 modem 不在线：

```text
RIL: Modem is not alive, return radio_not_avaliable
RILC_EXT: sendCmdSync, response: ERROR: MODEM_NOT_ALIVE
ATCI: sendATCmd, call sendCmdSync response: ERROR: MODEM_NOT_ALIVE
```

## 结论

第一坏点不在 SIM 识别，也不在 AP Telephony。sysdump 指向 modem 启动/初始化阶段读取 RFIC type 失败，`g_rfic_type=-1` 超出有效 RF type 范围，导致 modem assert 后 AP 看到 `MODEM_NOT_ALIVE`。

历史处理方向是检查 RFIC 焊接或交叉 RFIC。售后单机应转硬件分析，不应拆成“不识卡”“IMEI 为空”“modem 版本为空”多个业务问题分别排查。

## 关键证据

```text
assert_info_buf =
"Modem Assert in file drv_rf_iram.c at line 321
 exp=g_rfic_type < MAX_NUM_RF_TYPE
 info=[when Get RFIC type, g_rfic_type=-1, exceed MAX_NUM_RF_TYPE=24]"
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| AP 现象 | `MODEM_NOT_ALIVE` / `radio_not_available` 只是结果 |
| dump 完整性 | ylog/minidump 不够时要补 modem dump 或 full sysdump |
| assert 模块 | `drv_rf_iram.c` / RFIC type 读取失败指向 RF 初始化或硬件 |
| 单机/批量 | 单机优先查焊接、RFIC 在位、器件混料、板级问题 |
| 业务连带 | 不识卡、IMEI 空、modem 版本空都可能是 modem 未起后的连带现象 |

## 处理建议

1. 先确认是否有 modem dump/full dump；只有 AP `radio_not_available` 不足以定根因。
2. 如果 assert 指向 RFIC type 读取失败，保留主板并转 RF/硬件分析。
3. 用射频工具或产线工具确认 RFIC/RFFE 在位状态，必要时做交叉板和焊接检查。
4. 结论中明确写“AP 业务不可用是 modem 未起后的结果”，避免误导 SIM/Registration 排查。

## 来源

- CQWeb：`SPCSS01290608`

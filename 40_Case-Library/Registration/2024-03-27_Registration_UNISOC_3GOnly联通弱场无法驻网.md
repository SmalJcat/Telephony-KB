---
quality: curated
doc_type: case
domain: Registration
rat: 3G
feature: PLMN selection / cell camping
platform: UNISOC
layer: Modem/WPHY/WAS
symptom: "卡2联通卡在 3G only 下无法驻网，状态栏空三角"
cause: "弱 3G 环境下全 Band power sweep 未上报目标小区；对比机因历史频点直接测量到 10763/298，流程差异导致驻网结果不同"
operator: "China Unicom"
project: "P671L"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01316717"
first_bad_point: "WRRC_MM_PLMN_CAMPING_REQ 后全 Band 测量未获得可驻留小区，随后 WRRC_MM_NO_CELL_IN_PLMN_IND / PLMN_SEL_FAILURE"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - registration
  - 3g
  - plmn-selection
---

# 3G only 联通弱场无法驻网：全 Band 测量与历史频点差异

## 用户现象

双卡场景下，卡 1 和卡 2 均为联通卡。卡 2 设置为 3G only 后无法驻网，AP 侧持续上报 `NOT_REG_MT_NOT_SEARCHING_OP`，状态栏表现为空三角。

## 结论

这不是单纯的 AP 注册状态同步问题。第一坏点在 3G 测量/小区选择：测试机进行全 Band 搜索时未上报对比机驻留的 10763/298 小区，测到的其它小区又因信号弱出现 SFO fail，最终没有可驻留小区。

对比机之所以可以驻留，是因为它有历史频点信息，直接对 10763 做测量；测试机没有历史频点，走全 Band power sweep，10763 未过阈值，没有进入后续驻留判断。

## 关键证据

```text
AP:
VOICE_REGISTRATION_STATE ... regState: NOT_REG_MT_NOT_SEARCHING_OP, rat: UNKNOWN

Modem:
MSG_ID_RR_PLM_PLMN_SEL_FAILURE_IND MOD_RRC_2->MOD_PLM_2

测试机:
WRRC_MM_PLMN_CAMPING_REQ
WL1C_WRCC_INIT_MEAS_REQ
WRRC_MM_NO_CELL_IN_PLMN_IND
WRCC: SFO Failed

对比机:
Stored meas result, ARFCN = 10763, PGC = 298
WL1C_WRCC_INIT_MEAS_REQ ... Num_Meas = 1, DL_UARFCN[0] = 10763
WRCC_WRRC_SME_PLMN_CAMPING_CNF ... ARFCN = 10763, PGC = 298
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| AP 注册状态 | 只能说明未驻网，不能直接定位 framework |
| `PLMN_SEL_FAILURE_IND` | 需要继续追 WAS/WPHY 测量结果 |
| 测量方式 | 区分全 Band sweep 与指定频点 measurement |
| 历史频点 | 对比机可能因历史频点路径不同而更容易驻留 |
| 弱场 | SFO fail、power sweep 阈值未过时，优先按弱场/覆盖问题分析 |

## 处理建议

- 做对比测试时，确认测试机和对比机是否有相同历史频点上下文。
- 同卡同地点复测时，关注 `Num_Meas`、`DL_UARFCN`、`Stored meas result`、`SFO Failed`。
- 如果需要公平对比，可尝试让测试机获得相同历史频点后复测，避免把历史频点差异误判成平台驻网异常。
- 复盘时不要只看 AP 侧空三角，要沿 `PLMN_CAMPING_REQ -> WPHY meas -> CAMPING_CNF/NO_CELL` 往下找第一坏点。

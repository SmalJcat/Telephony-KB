---
quality: curated
doc_type: case
domain: Registration
rat: LTE/2G/3G
feature: PLMN selection / band capability
platform: UNISOC
layer: Modem/RRC/NAS/RF capability
symptom: "Spectranet 运营商无信号，LTE Attach Reject 后 2G/3G 也无法驻留"
cause: "出货地区配置不支持 Spectranet 所需 Band 40；对比复核后确认不是单机 modem 注册异常"
operator: "Spectranet / 62124"
project: "BF6"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01345057"
first_bad_point: "LTE cell select 后 Attach Reject: EMM_CAUSE_NO_SUIT_CELLS_IN_TA，并进入 LIMITED_SERVICE"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - registration
  - band-capability
  - attach-reject
---

# Spectranet 无信号：Band 40 不支持导致无法驻网

## 用户现象

同一台机器同一地点，Airtel 有信号，Spectranet 无信号。日志中 LTE 注册失败，随后 2G/3G 找网也失败，表现为多制式均无法驻留。

## 结论

最终场测复核发现，对比机插 Spectranet 卡也无网；问题本质是该出货地区手机配置不支持 Spectranet 所需 Band 40，不是 AP 状态同步、SIM 识别或单机 modem 异常。该类问题属于能力/出货配置限制，不能通过常规注册流程修复。

## 关键证据

```text
MSG_ID_LTEAS_CELL_SELECT_CNF
status = 0x3

ATTACH_REJECT
EMM_Cause = EMM_CAUSE_NO_SUIT_CELLS_IN_TA
emm_cause = 0xf:NO_SUITABLE_CELL_IN_TA

MSG_ID_RR_PLM_SYS_INFO_IND
service_type = LIMITED_SERVICE
access_tech_type = LTE_BAND
```

## 排查要点

| 检查项 | 说明 |
|---|---|
| 运营商所需频段 | 先确认项目出货配置是否支持该运营商关键 Band |
| 对比机条件 | 必须同卡、同地点、同时间抓开机驻网过程 |
| Attach Reject | `NO_SUITABLE_CELL_IN_TA` 不能只按 NAS reject 处理，需要结合 cell capability / band support |
| 2G/3G 失败 | 若 2G/3G 也无合适小区，应回到覆盖和能力矩阵确认 |

## 处理建议

- 遇到海外运营商无信号，先拉一张“项目支持 Band vs 运营商主力 Band”表。
- 抓 log 时同时提供测试机和对比机完整开机驻网过程，必要时进出飞行模式确保重新搜网。
- 如果确认出货配置不支持目标 Band，应按市场配置或项目定义关闭，而不是继续追 AP/RIL。

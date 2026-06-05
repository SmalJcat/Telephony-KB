---
quality: curated
doc_type: case
domain: SIM
rat: NA
feature: USIM EF / PLMN list / SMS parameters
platform: UNISOC
layer: SIM/UICC/AP/Modem
symptom: "认证需求确认：EF_PLMNwACT 与 EF_OPLMNwACT 容量、EF_SMSP 短信参数、USIM data download 行为和 UICC 去激活能力"
cause: "需求确认类问题；历史答复中 PLMN 列表容量和部分 SMS 能力为支持，UICC deactivate / re-activate 低功耗能力当时暂不支持"
operator: "generic certification"
project: "WM137"
chipset: "UWS6121EG"
source_log: "CQWeb SPCSS01630213"
first_bad_point: "需要先拆清 EF 文件、平台能力和当前 SIM 实际写入内容，避免把容量支持误解为当前卡内容或 UI 列表数量"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - usim
  - ef
  - sms
---

# PLMN 列表与 SIM 短信参数能力确认

## 用户现象

认证需求要求确认终端是否支持：

- `EF_PLMNwACT + EF_OPLMNwACT >= 50`
- 按 `EF_SMSP` 确定 SMS parameters
- command packet 至少 5 条拼接
- 收到 USIM data download 类型的 SMS-Deliver 时屏幕不显示内容
- 按 3GPP TS 31.102 低功耗要求 deactivate / re-activate UICC

## 结论

历史答复口径：

| 需求 | 历史结论 |
|---|---|
| `EF_PLMNwACT + EF_OPLMNwACT >= 50` | 支持 |
| 按 `EF_SMSP` 确定 SMS parameters | 支持 |
| command packet 至少 5 条拼接 | 支持 |
| USIM data download SMS-Deliver 不显示到屏幕 | 支持 |
| UICC deactivate / re-activate 低功耗能力 | 当时暂不支持，需走需求评估 |

## 排查要点

| 检查项 | 判断 |
|---|---|
| PLMN 容量 | 确认平台支持容量和当前 SIM 写入记录数，不要混成 UI 显示数量 |
| `EF_SMSP` | 确认 SMSC / SMS parameters 是否从 SIM 文件读到并传给 modem/AP |
| 拼接能力 | 区分协议能力、测试用例数量和实际短信业务限制 |
| USIM data download | 不应作为普通短信弹出；需要看 SMS-PP / UICC data download 路径 |
| UICC 低功耗 | radio off / flight mode 不等于 UICC deactivate |

## 处理建议

- 认证需求先按 EF 文件逐项拆开，不要用一个“SIM 支持/不支持”覆盖所有条款。
- 若客户要求 UICC deactivate / re-activate，需要明确是新增需求，不应按缺陷处理。
- SMS 相关需求落地后，还要用真实 `SMSDispatcher`、RILJ、modem CP/RP log 验证业务行为。
- PLMN 列表能力验证要同时保留 SIM EF 内容和平台读取/使用日志。

---
quality: curated
doc_type: case
domain: Call
rat: 2G/3G/LTE
feature: ECC / EF_ECC / PIN locked SIM
platform: UNISOC
layer: Modem/L4/MMI/ECC
symptom: "SIM PIN 未解锁界面，UE 把无卡默认紧急号码识别为 ECC，却没有按客户要求读取 SIM EF_ECC"
cause: "平台在 SIM_NOT_INITED 且 PLMN 紧急驻留状态下按无卡 ECC 口径处理；客户需求要求该状态按有卡 ECC 处理，只允许 EF_ECC 和 112/911 等有卡紧急号码"
operator: "operator certification"
project: "GR2631"
chipset: "UMS9117"
source_log: "CQWeb SPCSS00841322"
first_bad_point: "MMIAPIPHONE_GetSimExistedStatusEx 将 PIN 未解锁状态判为无卡，后续 MMIAPICC_IsEccByLocalConfig 走 Without SIM ECC"
confidence: high
status: summarized
tags:
  - cqweb
  - ecc
  - ef-ecc
  - pin-locked
  - without-sim
---

# PIN未解锁时 EF_ECC 与无卡 ECC 分类

## 用户现象

SIM 卡处于 PIN 输入界面时，客户要求：

- `112/911` 以及 SIM 卡 `EF_ECC` 中的号码按紧急号码处理。
- `000/08/110/118/119/999` 这类无卡默认紧急号码不应在该状态下按紧急号码处理。

实际表现是平台把 PIN 未解锁状态按无卡处理，因此 `000/08/110/118/119/999` 被识别为紧急号码，而 SIM `EF_ECC` 中的号码没有按预期识别。

## 结论

PIN 未解锁不是简单的“无卡”。如果运营商需求要求在 PIN prompt 状态读取 SIM `EF_ECC`，需要在 SIM 状态判断里把 `SIM_NOT_INITED + PLMN_EMERGENCY_ONLY` 视为有卡 ECC 场景，而不是直接回落到 Without SIM ECC。

## 关键证据

```text
MMIAPIPHONE_GetSimExistedStatusEx sim[0].status = 8, plmn status = 4
MMIAPIPHONE_GetSimExistedStatusEx Another sim[1].status = 7, plmn status = 0

MMIAPICC_IsEccByLocalConfig Without SIM tele_num=112
MMIAPICC_IsEccByLocalConfig Without SIM tele_num=110
MMIAPICC_IsEccByLocalConfig Without SIM tele_num=118
MMIAPICC_IsEccByLocalConfig Without SIM tele_num=119
MMIAPICC_IsEccByLocalConfig Without SIM tele_num=000
MMIAPICC_IsEccByLocalConfig Without SIM tele_num=08
MMIAPICC_IsEccByLocalConfig Without SIM tele_num=999
```

修正后的验证证据：

```text
MMIAPICC_IsEmergencyPartNum: ecc_code=123
MMIAPICC_IsEmergencyPartNum() is sim emc
MMIAPICC_IsEmergencyPartNum: ecc_code=456
MMIAPICC_IsEmergencyPartNum() is sim emc
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| SIM 状态 | PIN 未解锁、PUK、blocked、absent 要分开处理 |
| PLMN 状态 | `PLMN_EMERGENCY_ONLY` 时可能已紧急驻留，但 SIM 仍未 READY |
| EF_ECC | 是否已读取到 SIM 卡中的紧急号码 |
| 本地 ECC | 是否误走 Without SIM 默认列表 |
| 双卡 | 另一卡 absent / not initialized 可能影响“是否有卡”的综合判断 |

## 处理建议

在 PIN prompt 场景复测 ECC 时，至少覆盖：

1. 拨 `112/911`。
2. 拨 SIM `EF_ECC` 中的号码。
3. 拨无卡默认号码 `000/08/110/118/119/999`。
4. 双卡组合：一张 PIN locked、另一张 absent；一张 PIN locked、另一张 ready。

不要只看 UI 是否显示“紧急呼叫”，要同时看 ECC 分类函数、拨号命令类型和 modem call setup。

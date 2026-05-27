---
quality: curated
doc_type: case
domain: Call
rat: 2G/3G/LTE
feature: ECC / PUK locked SIM / domain selection
platform: UNISOC
layer: RTOS MMI / MN_CALL / ATC
symptom: "插入 PUK 被锁 SIM 卡后，在待机界面拨打 112/911 一直停留在紧急呼叫界面且无播报声音"
cause: "失败版本在 PUK locked 场景把紧急呼叫设置到 PS/IMS 域，成功对比机走 CS 域；需修正 ECC 属性和域选择条件"
project: "GF28A2"
chipset: "UMS9117S"
source_log: "CQWeb SPCSS01344396"
first_bad_point: "MSG_ID_MN_CALL_VOICE_CALL_SETUP_REQ 后 mncall_volte 显示 MO call domain 走失败域，而对比机同场景走 CS 域"
confidence: medium
status: summarized
tags:
  - cqweb
  - ecc
  - puk-locked
  - domain-selection
  - cs-call
---

# PUK 锁卡紧急呼叫误走 PS 域无声

## 用户现象

插入 PUK 被锁的 SIM 卡，在待机界面拨打 `112` / `911`，界面一直停留在紧急呼叫中，没有播报声音。解 PUK 后或对比版本同场景可以正常建立紧急呼叫。

## 结论

该问题不应先归因音频通路。历史 log 对比显示，失败版本把 PUK locked 场景下的紧急呼叫送到了 PS/IMS 方向；成功对比机走 CS 域。第一坏点在 ECC 类型属性和通话域选择，而不是号码配置本身。

## 关键证据

失败侧：

```text
MSG_ID_MN_CALL_VOICE_CALL_SETUP_REQ
mncall_volte: MO call domain:0
ATC_EnableVoiceCodec: dual_sys=0, is_enable=0, bVoiceEnable=0, is_close_audio=0
```

成功对比侧：

```text
MSG_ID_MN_CALL_VOICE_CALL_SETUP_REQ
mncall_volte: MO call domain:3
MNCALL: mn_call_CallBackFunc msg_type_1 = 0x800
mnphone_volte: setup local emrg attach
```

历史临时验证方向是在 `MMIAPICC_EmergencyCallCheckType` 中对本地 ECC 判断后补齐 ESCV 属性：

```c
ecc.call_type = NDT_ECC;
ecc.is_escv_present = TRUE;
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| SIM 状态 | PUK locked、PIN prompt、SIM ready、无卡要分开测 |
| 号码识别 | `112/911` 是否被 AP/MMI 识别为 ECC |
| ECC 属性 | `call_type`、`is_escv_present`、category/type 是否完整 |
| 域选择 | 对比 `mncall_volte: MO call domain`，确认走 CS 还是 PS/IMS |
| 音频现象 | 无声只是结果，不要跳过域选择直接查 codec |

## 处理建议

1. PUK/PIN 锁卡场景复测紧急呼叫时，同时提供失败机和对比机 log。
2. 先确认 `MMIAPICC_EmergencyCallCheckType` 的 ECC 判定和属性填充，再看 `MNCALL_JudgeCallDomain`。
3. 强制 3G only 复测可以帮助确认 CS 域是否可正常建立，但不能替代最终域选择修复。
4. 结论里分开写：号码是否识别为 ECC、选择了哪个域、哪个域的呼叫建立/音频失败。

## 来源

- CQWeb：`SPCSS01344396`

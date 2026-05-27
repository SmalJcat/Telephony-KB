---
quality: curated
doc_type: case
domain: IMS
rat: LTE
feature: SMS over IP / SMS over IMS
platform: MTK
layer: IMS/SDM/Modem/Network
symptom: "运营商要求 SMS over IP，但短信走 SGs/CS，或无语音项目未发起 IMS 注册导致短信失败"
cause: "IMS 注册、SDM 域选择、SMS over IP 白名单和 IMS profile 未形成闭环"
source_log: "internal technical case and imported SMS Outline notes"
first_bad_point: "未同时满足 IMS 注册可用、SMS over IP allowed、SGs 不优先、IMS profile sms_support/sms_network_types 打开"
confidence: medium
status: summarized
tags:
  - sms
  - ims
  - sms-over-ip
  - sms-over-ims
  - mtk
---

# SMS over IP / SMS over IMS 配置缺失

## 场景

运营商要求短信走 IP/IMS，而不是 SGs/CS。常见现象有三类：

- 无语音 / 无 VoLTE 项目仍要求支持 SMS over IMS，但设备没有发起 IMS 注册。
- 已经有 IMS 注册，但 SDM 仍选择 SMS over SGs。
- 已配置 SMS over IMS，但 `SMS over IP allowed` 或 IMS profile 能力未真正打开，导致走 CS/SGs 或 IMS 失败后回落。

## 排查过程

| 现象 | 第一判断 | 结论 |
|---|---|---|
| 无 VoLTE / 无语音能力，短信仍要求 IMS | 是否有 IMS REGISTER / IMS PDN | 没有 IMS 注册时，SMS over IMS 不可能成功 |
| 有 IMS 注册但短信走 SGs | SDM domain selection | 可能命中 SGs 优先表 |
| SDM 选择 IMS 后仍失败 | IMS profile / SIP capability | 只改 SDM 不够，IMS profile 必须声明 SMS over IP 能力 |
| IMS 失败后 CS/SGs 成功 | 网络提交路径 | 发送成功不代表满足运营商 SMS over IP 要求 |

## 关键配置

```text
custom_imc_config.c
nvram_ims_profile_ptr->ua_config.sms_network_types = 0x03
nvram_ims_profile_ptr->imc_config.sms_support = 1

custom_sdm_utility.c
sdm_cust_sms_over_ip_allowed_tbl
sdm_cust_prefer_sms_over_sgs_to_ims_tbl
sms_over_wifi_allowed_tbl

mcu/interface/service/nvram/iwlan_nvram_config.h
wans_ims_no_voice_sup_sms_enable = KAL_TRUE
```

配置含义：

| 配置 | 作用 | 典型问题 |
|---|---|---|
| `wans_ims_no_voice_sup_sms_enable` | 无语音 / 无 VoLTE 场景仍保持 IMS PDN/IMS 注册用于短信 | 关闭时无 IMS 注册，电信等要求 SMS over IMS 的卡可能无法发送 |
| `sdm_cust_prefer_sms_over_sgs_to_ims_tbl` | 命中 MCC/MNC 后 LTE 下优先走 SGs | 看到 `[SDM][ADS] Prefer SMS over SGs to IMS in LTE` |
| `sdm_cust_sms_over_ip_allowed_tbl` | 运营商维度控制是否允许 SMS over IP | 看到 `from SDM = KAL_FALSE` 时，SDM 禁止 IMS 短信 |
| `ua_config.sms_network_types` | IMS profile 声明 SMS over IP 支持的网络类型 | SDM 选 IMS 但 IMS profile 能力不足 |
| `imc_config.sms_support` | IMS profile 的 SMS over IP 总能力 | 未打开时无法形成完整 SMS over IMS 链路 |

## 关键日志

```text
[SDM][ADS] Prefer SMS over SGs to IMS in LTE
[SDM] Current SMS over IP config from RAC = SDM_SMS_OVER_IP_ALLOWED, from SDM = KAL_FALSE
AT+EIMSCFG=... <ims_sms>: 1
SIP MESSAGE / RP-DATA
+g.3gpp.smsip
```

判断口径：

- 只有 `AT+EIMSCFG` 显示 `ims_sms=1` 不够，还要看是否实际 IMS 注册、SDM 是否选择 IMS、SIP 是否携带 SMS over IP 能力。
- SGs/CS 成功只能说明短信可以发出；若运营商要求 SMS over IP，仍属于配置或域选不满足。
- 如果无语音项目为了移除 VoLTE 关闭了 IMS 注册，要单独确认是否仍需为 SMS over IMS 保留 IMS PDN/注册。

## 沉淀规则

SMS over IP 问题必须同时看 IMS 注册、域选择和 IMS profile。只让 SDM 选 IMS，不代表 IMS 侧具备 SMS over IP 能力；只看到短信发送成功，也不能证明满足 SMS over IMS 要求。

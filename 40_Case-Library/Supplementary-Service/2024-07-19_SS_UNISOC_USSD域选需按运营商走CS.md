---
quality: curated
doc_type: case
domain: Supplementary-Service
rat: LTE/3G
feature: USSD / domain selection / CSFB
platform: UNISOC
layer: Modem SS / IMS USSI / CS CISS
symptom: "运营商定制 USSD code 在 IMS/USSI 路径失败，期望回落 CS 执行"
cause: "运营商不支持或不期望 IMS USSD，DUT USSD 域选配置导致先走 IMS/USSI 返回 403"
source_log: "Imported supplementary-service notes and CQWeb xcap/USSD index"
first_bad_point: "USSD domain selection 配置与运营商支持域不一致"
confidence: medium
status: summarized
search_tier: case_summary
tags:
  - cqweb
  - ussd
  - supplementary-service
  - csfb
---

# USSD 域选：运营商只支持 CS 时不要强走 IMS/USSI

## 用户现象

输入运营商定制 USSD code 后，DUT 先走 IMS/USSI，返回失败；对比机可以回落 CS 并完成 USSD 交互。

## 结论

USSD 不是固定走 IMS。若运营商只支持 CS USSD，终端配置打开 IMS USSD/USSI 会导致错误域选。历史处理方向是关闭对应运营商的 IMS USSD 能力，让 USSD 走 CS。

典型配置点：

```text
custom_imc_config.c
nvram_ims_profile_ptr->imc_config.ussd_support = 0
```

## 关键证据

IMS/USSI 失败：

```text
AT+EIUSD=...
INVITE sip:*247%23;phone-context=eps...
SIP/2.0 403 Forbidden
+EIUSD: ...,403,...
```

CS 回落执行：

```text
EMM_Extended_Service_Request(service type="MO_CSFB")
MM__CM_SERVICE_REQUEST
CISS__REGISTER
CISS__FACILITY
CISS__RELEASE_COMPLETE
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| USSD入口 | `AT+ECUSD` / `AT+EIUSD` / MMI code |
| IMS路径 | 是否出现 SIP INVITE、403/4xx |
| CS路径 | 是否完成 CSFB 后出现 CISS REGISTER/FACILITY |
| 配置 | `ussd_support`、USSI、运营商 profile 是否按 MCC/MNC 匹配 |
| 对比机 | 成功机到底走 IMS USSD 还是 CS CISS |

## 处理建议

- 先用 log 证明对比机的成功域，不要凭 UI 表现判断。
- 如果运营商只支持 CS USSD，关闭该运营商 IMS USSD 能力，并回归普通 USSD 与 Call Forwarding/Call Barring。
- 如果必须支持 IMS USSD，继续查 SIP 403 原因、USSI profile、P-CSCF/XCAP/IMS 签约，不要直接改成 CS 掩盖问题。

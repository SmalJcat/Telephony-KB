---
quality: curated
doc_type: case
domain: Call
rat: LTE/UTRAN/GERAN
feature: SRVCC
platform: MTK
layer: IMS/Modem/Network
symptom: "哥伦比亚 Claro 运营商 VoLTE 通话 SRVCC 时电话结束"
cause: "当前资料只有排查口径，缺少 SRVCC 切换命令、目标 CS 建链和首个 release cause，不能闭合到单一根因"
source_log: "internal weekly technical case"
first_bad_point: "证据缺口在 SRVCC 切换阶段：需要先确认能力协商是否匹配，再看 mobility / CS 承接 / release cause"
confidence: medium
status: summarized_with_log_gap
---

# SRVCC Claro切换掉话

## 场景

VoLTE 通话过程中从 LTE 覆盖切换到 UTRAN/GERAN 覆盖，期望 SRVCC 保持通话连续，但现场反馈通话被结束。

## 结论

这不是一个已经闭合 root cause 的 case，而是 SRVCC 掉话的排查模板。当前第一坏点还不能直接落到“网络不支持”“IMS profile 错误”或“CS 侧失败”，因为缺少切换命令、目标 RAT 建链和首个释放原因。

可复用价值在于：SRVCC 掉话必须从能力协商开始排，不要只看最后的 disconnect。

## 第一轮排查口径

| 检查项 | 关键证据 |
|---|---|
| normal SRVCC 终端能力 | LTE Attach/TAU Request 的 `SRVCC to GERAN/UTRAN capability` |
| a/b/mid SRVCC 终端能力 | SIP `INVITE` / `1xx` / `2xx` 的 Contact feature tag |
| 网络支持能力 | `183 Session Progress` 或其他 `1xx/2xx` 的 `Feature-Caps` |
| MTK NV | `srvcc_feature_enable`、`force_srvcc_transfer` |
| 切换执行 | B2 测量、目标 RAT、小区、CS 侧建立、release cause |

## 关键字段示例

| 字段 | 判断 |
|---|---|
| `+g.3gpp.srvcc` | normal SRVCC |
| `+g.3gpp.srvcc-alerting` | aSRVCC |
| `+g.3gpp.ps2cs-srvcc-orig-pre-alerting` | bSRVCC |
| `+g.3gpp.mid-call` | hold/conference 等 mid-call SRVCC |

## 补证要求

| 证据 | 用途 |
|---|---|
| SIP INVITE / 183 / 180 / 200 OK | 判断终端和网络是否协商了目标 SRVCC 类型 |
| RRC measurement report / handover command | 判断是否真的触发 SRVCC mobility |
| MME / MSC / CS call control trace | 判断 CS 侧是否接住会话 |
| SIP BYE / CANCEL、Q.850 cause、modem release cause | 判断首个释放方 |
| 对比机同地点同卡 log | 区分运营商策略、终端配置和覆盖问题 |

## 沉淀规则

SRVCC 掉话不能只看最后的 release。必须从能力宣告开始，确认终端和网络对目标 SRVCC 类型是否达成一致，再向后看测量触发、mobility 执行和 CS 侧承接。

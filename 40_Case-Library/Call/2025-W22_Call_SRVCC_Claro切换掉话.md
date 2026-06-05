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
search_tier: supplemental
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

## 下次复现补证清单

| 必抓证据 | 具体内容 | 能证明什么 |
|---|---|
| AP radio/main log | call state、IMS call session、disconnect cause、通话开始/掉话时间点 | AP 看到的是 IMS 掉话、CS 承接失败还是用户侧释放 |
| modem IMS/SIP log | INVITE、183/180/200 OK、Feature-Caps、BYE/CANCEL、Reason/Q.850 | SRVCC 类型是否协商成功，首个释放方是谁 |
| modem RRC/NAS log | measurement report、B2/A2/A3、handover command、RAT change、TAU/RAU/LU | 是否真的进入 SRVCC mobility，而不是普通 RRC release |
| CS call control log | SETUP/ALERT/CONNECT/RELEASE、MM/CC cause、MSC 承接 | 目标 2G/3G CS 是否接住会话 |
| RF/小区信息 | LTE serving cell、目标 UTRAN/GERAN 小区、RSRP/RSRQ/SINR、路线 | 掉话是否由覆盖、目标小区不可用或切换门限触发 |
| 对比机同卡同地点 | 同一运营商、同一路线、同一时间窗口 | 区分运营商策略、覆盖问题和 DUT 配置/实现差异 |

判定口径：

- 没有 `handover command` / RAT change 证据时，只能写“VoLTE 通话掉话”，不能定性为 SRVCC 执行失败。
- 有 SRVCC command 但无 CS `CONNECT`，首坏点在 CS 承接或目标 RAT 建链。
- 有 CS `CONNECT` 后再释放，要看首个 release cause，不要只看 AP 最终 disconnect。

## 沉淀规则

SRVCC 掉话不能只看最后的 release。必须从能力宣告开始，确认终端和网络对目标 SRVCC 类型是否达成一致，再向后看测量触发、mobility 执行和 CS 侧承接。

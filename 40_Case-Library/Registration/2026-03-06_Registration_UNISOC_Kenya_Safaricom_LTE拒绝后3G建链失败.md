---
quality: curated
doc_type: case
domain: Registration
rat: LTE/3G
feature: PLMN selection / attach reject / 3G fallback
platform: UNISOC
layer: Modem/NAS/3G AS
symptom: "Kenya Safaricom 开机无法驻网，状态栏空三角"
cause: "LTE 侧收到 EMM cause 15 NO_SUITABLE_CELL_IN_TA，回落 3G 后 HPLMN CS 注册建链失败，RRC Connection Request 重复但未成功建立"
operator: "Safaricom Kenya"
project: "KN3"
chipset: "UMS9230E"
source_log: "CQWeb SPCSS01629027"
first_bad_point: "LTE ATTACH_REJECT cause 15 后，3G WRRC/MM signalling establish 失败，重复 RRCConnectionRequest"
confidence: high
status: summarized
tags:
  - cqweb
  - registration
  - attach-reject
  - no-suitable-cell
  - rach-fail
---

# Kenya Safaricom LTE 拒绝后 3G 建链失败

## 用户现象

Kenya Safaricom 卡开机无法驻网，状态栏显示空三角。测试机和对比机插同卡时，LTE 注册都失败，但对比机后续能在 3G HPLMN CS 注册成功，测试机 3G 建链失败。

## 结论

这个问题不能只看“LTE attach 被拒”。第一阶段 LTE 侧确实收到 `EMM_CAUSE_NO_SUITABLE_CELL_IN_TA`，属于网络/TA 维度拒绝；但后续回落 3G 时，测试机在 3G HPLMN CS 注册阶段建链失败，才是和对比机差异相关的第一坏点。

## 关键时间线

```text
14:17:46.899  -> PDN_CONNECTIVITY_REQUEST
14:17:46.899  -> ATTACH_REQUEST
14:18:21.279  <- ATTACH_REJECT, emm_cause = 0x0f:NO_SUITABLE_CELL_IN_TA
14:18:21.409  MSG_ID_PLM_AS_3G_PLMN_SEL_REQ
14:18:22.054  -> LOCATION_UPDATING_REQUEST
14:18:22.131  -> RRCCONNECTIONREQUEST
14:18:23.715  -> RRCCONNECTIONREQUEST
14:18:25.315  -> RRCCONNECTIONREQUEST
```

沟通结论中明确：测试机 3G 下 `rach fail` 导致建链失败；对比机 3G 下建链成功。

## 排查要点

| 检查项 | 判断 |
|---|---|
| LTE reject cause | `EMM cause 15` 说明当前 TA 不适合，不能直接归因 AP |
| reject 后动作 | 看是否触发 3G/2G PLMN selection 和 LU |
| 3G 建链 | `RRCCONNECTIONREQUEST` 重复、`WRRC_MM_SIGNALLING_ESTABLISH_CNF` 延迟/失败时转 3G AS |
| 对比机差异 | 同卡同地点时，对比机 LTE 也失败但 3G 成功，说明差异不在 LTE reject 本身 |

## 处理建议

- 先按 `LTE reject -> RAT fallback -> 3G LU/RRC 建链` 拆时间线，避免把后续 3G 坏点误写成 LTE 注册问题。
- 如果 LTE cause 15 同卡同网对比机也出现，先不要推动 AP 修改注册状态显示。
- 3G 建链失败要保留 3G AS/WPHY/RACH 相关 log，并确认是否弱场、RACH fail 或上行链路问题。

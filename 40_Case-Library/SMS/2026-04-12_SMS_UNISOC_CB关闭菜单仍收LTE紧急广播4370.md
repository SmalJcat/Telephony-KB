---
quality: curated
doc_type: case
domain: SMS
rat: LTE
feature: Cell Broadcast / emergency alert / MMI filtering
platform: UNISOC
layer: RTOS MMI / L4 / ETWS-CMAS
symptom: "关闭小区广播菜单后，LTE 模式仍能收到紧急广播 4370"
cause: "LTE 紧急广播 4370 属于强制类告警链路，普通小区广播菜单关闭不一定阻止底层上报"
project: "GX2781"
chipset: "UMS9117S"
source_log: "CQWeb SPCSS01634532"
first_bad_point: "把普通 CB 菜单开关等同于底层紧急广播接收开关"
confidence: high
status: summarized
tags:
  - cqweb
  - sms
  - cell-broadcast
  - emergency-alert
  - rtos
---

# 关闭 CB 菜单仍收到 LTE 紧急广播 4370

## 用户现象

客户关闭小区广播菜单后，LTE 模式下仍能收到紧急广播 `4370`。客户期望关闭菜单后不接收任何小区广播，包括紧急广播。

## 结论

历史 CQ 结论是：LTE 模式下，即使关闭普通小区广播功能，紧急广播 `4370` 仍可能被接收和上报。这不是普通 CB 菜单开关未生效，而是紧急广播链路和普通菜单开关边界不同。

如果产品侧明确要求不展示，建议在 MMI/UI 接口入口增加“小区广播功能是否开启”的判断并过滤展示；是否允许完全不接收需要结合地区法规和运营商要求确认。

## 关键证据

```text
APP_MN_ETWS_PRIM_IND
LTE mode
emergency broadcast 4370 can still be received when CB menu is disabled
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| RAT | 该结论针对 LTE 模式，2G/3G 需单独验证 |
| 信道类型 | `4370` 是否为紧急/强制告警类信道 |
| 底层上报 | 是否收到 `APP_MN_ETWS_PRIM_IND` 或 CBS 上报 |
| 菜单状态 | 普通 CB 菜单关闭不等价于底层拒收紧急告警 |
| 合规要求 | 屏蔽紧急告警前必须确认法规/运营商是否允许 |

## 处理建议

- 首先确认客户要求是“不接收”还是“不弹窗/不展示”。
- 若只要求 UI 不展示，可在 MMI 层根据 CB 开关状态过滤。
- 若要求底层不接收紧急广播，需要走法规和平台能力确认，不能按普通菜单开关直接改。
- 回归时覆盖 LTE、2G/3G、普通 CB 信道和紧急告警信道，避免只验证单一信道。

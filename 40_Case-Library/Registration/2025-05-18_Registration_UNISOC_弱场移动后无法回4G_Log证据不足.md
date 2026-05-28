---
quality: curated
doc_type: case
domain: Registration
rat: LTE/2G
feature: mobility / weak coverage / log requirement
platform: UNISOC
layer: Modem/LRRC/DSP
symptom: "从无信号区域移动到强信号区域后无法驻上 4G"
cause: "已有证据显示问题发生在弱场/边缘覆盖移动场景，但原始 log 时间点和 DSP 打点不完整，无法形成最终平台根因"
operator: "Vi India"
project: "it9120"
chipset: "UMS9117S"
source_log: "CQWeb SPCSS01497276"
first_bad_point: "目标 LTE 频点测量值极弱，后续卡在 2G 后未及时回 LTE；但 DSP 与 ARM 时间点未完全对齐"
confidence: medium
status: summarized_with_log_gap
tags:
  - cqweb
  - registration
  - mobility
  - weak-coverage
  - log-requirement
---

# 弱场移动后无法回 4G：先补齐 DSP/ARM 对齐证据

## 用户现象

Vi 运营商场景中，设备从弱信号区域移动到无信号区域，再移动到强信号区域后，无法驻上 Vi 4G 网络。

## 当前结论

沟通中能看到两个方向：一是目标 LTE 频点测量值很差，二是 DUT 卡 2 驻留 2G 后没有及时切回 LTE。研发侧同时指出原始 ARM log 与 DSP 打点时间点不匹配，部分阶段缺少 DSP 打点，因此不能直接形成平台根因。

这类 case 的价值在于提醒：移动弱场问题如果没有 DSP/L1 打点，只靠 AP 状态或 NAS 事件很容易误判。

## 关键证据

```text
目标频点 1357 的 RSRP 很差，DUT 测到约 -133 dBm
对比机对应时间点可驻留 B3 1357/241，但 RSRP/SNR 也很差
LRRC: S criteria is not satisfied
MSG_ID_RR_PLM_PLMN_SEL_FAILURE_IND
卡 2 驻留 2G 40420 后未及时切到 LTE
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| 时间点 | 场测必须记录复现时间点，ARM/DSP/netlog 要能对齐 |
| DSP/L1 打点 | LTE 弱场、测量、S criteria、同步失败必须看 DSP/L1 |
| 对比机 | 对比机也处于差覆盖时，不要直接定性 DUT 平台 bug |
| 回 4G 策略 | 2G 驻留后看 LTE reselection/search 是否按预期触发 |

## 处理建议

- 复测时同时保存 ARM log、DSP log、AP log，记录开始/结束时间点和移动路线。
- 对弱场移动问题，先确认覆盖和小区测量质量，再讨论平台回网策略。
- 若复现点无法补 log，只能沉淀为“证据不足样例”，不能作为代码修改依据。

## 下次复现补证清单

| 必抓证据 | 具体内容 | 能证明什么 |
|---|---|---|
| AP radio/main log | `ServiceState`、RILJ 注册态、网络模式、飞行/移动时间点 | AP 是否及时收到 modem 回网状态 |
| modem ARM log | LRRC/NAS/NWSEL、PLMN search、cell selection、TAU/attach、RAT change | 回 LTE 的触发点和失败点 |
| DSP/L1 log | 目标频点测量、同步、S criteria、RACH、L1 failure | 弱场/射频测量是否足以支持回 LTE |
| 时间对齐信息 | 开始移动、进入无服务、到强场、仍不回 LTE、恢复动作 | AP/ARM/DSP 三侧时间线能否对齐 |
| serving/neighbor cell | EARFCN/PCI/TAC/RSRP/RSRQ/SINR、2G/3G/LTE 小区列表 | 判断是覆盖差、候选小区不可用还是策略未触发 |
| 对比机同路线 | 同卡或同运营商、同地点、同时间窗口 | 区分环境覆盖和 DUT 行为差异 |
| 操作变量 | 是否锁网/锁频、是否手动选网、是否开关飞行恢复、SIM 卡槽 | 排除测试操作改变状态机 |

判定口径：

- DSP/L1 缺失时，不能把“不回 4G”定成 NAS/平台策略根因。
- 目标 LTE RSRP/SINR 本身很差时，优先写覆盖证据，不直接写终端 bug。
- DUT 和对比机都处在差覆盖时，只能比较搜索/测量/驻留决策差异，不能只比较最终图标。

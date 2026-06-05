---
quality: curated
doc_type: case
domain: Registration
rat: LTE/NR/3G/2G
feature: Manual network selection
platform: UNISOC
layer: Framework/Telephony/CarrierConfig
symptom: "手动选网成功或失败后的自动/手动模式保持策略不清晰"
cause: "UNISOC 手动选网流程受 oem_key_restore_auto_mode、oem_key_permanent_auto_sel_mode_bool 与 mShowNetworkSelectionFailed 共同影响"
operator:
project: "GH6571 / HMD"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01362804"
first_bad_point: "NetworkSelectSettings.java EVENT_SET_NETWORK_SELECTION_MANUALLY_DONE 分支决定 UI 返回值和网络选择模式"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - carrierconfig
  - manual-network-selection
  - framework-telephony
---

# 手动选网 CarrierConfig：成功/失败后是否返回自动模式

## 用户现象

客户需要确认手动选网后网络选择模式如何保持，以及两个 UNISOC CarrierConfig 开关的实际含义：

- `oem_key_restore_auto_mode`
- `oem_key_permanent_auto_sel_mode_bool`

## 结论

这两个开关决定手动选网成功或失败后是否回到自动选网模式。

| 配置项 | 默认值 | 生效场景 | 行为 |
|---|---:|---|---|
| `oem_key_restore_auto_mode` | `false` | 手动选网成功 | `false`：保持手动模式；`true`：成功后返回自动模式 |
| `oem_key_permanent_auto_sel_mode_bool` | `true` | 手动选网失败 | `true`：失败后返回自动模式；`false`：失败后保持手动模式 |
| `mShowNetworkSelectionFailed` | 项目配置决定 | 手动选网失败 UI | 为 `true` 时优先走失败弹框路径，相关自动模式逻辑可能被上层分支拦截 |

## 代码入口

```text
packages/apps/Settings/src/com/android/settings/network/telephony/NetworkSelectSettings.java

EVENT_SET_NETWORK_SELECTION_MANUALLY_DONE
```

核心分支：

```text
if (mShowNetworkSelectionFailed) {
    if (!isSucceed) {
        showNetworkSelectionFailed();
    }
} else {
    if (isSucceed && mOemRestoreAutoMode) {
        manual_select_success = false
        finish()
    } else if (!isSucceed && mOemPermanentAutoSelMode) {
        manual_select_success = false
        finish()
    }
}
```

## 风险点

`mShowNetworkSelectionFailed` 本意是控制手动选网失败时是否弹框，但现有分支会影响成功场景下 `oem_key_restore_auto_mode` 的执行。CQ 中客户提出过将条件改为 `mShowNetworkSelectionFailed && !isSucceed` 的思路，让失败弹框只拦截失败场景；平台侧答复为原逻辑基于历史客户需求，若项目修改需要自行评估风险，平台不做通用修改。

## 处理建议

- 需求是“失败后自动回网、不显示失败弹框”：重点检查 `oem_key_permanent_auto_sel_mode_bool` 与 `mShowNetworkSelectionFailed` 是否冲突。
- 需求是“成功后保持手动选择”：保持 `oem_key_restore_auto_mode=false`。
- 需求是“成功后自动回到自动选网”：配置 `oem_key_restore_auto_mode=true`，同时确认没有被 `mShowNetworkSelectionFailed` 分支拦截。
- 涉及认证或运营商 UI 要求时，不要只改 CarrierConfig，需要实际验证 `NetworkSelectSettings` 返回值和后续 `setNetworkSelectionModeAutomatic/Manual` 行为。

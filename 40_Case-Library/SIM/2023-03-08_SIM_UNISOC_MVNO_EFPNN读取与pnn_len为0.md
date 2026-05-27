---
quality: curated
doc_type: case
domain: SIM
rat: LTE/3G/GSM
feature: EF_PNN / EF_OPL / operator name
platform: UNISOC
layer: Modem/MMI phone / SIM records
symptom: "MVNO TPG SIM 无法正确使用 EF_PNN 名称，运营商名称显示错误"
cause: "客户本地代码改动及版本旧；排查中还暴露 OPL 匹配和 pnn_len 被清零的关键证据链"
operator: "TPG MVNO"
project: "GX2421"
chipset: "UMS9117"
source_log: "CQWeb SPCSS01132047"
first_bad_point: "GetPNNIndexByOPL / SetPNNWithLac 与 GetNetworkNameString 中 pnn_len 不一致"
confidence: high
status: summarized
tags:
  - cqweb
  - sim
  - pnn
  - opl
  - operator-name
---

# MVNO EF_PNN 读取与 pnn_len 为 0

## 结论

CQWeb `SPCSS01132047` 的最终处理结论是客户本地代码改动及版本旧，同步版本后关闭。这个案例更有价值的是排查链路：运营商名称显示错误时，不能只看 EF_PNN 是否存在，要继续确认 EF_OPL 是否匹配、`pnn_index` 是否正确、`pnn_len` 是否在后续流程被清零。

## 现象

- 平台：UNISOC UMS9117。
- 场景：插入 MVNO SIM 卡 TPG。
- 表现：手机无法正确使用 EF_PNN 中的名称，导致运营商名称显示错误。

## 关键证据

优先搜索：

```text
OPL:-- lac_1 = ..., lac_2 = ..., pnn_index = ..., mcc = ..., mnc = ...
GetPNNIndexByOPL pnn_index = ..., dual_sys = ..., lac = ..., lac_1 = ..., lac_2 = ...
SetPNNWithLac:pnn_index=...
SetPNNWithLac111:pnn_index=...
GetNetworkNameString dual_sys = ..., pnn_len = 0, ons_len = 0, opn_len = 0
MMIAPIPHONE_GenPLMNDisplay
```

典型判断：

| 证据 | 含义 |
|---|---|
| `GetPNNIndexByOPL` 返回 0 或 255 | EF_OPL 没匹配到当前 PLMN/LAC |
| 实际注册 MCC 与卡内 OPL 预期不一致 | 异地测试可能天然无法命中卡内 OPL |
| `SetPNNWithLac` 已命中 pnn_index，但 `GetNetworkNameString` 中 `pnn_len=0` | 查本地代码是否清零、旧版本是否缺补丁 |
| `pnn_len=0` 后进入 `MMIAPIPHONE_GenPLMNDisplay` | 会走本地字符串或 ROM fallback，表现为名称错误 |

## 排查步骤

1. 确认 SIM EF_PNN / EF_OPL 原始内容，特别是 OPL 中 PLMN、LAC 范围和 PNN record index。
2. 对照 log 中实际注册 PLMN/LAC，确认是否能命中 OPL。
3. 若 OPL 命中，继续看 `pnn_len` 在 `SetPNNWithLac` / `SetPLMNNetworkName` / `GetNetworkNameString` 中是否一致。
4. 若前面正确、后面变 0，优先对比本地 modem 代码改动和平台基线版本。
5. AP 侧只看到最终名称错误时，不要直接改 operator XML；先证明 SIM EONS 链路是否已经失败。

## 复用边界

该案例不适合作为“所有 MVNO PNN 读取问题都是平台 bug”的证据。它适合用来建立排查顺序：SIM 文件 -> OPL 匹配 -> PNN index -> `pnn_len` -> ROM fallback。

## 来源

- CQWeb：`SPCSS01132047`

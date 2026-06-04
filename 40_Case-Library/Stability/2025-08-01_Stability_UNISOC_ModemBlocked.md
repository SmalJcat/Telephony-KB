---
quality: curated
doc_type: case
domain: Stability
rat: LTE
feature: Modem Blocked
platform: UNISOC
layer: Modem/HW/AP
symptom: "拔出卡托后状态栏仍显示 SIM，现场高概率出现 modem blocked 且无有效 modem log 输出"
cause: "暂未闭环；已排查 patch 合入、硬件热插拔和网络环境，倾向特定网络/现场触发下 modem blocked"
source_log: "internal project summary"
first_bad_point: "拔卡瞬间 modem 挂住，无后续 modem log 输出"
confidence: low
status: summarized
search_tier: case_summary
---

# UNISOC Modem Blocked现场

## 场景

联通卡和 SD 卡在同一卡托正反面，重启后执行来电、短信，再拔出卡托，状态栏仍显示有 SIM。现场高概率出现 modem blocked。

## 需要保全的日志

| 日志 | 用途 |
|---|---|
| Ylog / AP log | 对齐用户动作、SIM 状态、radio 状态 |
| Modem log | 尝试看 blocked 前最后事件 |
| System dump | modem 无输出时保留系统现场 |
| Modem dump / memdump | 保留 CP 现场 |
| ETB | 平台要求时保留 blocked 调试信息 |

## 排查路径

1. 确认 PAC / out 目录实际使用的 modem 文件。
2. 对齐 modem bin 编译时间和 patch 文件时间，排除取错产物。
3. 检查 SD / SIM 热插拔中断和硬件波形。
4. 多现场复现，必要时手动触发 systemdump。
5. 若正面 root cause 无法闭环，再评估用户无感规避，例如重启后主动触发一次飞行模式恢复或系统级热插拔恢复。

## 结论边界

该类问题不能因为 AP 仍显示 SIM 就直接判 AP 状态同步错误。第一坏点在 modem 挂住且无后续 modem log 输出，AP 状态异常更像结果。

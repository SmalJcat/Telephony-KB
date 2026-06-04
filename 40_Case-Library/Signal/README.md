---
doc_type: index
domain: Meta
status: active
quality: curated
search_tier: case_summary
---

# Signal Cases

信号质量、RSRP/RSRQ/SINR异常、图标显示、小区切换、弱网、测量、掉网相关 case 放这里。

## 已整理案例

| Case | 场景 | 用途 |
|---|---|---|
| [[2024-07-12_Signal_UNISOC_搜网失败前端射频能量低]] | 插卡无信号、手动选网失败 | 从 `CELL_SELECT_CNF` / `PLMN_SEL_FAILURE_IND` 继续下钻 RF 前端能量 |
| [[2025-05-07_Signal_UNISOC_弱场RSRP低触发2G重定向]] | 弱场无法长时间保持 4G | 区分默认承载问题和网络按测量门限重定向到 GSM |
| [[2026-02-25_Signal_UNISOC_3G_RACH_Preamble最大功率失败疑似PA异常]] | LTE reject 后 3G RACH 建链失败 | 区分 LTE reject 和回落 RAT 的 PA/RF/校准首坏点 |

## 跨域参考

| Case | 场景 | 用途 |
|---|---|---|
| [[../Registration/2026-04-01_Registration_UNISOC_赞比亚双卡全制式无信号_RF掉底]] | 双卡全制式无信号 | 所有 RAT 失败时优先看 RSSI 掉底和 RF 接收链路 |
| [[../Registration/2025-05-18_Registration_UNISOC_弱场移动后无法回4G_Log证据不足]] | 弱场移动后无法回 4G | 弱场/移动类问题必须补齐 ARM、DSP、AP 时间对齐证据 |
| [[../Data/2023-09-28_Data_UNISOC_MTN弱网DNS超时与TCP重传]] | 数据慢但 data call 已建立 | 数据问题中识别弱覆盖和网络质量问题 |

建议命名：

```text
YYYY-MM-DD_Signal_现象_根因.md
```

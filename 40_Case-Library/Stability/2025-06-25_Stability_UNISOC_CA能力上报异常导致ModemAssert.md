---
quality: curated
doc_type: case
domain: Stability
rat: LTE
feature: CA capability / modem assert
platform: UNISOC
layer: Modem/LTE PHY/UE capability
symptom: "设备已注册网络后无法上网，随后 SIM state 从 READY 变为 UNKNOWN，RIL 上报 modem assert"
cause: "UE 上报了不支持的 CA 组合，网络按 UE 能力配置了超出终端能力的 CA，导致 LTE PHY assert"
project: "CC51"
chipset: "UMS9620"
source_log: "CQWeb SPCSS01521496"
first_bad_point: "LTE_DL_SCH0_TASK PHY CP assert in afc_aaal.c after unsupported CA configuration"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - stability
  - lte
  - ca
  - modem-assert
---

# CA 能力上报异常导致 Modem Assert

## 现象

设备注册上网络后无法上网，不久后 `simstate` 从 `READY` 变为 `UNKNOWN`。AP/RIL 侧可见 modem 异常：

```text
RIL: Modem Assert: LTE_DL_SCH0_TASK Task PHY CP assert in file afc_aaal.c
RIL: Modem Assert or Blocked, Info readerLoop to get out of select
RIL-AT: Modem Abnormal, stop sim0 readerLoop
RIL: Modem is not alive, return radio_not_avaliable
```

## 结论

CQWeb `SPCSS01521496` 的历史结论是：UE 上报了不支持的 CA 组合，网络根据 UE 上报能力配置了 UE 实际不支持的 CA，导致底层 assert。验证重点不只是“注册是否成功”，还要核对 UE capability 中 LTE DL CA 组合和流数是否符合平台能力。

## 关键日志

```text
Modem Assert: LTE_DL_SCH0_TASK Task PHY CP assert
file afc_aaal.c line 1567
info=[AFC_mainLccAdjVcoNcoProcess ch_idx=0,lcc_idx=0,...]
```

历史沟通中要求关注 UE 能力上报的 CA 组合流数，例如 `CA_1A-3C`、`CA_1A-7C`、`CA_1A-40C` 等是否符合平台能力。

## 排查步骤

1. 从 AP log 确认 `READY -> UNKNOWN` 是否伴随 modem assert，而不是普通掉网。
2. 在 modem dump / ARM log 中定位 assert task、文件名、line 和 info。
3. 抓取 UE capability，核对 LTE DL CA 组合、MIMO layer、band 组合是否符合平台能力。
4. 能用仪表复现时，用仪表按 UE capability 配置网络侧 CA，确认是否因能力上报错误触发。
5. 如果 UE capability 上报正确，继续查网络是否配置了超出能力的 CA；如果上报错误，回到 modem capability/NV/配置修正。

## 复用边界

这个案例适合“注册成功后短时间 modem assert / SIM UNKNOWN / 无法上网”的稳定性问题。不要只按数据业务或 APN 排查；`radio_not_available` 是 assert 后果。

## 来源

- CQWeb：`SPCSS01521496`

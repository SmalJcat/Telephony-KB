---
quality: curated
doc_type: case
domain: Stability
rat: LTE/NR
feature: modem boot / NV partition / radio unavailable
platform: UNISOC
layer: AP MODEM_CTRL / NV / Modem boot
symptom: "售后单机不识卡、IMEI 丢失、紧急号码无法拨出，RIL 返回 radio_not_avaliable"
cause: "l_fixnv1_a 和 l_fixnv2_a 双备份校验失败，MODEM_CTRL 读 NV 失败后 modem boot fail"
project: "AH5032U"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01379846"
first_bad_point: "MODEM_CTRL: NV_READ calc_checksum fail，both org and bak partition are damaged"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - stability
  - modem-boot
  - fixnv
  - radio-unavailable
---

# fixnv 双备损坏导致 modem 起不来

## 用户现象

售后单机出现不识卡、IMEI 丢失、IMEI SV 丢失、紧急号码无法拨出。RIL 侧提示：

```text
RIL: Modem is not alive, return radio_not_avaliable
```

## 结论

第一坏点在 modem 启动前的 NV 读取：AP `MODEM_CTRL` 读取 `l_fixnv1_a` 和 `l_fixnv2_a` 都校验失败，随后 `open /dev/stty_lte0 failed`、`boot modem fail`。格式化/重刷 NV_LTE 后 modem 可以起来，功能恢复。

## 关键证据

```text
MODEM_CTRL:NV_READ read_nv_partition path=/dev/block/by-name/l_fixnv1_a,
bak_path=/dev/block/by-name/l_fixnv2_a
MODEM_CTRL:NV_READ calc_checksum fail
MODEM_CTRL:NV_READ bakcalc_checksum fail
MODEM_CTRL:NV_READ both org and bak partition are damaged
MODEM_CTRL: open path /dev/stty_lte0 failed, ret = -1
MODEM_CTRL: boot modem fail!
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| AP MODEM_CTRL | 先看 NV_READ 和 boot modem fail，不要只看 RIL radio unavailable |
| NV 双备 | 主备分区都坏时，modem 可能完全起不来 |
| IMEI/SIM/ECC | 这些都是 modem 未起来后的连带现象，不是独立业务根因 |
| 单机还是批量 | 单机优先怀疑分区损坏/存储异常，批量再查版本或写 NV 流程 |

## 处理建议

- 保留异常设备的 fixnv 主备分区镜像，与正常设备对比。
- 若重刷/格式化 NV 后恢复，仍需继续追查 fixnv 损坏来源，例如断电、DDR/存储、异常写 NV。
- 业务侧看到不识卡、IMEI 丢失、紧急号码失败时，先确认 modem 是否 alive，避免分别建立多个业务 case。

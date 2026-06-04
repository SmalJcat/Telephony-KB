---
doc_type: flow
quality: curated
domain: Stability
feature: Modem Assert
layer: Modem/AP
status: active
search_tier: main_entry
---

# Modem稳定性与Assert


## 一句话

Modem assert 问题不要只看 AP 看到的 `radio unavailable`，要找到 modem 崩溃前的最后一个有效场景和触发条件。

## AP侧表现

- `RADIO_NOT_AVAILABLE`
- `modem reset` / `radio reset`
- service state 变为 out of service
- SIM状态重新加载
- IMS注册掉线后重注册
- 通话/数据中断

## Modem侧关键证据

- assert reason
- call stack
- core/module
- crash前最后的 NAS/RRC/SIP/数据/通话事件
- 是否发生在固定RAT、固定运营商、固定场景
- 是否可复现

如果 AP 侧只有 `Modem is not alive` / `radio_not_available`，但 ylog 或 modem ctrl 没看到明确异常，不能直接定根因。CQWeb `SPCSS01297728` 这类历史问题的处理要求是继续补 modem dump 或 full dump；没有 dump 时最多只能说 AP 侧检测到 modem 未在线，不能证明是 SIM、IMEI、NV、RFIC 或具体业务流程导致。

## 分析步骤

1. 确认是 assert、SSR、radio restart，还是AP侧服务重启。
2. 找到 first bad point：崩溃前最后一个异常事件。
3. 标出当时业务：注册、IMS、call、data、SIM、handover、弱网。
4. 对比同版本/不同版本是否回归。
5. 记录复现条件和规避方案。

## 结论模板

```text
AP侧在 xx:xx:xx 收到 RADIO_NOT_AVAILABLE，随后SIM和注册状态重新加载。
Modem log显示 xx模块 assert，触发前正在执行 xxx 流程。
当前判断为 modem侧稳定性问题，AP侧表现是结果而非根因。
```

## Patch / Blocked类问题检查

Modem patch 或 blocked 类问题容易陷入“没有有效 log 就无法推进”。这类问题需要同时检查版本、产物和现场保全。

| 检查项 | 目的 |
|---|---|
| Patch list / CR ID | 确认引入了哪些正式 patch、依赖 patch 和潜在副作用 |
| modem image 来源 | 确认 PAC/out 目录实际使用的 modem 文件与预期 patch 一致 |
| bin 编译时间 | 防止编译流水线取错旧 modem 产物 |
| 触发前业务 | 通话、IMS retry、SIM 热插拔、短信、数据、搜网等 |
| dump完整性 | 没有 assert dump 时，至少保留 systemdump、modem log、memdump、ETB |
| 回归范围 | 是否只影响某基线、某 patch 节点、某运营商/网络环境 |
| 硬件初始化 | RFIC/RFFE/PA 在位、RFIC type、校准分区 | modem 未起且 assert 指向 RF driver 时，先查板级硬件和射频初始化 |
| 缺 dump 场景 | ylog 只有 `MODEM_NOT_ALIVE`，无 modem `.mem` / full dump | 先补 dump，不要用 AP 结果反推业务根因 |

最小证据包：

```text
AP radio/main log
modem trace
assert / EE / blocked dump
systemdump
memdump 或 ETB（平台需要时）
modem patch list / modem image 编译时间
复现步骤和网络/SIM/运营商信息
```

典型结论边界：

- patch 引入后固定场景出现 ModemEE：优先按 modem patch 回归处理，AP 只记录触发表现。
- modem 未起且 dump 指向 RFIC type 读取失败：优先按 RFIC/RFFE/焊接/交叉料等硬件初始化方向处理。
- modem 未起但没有 modem dump/full dump：结论只能写“证据不足，需要补 dump”，不要定 SIM/注册/APN 根因。
- 现场 modem 无输出但 AP 正常：不能直接判 AP 根因，先补 dump 和硬件/网络环境证据。
- 正面根因无法定位时，规避方案必须标明是临时策略，例如重启后触发飞行模式恢复或系统级热插拔恢复。

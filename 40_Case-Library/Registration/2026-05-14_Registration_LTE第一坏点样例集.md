---
quality: curated
doc_type: reference
domain: Registration
rat: LTE / 2G / 3G
feature: first fault isolation
platform: Common
layer: RRC/NAS/Network
symptom: 注册失败样例归档
cause: mixed
operator:
project:
chipset:
vendor_customization:
android_version:
modem_version:
source_log:
  - 'F:\Codex\Knowledge\lte\5roo572r6zeu6aky5qgi5l6l'
first_bad_point: mixed samples
confidence: medium
search_tier: reference_only
status: reference
tags:
  - registration
  - lte
  - first-fault
  - rrc
  - attach-reject
  - reject-cause
---

# Case: LTE注册失败第一坏点样例集

## 基本信息

| 项目 | 内容 |
|---|---|
| 日期 | 2026-05-14整理 |
| 平台 | Common，样例来自既有材料 |
| RAT | LTE为主，含2G/3G reject策略参考 |
| 场景 | 注册失败第一坏点判断 |
| 复现概率 | 样例归档 |

## 输入材料

- 参考资料：`F:\Codex\Knowledge\lte\5roo572r6zeu6aky5qgi5l6l`
- 参考流程：[[LTE注册流程]]

## 结论

这组样例用于训练“第一坏点”判断：不要看到NAS消息就直接判Attach失败，也不要把网络Reject、RRC接入失败、AP不上报混成一个问题。

## 样例1：能搜到小区但RRC建链无响应

### 现象链路

```text
MIB
SYSTEMINFORMATIONBLOCKTYPE1
SYSTEMINFORMATION
SYSTEMINFORMATION
PDN_CONNECTIVITY_REQUEST
ATTACH_REQUEST
RRCCONNECTIONREQUEST
SYSTEMINFORMATION
SYSTEMINFORMATION
PAGING
```

### 第一个异常点

```text
第一个坏点：RRCCONNECTIONREQUEST之后没有RRCCONNECTIONSETUP
上一条正常证据：已完成MIB/SIB读取，并发出RRCConnectionRequest
下一条异常证据：未收到RRCConnectionSetup
```

### 判断

- 已经完成MIB/SIB读取，说明不是“完全找不到网”。
- NAS视图里出现 `PDN_CONNECTIVITY_REQUEST` / `ATTACH_REQUEST`，但空口真正还停在RRC接入前。
- `RRCCONNECTIONREQUEST` 后没有 `RRCCONNECTIONSETUP`，优先归到RACH/RRC接入失败、无线链路、RF参数、目标小区接入限制。
- 参考案例根因是RF参数未配置/软件版本刷错，导致能读系统消息但实际接入失败。

### 结论模板

```text
本例第一坏点不是NAS Attach Reject，而是RRC建链未建立。
证据是UE发送RRCCONNECTIONREQUEST后未收到RRCCONNECTIONSETUP。
优先排查RF参数、RACH、T300、目标小区接入条件和版本/射频配置。
```

## 样例2：LTE Attach被网络拒绝，Illegal ME

### 现象链路

```text
NAS EPS Mobility Management Message Type: Attach reject (0x44)
Cause: Illegal ME (6)
```

### 第一个异常点

```text
第一个坏点：Attach Reject cause #6 Illegal ME
上一条正常证据：流程已进入NAS Attach阶段
下一条异常证据：网络返回Attach Reject / Illegal ME
```

### 判断

- 该类问题已经走到NAS，不能再归因到搜网、驻留或RRC。
- `Illegal ME (6)` 指向设备身份不被网络接受，常见原因是IMEI非法、未备案、样机未进运营商白名单。
- 如果同一SIM换其他手机可注册，且本机换2G/3G也被类似原因拒绝，IMEI/设备准入优先级最高。

### 结论模板

```text
LTE注册流程已进入NAS Attach阶段，网络返回Attach Reject cause #6 Illegal ME。
当前第一坏点在网络侧对设备身份的准入校验，优先确认IMEI合法性、运营商备案和设备白名单。
```

## 样例3：RAU/LU连续Reject cause 17后的选网策略

参考样例是2G/3G RAU/LU，不是LTE Attach本身，但对“reject后终端怎么走”有参考价值。

### 现象链路

```text
GMM__ROUTING_AREA_UPDATE_REQUEST
GMM__ROUTING_AREA_UPDATE_REJECT | GMM Cause: Network failure (17)
gprs_rau_attempt_counter=1..5
MSG_ID_NWSEL_MM_REGN_RESULT_IND | lr_result = LR_ABNORMAL | mm_proc = MM_PROC_RAU
```

### 第一个异常点

```text
第一个坏点：网络连续返回Network failure (17)，终端进入异常注册计数/选网策略分支
上一条正常证据：终端可发起RAU/LU
下一条异常证据：网络连续Reject cause #17
```

### 判断

- `#17 Network failure` 不等价于RF差，也不等价于AP不上报。
- 先看网络拒绝后终端是否按策略重试、换小区、换PLMN或换RAT。
- 平台客制化可能影响第几次reject后触发PLMN search，例如SBP/NV开关。
- LTE里遇到Attach/TAU reject cause 17时，也要同步抓attempt counter、forbidden list、退避定时器和后续选网请求。

## 异常分析

### 事实

- 三个样例分别覆盖RRC接入失败、NAS Attach Reject、reject后选网策略。
- 三者的第一坏点不在同一层，不能用同一个“注册失败”标签草率归因。

### 推断

- 主流程文档里只需要保留这组样例的摘要和跳转；具体证据适合放在Case Library。

### 待确认

- 原始样例的完整项目、平台、版本信息未在当前整理中展开。

## 复盘

下次遇到类似问题，优先检查：

- 第一条缺失/失败的协议消息是哪一条。
- 是否已经进入RRC_CONNECTED。
- Reject cause发生在Attach、TAU、RAU还是LU。
- Reject后终端是否清上下文、写FPLMN/forbidden TA、启动退避或触发重选网。

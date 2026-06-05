---
quality: curated
doc_type: case
domain: Call
rat: LTE/3G/2G
feature: ECC / fake emergency / CS call setup
platform: UNISOC
layer: UNISOC ECC config / Modem Call Control / CS domain selection
symptom: "喀麦隆网络拨打 113 无法呼出；同地点、同 SIM、同时间段对比机可拨出"
cause: "失败版本喀麦隆 113 未配置 routing:2，modem 按真紧急下发 EMERGENCY_SETUP；临时软件给 113 增加 routing:2 后验证可拨出"
operator: "Cameroon MCC 624; Orange Cameroun 62402 observed"
project: "当前测试机项目"
chipset: "UNISOC smart-phone platform"
vendor_customization: "Emergency number / ECC condition"
android_version: "TBD"
modem_version: "TBD"
source_log: "F:\\Log\\ECC\\20260602 Ylog\\md_20260602-100945_armlog\\md_20260602-100945.logel"
first_bad_point: "失败版本 113 缺少 routing:2，拨号链路按真紧急建立，MNCALL 下发 emergency call 并发送 EMERGENCY_SETUP"
confidence: high
status: summarized
tags:
  - ecc
  - emergency-call
  - fake-emergency
  - cameroon
  - unisoc
  - cs-call
  - emergency-setup
search_tier: case_summary
---

# 喀麦隆 113 缺少 `routing:2` 导致误走 `EMERGENCY_SETUP`

## 用户现象

展锐智能机平台，喀麦隆现网拨打 `113` 无法呼出。同一地点、同一时间段、同一张 SIM 卡，对比机可以拨出；视频观察对比机也是回落到 3G 后呼出。

## 结论

根因在失败版本喀麦隆 `113` 未配置 `routing:2`。该号码被 modem 当真紧急呼叫处理，CS 侧发送 `EMERGENCY_SETUP`；临时软件给 `113` 增加 `routing:2` 后，按 fake/normal routing 方向验证，`113` 已可以拨出，闭环支持该根因。

## 输入材料

- Modem log：`F:\Log\ECC\20260602 Ylog\md_20260602-100945_armlog\md_20260602-100945.logel`
- 解码目录：`F:\Log\ECC\20260602 Ylog\md_20260602-100945_armlog\md_20260602-100945`
- 失败版本配置：`CM` 下 `113` 未配置 `routing:2`，拨号时按真紧急处理。
- 临时软件配置：`CM` 下 `113` 增加 `routing:2`；`117/118/119` 也配置 `routing:2` 并带 `types`。
- 配置对比：其他量产项目 `113` 使用 `Condition=10` fake/special ECC。
- 验证结果：改完 `routing:2` 后出的临时软件，`113` 可以拨出。

## 第一个异常点

```text
第一个坏点：失败版本 113 未配置 routing:2，拨号链路按真紧急进入 emergency call setup。
上一条正常证据：拨号 ATD113 后，平台能识别为 ECC，LTE/CS 注册和回落基础正常。
下一条异常证据：CS 侧发送 EMERGENCY_SETUP，网络随后释放，未进入 ALERTING/CONNECT。
影响层级：UNISOC ECC 配置映射 -> modem call control -> CS MSC 路由/建呼方式。
```

## 关键证据

当前测试机拨号与分类：

```text
ATC: ATC_RecNewLineSig,link_id:5,sim:1,len:12,line:ATD113@,#i;
ATC: this is an emergency call,call_num=113
ATC:ecc_k,final rsult, type:1,present:1,escv:0
MNCALL_StartCallWithEscvEx,call_type:1,escvP:1,escv:0
MNCALL_IsCsNormalCall,party_num[113],nv_config_cs_normal_call=,is_cs_normal_call=0
```

临时软件修复配置中，`113` 增加了 `routing:2`：

```protobuf
countries {
  iso_code: "CM"
  eccs {
    phone_number: "113"
    routing: 2
  }
}
```

LTE 网络能力和域选择：

```text
mncall_volte: judge domain,type:1,prefer:3,imsReg:1,imsAvi:1,emc_bs:0,vops:1,EmcReg:0,current_rat=16
mncall_volte: MO Emergency call domain:0
Emergency bearer services in S1 mode: Not supported
IMS voice over PS session in S1 mode: Supported
```

CS 建呼失败点：

```text
CM_SERVICE_ACCEPT
EMERGENCY_SETUP
CALL_PROCEEDING
DISCONNECT_NW_MS
MN_AL: mncall_get_failure_cause_category(),cause=31,cause_category=4
mncall: trigger redial
```

没有看到：

```text
ALERTING
CONNECT
```

其他量产项目参考配置：

```xml
<EccEntry Ecc="113" Category="0" Condition="10" Plmn="624 FFF" />
```

`routing:2` / `Condition=10` 在当前讨论中都指向 fake/special ECC 或 normal call routing。失败版本缺少该类配置时，log 里实际发送了 `EMERGENCY_SETUP`；临时软件增加 `routing:2` 后，`113` 已可拨出。

## 异常分析

### 事实

- 失败版本中 `113` 未配置 `routing:2`；后续截图中的 `routing:2` 是临时软件修复后的配置。
- `113` 在当前项目被识别为 emergency call，不是“号码未识别”。
- IMS 普通语音可用，但网络未广播 LTE emergency bearer support，因此 ECC over IMS 不作为主路径。
- CS 回落和接入可进行，网络返回过 `CM_SERVICE_ACCEPT` 和 `CALL_PROCEEDING`。
- 失败发生在 `EMERGENCY_SETUP` 后，网络释放，modem 内部记录 `cause=31` 并触发 redial。
- 临时软件给 `113` 增加 `routing:2` 后，`113` 可拨出。

### 推断

- 喀麦隆 `113` 在该网络下应作为 fake/special ECC 或特殊短号走普通 CS `SETUP`，而不应按真紧急 CS `EMERGENCY_SETUP`。
- `routing:2` 是该问题的有效修复方向；失败版本没有该配置时，modem 按真紧急路径处理。
- `113` 未配置 `types: POLICE` 会导致 `escv=0`，但临时软件验证结果说明主因不是 category，而是建呼消息类型和 ECC condition。
- `112` fallback / LTE emergency bearer 不支持只解释为什么不会走 IMS emergency，不解释 `113` 在 CS 侧失败。

### 待确认

- 展锐平台当前分支中 `routing:2` 到 modem call setup 类型的完整映射链路。
- 量产落地时需要确认 `routing:2` 是否已同时进入 AP/EmergencyNumberTracker、RIL 下发和 modem 本地 ECC 表所需位置。
- 无卡、PIN locked、PUK locked 场景下 `routing:2` 后的识别与拨出行为是否符合项目需求。

## 平台差异检查

| 检查项 | 结果 |
|---|---|
| 是否只在单一平台复现 | 当前问题发生在 UNISOC 智能机平台；对比机同卡同地可拨出 |
| Qualcomm/MTK/UNISOC 是否路径不同 | 本 case 结论只覆盖 UNISOC 当前 ECC condition 语义 |
| 是否涉及 NV 或 modem 配置 | 主要涉及展锐 ECC 配置中的 `routing:2`；需确认量产配置是否只改 AP eccdata 还是还要同步 modem 本地 ECC 表 |
| 是否涉及 vendor RIL/IMS service 实现 | 未见 RIL/IMS service 为主因；IMS emergency 不走由网络 emc_bs=0 解释 |
| 是否涉及客户 overlay 或 CarrierConfig | 可能涉及 AP emergency number 数据或客户本地 ECC overlay |
| 是否需要平台侧工具解析 | Logel；如需深挖可让展锐解 `EMERGENCY_SETUP` IE |

## 可能原因排序

| 排名  | 可能原因                                          | 证据                                                             | 置信度  |
| --- | --------------------------------------------- | -------------------------------------------------------------- | ---- |
| 1 | 失败版本 `113` 缺少 `routing:2`，错误走 `EMERGENCY_SETUP` | 失败 log 发 `EMERGENCY_SETUP`；临时软件增加 `routing:2` 后可拨出 | high |
| 2 | `113` category/ESCV 未配 police，`escv=0` 影响网络路由 | 当前 log `escv=0`，但修正 fake/normal routing 后已能拨出，说明不是首要根因 | low |
| 3 | ECC over IMS 软件未配置 | Attach Accept 显示网络不支持 S1 emergency bearer；对比机也回落 3G | low |

## 处理方案

- 临时规避：给喀麦隆 `113` 增加 `routing:2`，按 fake/normal routing 出临时软件。
- 正式修复：在量产 ECC 数据源中固化 `113 routing:2`，并确认配置进入最终生效链路，确保 `113` 有卡场景不再下发 `EMERGENCY_SETUP`；同时补充回归用例。
- 需要供应商确认：当前智能机平台分支 `routing:2` 是否保证 CS 侧发送普通 `SETUP`，以及是否还需要 modem 侧本地 ECC/Condition 表同步配置。

## 复盘

下次遇到类似问题，优先检查：

- 不要只看号码是否被识别为 ECC，还要看底层发的是 `SETUP` 还是 `EMERGENCY_SETUP`。
- 同国家本地短号要区分真紧急号码、fake/special ECC、普通短号和 fallback 号码。
- 同卡同地对比机可拨出时，优先对比 ECC condition/routing/category，而不是先归因网络不支持。
- IMS emergency 是否可用要看 `emc_bs` / S1 emergency bearer support；但 CS 失败仍要回到 CC 消息类型和网络释放点分析。

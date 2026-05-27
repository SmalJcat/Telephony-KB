---
quality: curated
doc_type: case
domain: SMS
rat: LTE/NR
feature: Cell Broadcast / CBS channels / Mainline
platform: UNISOC
layer: CellBroadcastReceiver / Mainline / AP config
symptom: "按客户要求 Enable CBS channels 后，多数信道测试失败，部分日志显示已配置仍不通过"
cause: "项目使用 full 版本 Google CellBroadcastReceiver，闭源/Mainline 场景下无法通过修改源码配置目标信道；测试还需使用目标地区 MCC/MNC"
project: "GH6591"
chipset: "UMS9230"
source_log: "CQWeb SPCSS01099451"
first_bad_point: "把旧平台源码修改方案套到 full/Mainline CellBroadcastReceiver，并用 00101 白卡测试目标地区信道"
confidence: high
status: summarized
tags:
  - cqweb
  - sms
  - cell-broadcast
  - mainline
  - cbs
---

# CB 信道配置受 full/Mainline 版本限制

## 用户现象

客户按需求 Enable CBS channels，修改 `CellBroadcastReceiver` 配置后，多个信道测试不通过。测试中使用 `00101` 白卡，目标信道包括 `6400`、`519`、`919`、`4396~4399` 等。

## 结论

第一坏点是配置入口和测试条件不匹配：

- 当前项目使用 full 版本 `com.google.android.cellbroadcastreceiver`，闭源/Mainline 场景下不能直接按旧平台源码方式配置全部信道。
- 目标地区 CBS 测试不能用 `00101` 白卡代替；白卡 MCC/MNC、仪表 MCC/MNC、实网环境必须与目标地区一致。

## 关键证据

```text
com.google.android.cellbroadcastreceiver is full version
full version is closed source
if need to test region requirement, white card and tester should use target mcc/mnc
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| App 版本 | AOSP/UNISOC 源码版，还是 Google full/Mainline 版 |
| 修改入口 | `config.xml`、overlay、Mainline module 资源是否真能生效 |
| MCC/MNC | SIM/白卡和仪表是否都是目标国家/运营商 |
| 信道下发 | `setCellBroadcastRange` 是否包含目标 channel range |
| UI 结果 | 测试 NOK 时要区分“未下发”“底层未收到”“UI 未展示” |

## 处理建议

- 不要把旧版本或 Go 版本 CellBroadcastReceiver 的源码修改方案直接套到 full/Mainline 版本。
- 目标国家法规类测试需要目标 MCC/MNC 的白卡或实卡，并同步配置仪表。
- 如果运营商要求的信道、标题、音频、振动属于 Mainline 模块控制，应走 Google issue 或正式平台方案。
- 归档时保留 app 版本、模块来源、资源覆盖路径、MCC/MNC、channel range 和底层上报日志。

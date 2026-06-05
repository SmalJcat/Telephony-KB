---
quality: curated
doc_type: case
domain: Data
rat: LTE
feature: APN / PDP context / PDN reconnect
platform: UNISOC
layer: Modem/AT/NAS
symptom: "使用 AT+CGDCONT 修改 data APN 后，没有自动发 PDN disconnect 或 detach"
cause: "AT+CGDCONT 只定义 PDP context/APN 参数，PDN disconnect/connect 需要 AT+CGACT 显式配合；CGACT 无法从未定义的上下文自动推断目标 APN"
project: "WM137"
chipset: "UWS6121EG"
source_log: "CQWeb SPCSS01656937"
first_bad_point: "直接 AT+CGDCONT 后期望 modem 自动重建已有 PDN，流程假设不符合 AT/PDN 标准拆分"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - data
  - apn
  - cgdcont
  - cgact
---

# CGDCONT 修改 APN 不会自动触发 PDN 重建

## 用户现象

执行：

```text
AT+CGDCONT=1,"IP","apn2"
AT+CGACT=1,1
```

期望设备对已有 data PDN 先发 PDN disconnect 或 detach，然后按新 APN 重建；实际设备又建立了一路 PDN 请求或没有按预期重建原链路。

## 结论

`AT+CGDCONT` 的职责是定义 PDP context，不是执行 PDN disconnect/connect。需要先用 `AT+CGACT` 去激活当前上下文，再修改 APN，最后重新激活。若测试用例要求显式 detach，则应额外使用 `AT+CFUN=0/1`。

## 推荐流程

```text
AT+CGACT?          // 查询当前激活 cid
AT+CGACT=0,2       // 去激活当前数据连接，触发 PDN DISCONNECT REQUEST
AT+CGDCONT=1,"IP","APN_2"
AT+CGACT=1,2       // 重新激活 cid2，建立新 PDN
```

如测试点要求 detach/attach：

```text
AT+CFUN=0
AT+CFUN=1
// 等待注册成功后再设置/激活 APN
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| APN 定义 | `AT+CGDCONT?` 看目标 cid 的 APN 是否已变更 |
| PDN 释放 | NAS 是否发出 `PDN DISCONNECT REQUEST` |
| 重新激活 | `AT+CGACT=1,<cid>` 后是否按新 APN 发起 PDP/PDN |
| Detach 要求 | 如果测试规范写 detach，不要用 CGDCONT 替代 CFUN/detach |

## 处理建议

- 与客户确认测试规范中“APN changed operation”的含义，是 PDN disconnect 还是 detach。
- 不要把 `CGDCONT` 包装成自动断链重连接口，否则容易引入和标准 AT 语义不一致的问题。
- 自动化脚本应显式写出 `CGACT=0`、`CGDCONT`、`CGACT=1` 三步。

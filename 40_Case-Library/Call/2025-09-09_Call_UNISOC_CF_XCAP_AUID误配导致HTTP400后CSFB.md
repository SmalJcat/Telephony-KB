---
quality: curated
doc_type: case
domain: Call
rat: LTE/NR
feature: Call Forwarding / XCAP / CSFB
platform: UNISOC
layer: Modem SS / XCAP / Operator NV
symptom: "IMS 注册后执行 Call Forwarding 查询或设置仍发生 CSFB，PS 补充业务失败"
cause: "XCAP AUID/NV 配置错误，URL 中重复拼接 simserv.ngn.etsi.org，网络返回 HTTP 400 后触发 CS 回落"
operator: "Spark NZ / 53001 style XCAP"
project: "GH6121 / GH6571 family"
chipset: "UMS9230E / UMS9230"
source_log: "CQWeb index SPCSS01552839 and imported supplementary-service notes"
first_bad_point: "OPERATOR_NV_IMS ims_ss_param ss_XcapAuid 被手动配置为 simserv.ngn.etsi.org"
confidence: high
status: summarized
tags:
  - cqweb
  - call
  - supplementary-service
  - xcap
  - call-forwarding
  - csfb
---

# CF 执行 XCAP 失败后 CSFB：`ss_XcapAuid` 误配

## 用户现象

设备已注册 IMS/VoLTE 后，进入 Call settings 执行 Call Forwarding 查询或设置，仍发生 4G 回落到 3G/CS，并弹出失败提示或等待较久。

## 结论

第一坏点不是 LTE 注册，也不是单纯 CSFB。DUT 先尝试走 XCAP/PS 补充业务，GBA/BSF 认证阶段出现 401/200 是正常过程；后续访问 `simservs.xml` 时 URL 拼接错误，网络返回 HTTP 400，随后触发 CSFB。

历史根因是 NV 中手动配置了：

```text
OPERATOR_NV_IMS\ims_ss_param\ss_param\ss_param[0]\ss_XcapAuid="simserv.ngn.etsi.org"
```

导致 DUT 发出的 URL 出现重复路径：

```text
GET /simserv.ngn.etsi.org/simservs.ngn.etsi.org/users/.../simservs.xml HTTP/1.1
```

删除该错误 NV 后复测通过。

## 关键证据

异常路径：

```text
AT+CCFCU=...
GET /simserv.ngn.etsi.org/simservs.ngn.etsi.org/users/.../simservs.xml
HTTP/1.1 400
EXTENDED_SERVICE_REQUEST
CS_DOMAIN estb_cause ...
```

对比成功路径：

```text
SSDS: Domain Decision Done ... path_type=1
GET https://xcap.../simservs.ngn.etsi.org/users/.../simservs.xml/~~/simservs/communication-diversion
HTTP/1.1 401
GET https://bsf...
HTTP/1.1 200 OK
GET https://xcap.../communication-diversion
HTTP/1.1 200 OK
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| 域选 | 是否先走 PS/XCAP，还是直接 CS |
| XCAP URL | 是否重复拼接 `simserv.ngn.etsi.org` 或路径缺失 |
| HTTP 状态 | 401/200 可能是认证过程；400/403 要继续看 URL、rule id、签约 |
| NV/Profile | 是否手动配置 `ss_XcapAuid`、USSI、XCAP APN |
| 回落 | CSFB 是 XCAP 失败后的结果，不是第一坏点 |

## 处理建议

- 先删除或修正错误 `ss_XcapAuid`，不要在 NV 中硬塞网络侧路径片段。
- 对比同运营商 pass 机的 XCAP URL，确认 host、AUID、`simservs.xml` 和 `communication-diversion` 路径。
- 如果 HTTP 403 或 PDN reject，继续查 XCAP APN、GBA/NAF/BSF、签约和运营商 profile。
- 归档时记录 `AT+CCFC(U)` 命令、域选日志、完整 XCAP HTTP 交互和触发 CSFB 的时间点。

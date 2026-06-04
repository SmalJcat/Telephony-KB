---
quality: curated
doc_type: case
domain: Registration
rat: LTE
feature: SIMLock
platform: MTK
layer: Build/Modem/AP
symptom: "KM5s 市场版本插入非白名单卡不弹锁网界面，进入待机后可识卡驻网"
cause: "服务器编译/拷贝链路未生成或未使用市场锁网 modem image；基础版本和市场版本 modem 镜像一致"
source_log: "internal weekly technical case"
first_bad_point: "产物检查发现基础版本和市场软件 modem image 一致，本地替换单编 modem 后锁网生效"
confidence: medium
status: summarized
search_tier: case_summary
---

# SIMLock锁网不生效：产物错误

## 场景

基础版本升级到市场版本，或直接刷市场版本后，插入非白名单卡不弹网络锁界面，进入待机界面后仍可识卡驻网。

## 定位过程

| 步骤 | 证据 | 判断 |
|---|---|---|
| 对比产物 | 基础版本和市场版本 modem 镜像一致 | 市场锁网配置可能没有进入 modem |
| 本地验证 | 本地单编并替换 `modem.img` 后锁网生效 | 锁网逻辑本身可生效，问题转向服务器产物链路 |
| 查流水线 | 服务器未生成对应锁网市场镜像 | 编译参数或扩展项目参数缺失 |
| 查拷贝脚本 | 市场 modem 名称可获取，但执行脚本少一组参数 | 拷贝链路没有拿到正确市场 modem |

## 关键字段

| 字段 | 含义 |
|---|---|
| `MTK_TARGET_PROJECT` | 主设备型号和基础配置，例如 `km5_xk67j` |
| `VEXT_TARGET_PROJECT` | 扩展定制版本，例如 `km5_xk67j_Claro` |
| `modem.img` | 基础版本和市场版本应按锁网需求区分 |
| Jenkins 参数 | 缺失会导致生成或拷贝默认 modem |

## 沉淀规则

锁网不生效时不要先盯 UI。先确认市场版本 modem 产物是否真的不同，再看运行态锁网状态和 AP 弹窗。只要本地替换 modem 后生效，优先排查编译流水线和产物拷贝链路。

---
quality: curated
doc_type: tool
domain: LogAnalysis
layer: AP/Modem
status: active
---

# 场测Log抓取SOP

## 通用要求

- 手机和 PC 时间对齐，状态栏显示秒。
- 记录复现步骤、SIM、运营商、地点、时间点。
- 网络/IMS/注册类问题尽量从重启开始抓，保留完整注册过程。
- 复现后立即停止日志，避免循环覆盖。

## MTK网络类问题

1. 打开开发者选项和 USB debugging。
2. 进入 Engineer Mode：常见拨号码 `*#*#9646633#*#*`、`*#*#3646633#*#*`、`*#*#8646633#*#*`。
3. 进入 DebugLoggerUI。
4. 打开 Tag Log。
5. Dynamic Settings -> TelephonyLog -> Enable。
6. 重启手机后开始复现，确保包含开机注册链路。
7. 复现后停止日志并导出 debuglogger。

## MTK普通问题

普通 AP/系统问题可以不强制重启，但仍要：

- 打开 Tag Log。
- 记录复现时间点。
- 拉取 debuglogger、bugreport、必要时 tombstone / aee。

## 数据和吞吐量问题

数据不可用或速率问题需要同时保留 AP、modem、netlog：

| 项 | 要求 |
|---|---|
| modem log | 容量尽量放大，避免复现后循环覆盖 |
| netlog | 保留 DNS、TCP、HTTP/HTTPS 关键包，packet size 建议限制到 128B |
| DUT/REF | 时间对齐，记录 SIM、位置、server、Speedtest 版本 |
| 吞吐量 | 记录每轮 DUT/REF 测试顺序，中途是否交换 SIM 和位置 |
| APN问题 | 保留 `SETUP_DATA_CALL`、`DataCallResponse`、DNS query、TCP timeout 证据 |

## UNISOC / 展锐问题

展锐平台通常保留：

| 日志 | 用途 |
|---|---|
| ylog AP | framework、RIL、状态同步 |
| ylog modem / armlog | NAS/RRC/SIM/IMS/modem trace |
| Logel systemdump | modem blocked / assert 现场 |
| memdump / ETB | 平台要求时用于底层定位 |

## 提交给分析者的最小信息

```text
项目 / 版本 / 平台：
SIM / 运营商 / 国家：
问题现象：
复现步骤：
复现概率：
复现时间点：
日志目录：
对照机 / 对照版本：
是否重启开始抓：
是否包含 modem log / dump：
```

## 不合格日志

- 没有复现时间点。
- 只给 AP log，没有 modem log，却要求判断 modem/RRC/NAS。
- 网络注册问题不是从重启或飞行模式开始抓，缺少完整注册链路。
- modem blocked/EE 只有 AP 表现，没有 dump。
- DUT/REF 时间不一致，无法对齐。

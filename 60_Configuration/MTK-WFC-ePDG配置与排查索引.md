---
doc_type: config
domain: Configuration
status: active
quality: imported_reference
platform: MTK
source: Notion MTK 网络通信模块知识库 / MediaTek Online WFC ePDG FAQs
source_url: https://www.notion.so/35df72d579ba8146a90cf1b0176afd1b
search_tier: supplemental
---

# MTK WFC-ePDG配置与排查索引

## 使用入口

这篇用于 VoWiFi / WFC / ePDG 问题的 MTK 专项排查。遇到 WFC 开关不显示、飞行模式下 VoWiFi 注册失败、IKE tunnel 建不起来、VoWiFi 通话中掉话、Wi-Fi 与 LTE/NR handover 异常时，先按这里切层。

不要直接把问题归因到 IMS 注册失败。WFC/ePDG 链路至少要拆成：WFC 开关与 operator profile、ePDG FQDN、DNS、证书、IKE/ESP proposal、IKE tunnel、IMS over WLAN、RTP/DPD、VoWiFi 与 VoLTE/VoNR handover。

## 排查总流程

1. 允许：确认 WFC/VoWiFi 是否被 AP、IMS profile、operator code、roaming 策略允许。
2. FQDN：确认实际 ePDG FQDN 是否符合 MCC/MNC、EHPLMN、IMSI、VPLMN/HPLMN 策略。
3. DNS：确认是否发出 DNS query、返回哪些 ePDG IP、UE 是否逐个尝试。
4. IKE_SA_INIT：确认 IKE proposal 与 ePDG server 是否有交集。
5. IKE_AUTH：确认证书、EAP、CERT payload、authentication 是否失败。
6. CHILD SA / IMS PDN：确认 IMS PDN 是否成功建在 WLAN/ePDG 上。
7. 通话质量：确认 RTP loss、No RTP、DPD request/response、DPD timeout。
8. Handover：确认 W2L/L2W、roaming、in-call handover 是否被策略禁止。

## 关键参数速查

| 场景 | 参数 / 文件 | 重点判断 |
|---|---|---|
| 手动指定 ePDG FQDN | `epdg_fqdn`、EM、`custom_wo_config.c`、`custom_n3cf_config.c` | 实验室可先 EM 设置，正式版本回 custom file / MCF |
| FQDN 生成策略 | `epdg_select_policy` | 看到多个 DNS query 或 DUT/REF FQDN 不同，先查它 |
| DNS 结果数量 | `DNS_max_count` / `dns_max_count` | ePDG attach retry 是否逐个尝试 IP |
| IKE proposal | `ike_algo` | 末尾加 `!` 表示只发送配置列表 |
| ESP algorithm | `esp_algo` | CHILD SA / ESP 不匹配会导致 tunnel 失败 |
| MOBIKE | `mobike` | IKE_AUTH 里看 `MOBIKE_SUPPORTED` |
| Verizon DPD | `ipol_dpd_qos_enable`、`fdpd_retrans_to`、`fdpd_retrans_tries` | RTP 高丢包后 DPD timeout 可能释放 ePDG session |
| Roaming HO | `wans_ims_roaming_ho_enable` / `ipol_ims_roaming_ho_enable` | 控制 roaming 下 VoWiFi/VoLTE handover |
| Roaming in-call HO | `wans_ims_roaming_incall_ho_enable` / `ipol_ims_roaming_incall_ho_enable` | 控制 roaming 下通话中 handover |
| No RTP HO | `wans_cell_no_rtp_handover_enable`、`ipol_wlan_no_rtp_handover_enable` 等 | 无 RTP timer 到期后是否触发 RAT handover |

## ePDG FQDN

测试路径：

```text
Before M70: EM -> Telephony -> ePDG config
M70 and later: EM -> Telephony -> WiFi calling -> ePDG config
General -> epdg_fqdn
```

典型 FQDN：

```text
epdg.epc.mnc010.mcc234.pub.3gppnetwork.org
```

永久配置路径按平台代际区分：

| 平台 | 路径 |
|---|---|
| M21 | `/mcu/pcore/custom/modem/common/ps/custom_wo_config.c` |
| M50 | `/mcu/custom/protocol/common/ps/custom_wo_config.c` |
| M70/M80/M90 | `/mcu/custom/protocol/common/ps/custom_n3cf_config.c` |

## FQDN生成策略

`epdg_select_policy` 常见含义：

| 值 | 口径 |
|---|---|
| `0` | 使用 NV 中的 FQDN |
| `1` | 使用 attached PLMN 构造 FQDN |
| `2` | 使用 SIM EHPLMN + IMSI 构造 FQDN |
| `3` | 使用 IMSI 构造 FQDN |
| `4` | 使用 VPLMN + HPLMN + identifier 构造 FQDN |

关键日志：

```text
N3ANS
FQDN constructed using custom policy
Append EHPLMN to identifier
Append IMSI PLMN to identifier
MSG_ID_DNS_GET_HOST_BY_NAME_REQ
[DNS] Send DNS Query
```

## IKE / ESP检查

pcap / netlog 里过滤：

```text
dns
isakmp
```

IKE 侧至少确认四类算法：

| 类别 | 字段 |
|---|---|
| Encryption | `ENCR` |
| Integrity | `INTEG` |
| Pseudo-random Function | `PRF` |
| Diffie-Hellman Group | `D-H` |

示例表达：

```text
ike_algo = aes256-sha256-prfsha256-modp2048
ike_algo = aes256-sha256-prfsha256-modp2048!
esp_algo = aes256-sha256-sha512
```

如果 ePDG server 不接受 UE proposal，问题卡在 IKE negotiation，不是 SIP REGISTER 本身。

## 证书检查

典型失败关键词：

```text
MSG_ID_N3SAM_CERT_CERT_PATH_VALIDATE_REQ
MSG_ID_N3SAM_CERT_CERT_PATH_VALIDATE_CNF
CERT_STATUS_INVALID
Cert Adapter: [ERROR]
MSG_ID_N3EPC_N3SAM_IKE_SA_EST_REJ
N3_CAUSE_IKE_SA_CERT_VERIFY_FAIL
IKE_AUTH
CERT
```

设备侧路径：

```bash
adb root
adb remount
adb shell
cd /vendor/etc/md/cacerts/ikev2/
```

M85/M90 可查：

```bash
cd /vendor/etc/mdota/misc_data/cacerts/ikev2/
```

目录中应存在 `*.der` 或 `*.crt` 证书文件。若 IKE_AUTH request 缺 CERT，或 modem 报 cert path validate invalid，先查证书路径和文件，再继续分析网络证书链。

## DPD / No RTP / Handover

Verizon WFC drop 类链路常见顺序：

```text
RTP high loss
-> force DPD
-> DPD retransmit
-> DPD timeout
-> Delete IKE SA
-> ePDG PDN disconnect
-> +EPDNHANDOVER
-> IMS re-register or call drop
```

关键日志：

```text
[STAT][VOICE][IWLAN] pkt_info loss_rate
MSG_ID_IWLAN_LTECSR_INFO_RPT_IND
MSG_ID_IWLAN_N3EPC_DPD_REQ
MSG_ID_N3EPC_N3SAM_FORCE_DPD_REQ
N3SAM_FDPD_TIMEOUT
Delete IKE SA
MSG_ID_D2RM_N3EPC_PDN_DISCONN_IND
+EPDNHANDOVER
[SysMsg] WiFi to LTE
[SIPTX-IO] REGISTER
```

Roaming handover 和 no RTP handover 要同时查对应 enable 参数。若 LTE/NR 覆盖不满足 handover threshold，释放 ePDG 后可能直接掉 IMS。

## 现场最小证据包

| 证据 | 用途 |
|---|---|
| AP radio / IMS / Telephony log | 对齐 UI、IMS service、WFC 状态 |
| Modem PS/NAS/IMS/IWLAN/N3 log | 看 ePDG、IMS PDN、DPD、handover |
| Netlog / pcap | 看 DNS、IKE_SA_INIT、IKE_AUTH、ESP |
| Wi-Fi 信息 | SSID、网络环境、RSSI、切 AP/切网行为 |
| 配置 dump | CarrierConfig、IMS config、WFC/EPDG/SBP/NVRAM 改动 |

## 本地关联

- [IMS配置方法](IMS配置方法.md)
- [MTK-配置关系与生效链路](MTK-配置关系与生效链路.md)
- [MTK-网络通信问题抓Log与提交模板](../70_Tools-Debug/Log-Capture/MTK-网络通信问题抓Log与提交模板.md)


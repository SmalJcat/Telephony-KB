---
doc_type: config
domain: Configuration
status: active
quality: curated
---

# IMS配置方法

## 速查结论

- IMS 注册问题先分清：没有发起 IMS PDN、IMS PDN 建立失败、SIP REGISTER 被拒、SIP 成功但 AP 回调异常。
- AP 侧 VoLTE/VoWiFi 开关为 true，只代表能力门控允许，不代表 modem IMC 条件、SBP、IMS profile 或网络签约满足。
- MTK 项目遇到“LTE 正常但无 IMS PDN”时，重点查 `IMC_REG_CHECK_*`、SBP ID、DSBP/CXP mapping 和运营商支持状态。
- VoWiFi 注册失败如果卡在 IKE/ePDG，不要继续追 SIP；先看 IKE proposal、完整性算法、ePDG 地址和网络环境。
- SIP 403 要看响应文本。`IMEI check failed` 这类字段优先按运营商侧 IMEI 备案/白名单处理。

## IMS注册配置分层

| 层级 | 检查项 | 典型证据 |
|---|---|---|
| AP 能力门控 | CarrierConfig、Settings 开关、IMS service 能力 | `carrier_volte_available_bool`、`config_device_volte_available`、IMS callback |
| IMS APN / PDU | IMS APN、P-CSCF、IP、DNS | PDN connectivity request、PCO、P-CSCF |
| Modem IMS profile | VoLTE/VoWiFi/ViLTE/SMS/UT profile | `AT+EIMSCFG`、profile/NV/MDDB |
| MTK SBP / DSBP | operator code、SBP ID、CXP/OPDB mapping | `ccci_mdinit`、`L4BSBP`、`PROTOCOL_2 SBP ID` |
| IMC 注册条件 | MCC/MNC whitelist、VOPS、SIM/ISIM | `IMC_REG_CHECK_*` |
| IMS Core | SIP REGISTER、401、403、408、503 | SIP response、Warning、Reason |

## MTK SBP / DSBP / CXP

### 概念边界

| 概念 | 作用 | 常见来源 |
|---|---|---|
| CCCI SBP ID | AP 在 modem 启动阶段传给 modem 的项目级 SBP ID | `MTK_MD_SBP_CUSTOM_VALUE`、`ro.vendor.mtk_md_sbp_custom_value` |
| SIM SBP ID / DSBP | 根据插入 SIM 的 PLMN / OPDB / CXP 动态匹配运营商 SBP | `AT+EDSBP`、`L4BSBP`、CXP operator map |
| OP load / OM load | 运营商定制版本或公开市场版本 | `OPTR_SPEC_SEG_DEF`、`MTK_MD_SBP_CUSTOM_VALUE` |
| CXP | AP 侧 Carrier Express 运营商包 / mapping | `CarrierExpress/res/values/strings.xml` |

判断模板：

```text
LTE 注册正常，但 IMS PDN 没有发起。
AP IMS 能力已打开，IMC 检查失败于 MNCMCC whitelist。
当前 SBP ID 为 0，目标 PLMN 未匹配到支持 IMS 的 SBP。
第一坏点在 MTK SBP/运营商支持状态，不在 LTE 注册。
```

### 关键日志

```text
ccci_mdinit: PRJ_SBP_ID ... using default value
ccci_mdinit: Get: usp_sbp=-1, cip_sbp=0, project_sbp=0, nvram_sbp=0, set sbp=0
AT+EDSBP=2
[L4BSBP] PLMN ID=43211
[L4BSBP] PLMN ID (43211) not matched!
[L4BSBP] OPDB PLMN ID(43211) => SBP ID(0, SBP_ID_OM)
PROTOCOL_2 SBP ID = 0
```

IMC 条件失败：

```text
[IMC-REG] ims_support:1
[IMC-REG] sim->priv.nw_ims_vops: (1)
[IMC-REG] Operator code = 0, IMSI-MNC:11, IMSI-MCC:432
[IMC-REG] imc_check_mncmcc_whitelist()
[IMC-REG] Normal REG condition check result: IMC_REG_CHECK_MNCMCC_FAILED
```

项目固定 SBP 的验证日志：

```text
ccci_mdinit: PRJ_SBP_ID value: 147 for md1
ccci_mdinit: Get: usp_sbp=-1, cip_sbp=0, project_sbp=147, nvram_sbp=0, set sbp=147
PROTOCOL_2 SBP ID = 147
```

### 配置风险

| 方案 | 适用性 | 风险 |
|---|---|---|
| `AT+ECFGSET` / `AT+ESBP` 手动设置 | 实验室快速验证 | 插拔卡后可能被覆盖；商用风险高 |
| 固定 `MTK_MD_SBP_CUSTOM_VALUE` | 单运营商或专用项目 | 其他 SIM 的 IMS、会议、补充业务可能异常 |
| SBP custom mapping NV | 取决于 modem baseline | LR12A / LR13 等版本支持差异需实测 |
| CXP / DSBP mapping | 更接近量产方案 | 需要 AP/operator package 和 modem 支持一致 |
| MTK patch / eService | 正式方案 | 依赖 MTK 支持状态、项目基线和交付周期 |

## VoWiFi IKE配置

VoWiFi 注册链路中，IKE/ePDG 在 SIP REGISTER 之前。IKE 失败时不应继续追 IMS Core。

关键日志：

```text
MSG_ID_CMCP_HANDOVER_TO_VOWIFI_REQ
MSG_ID_IKE_ATTACH_REQ
IKE: nv: ike_intg = 18
IKE: cfg: ike_integ_alg=18
IKE_SessCheckAlgorithms unsupported integ algo:18
IKE: Session start failed!
MSG_ID_IKE_ATTACH_FAILED
```

检查项：

| 检查项 | 说明 |
|---|---|
| IKE 完整性算法 | `ike_intg` / `ike_integ_alg` 是否为平台支持值 |
| IKE 加密算法 | proposal 是否与网络 / ePDG 匹配 |
| ePDG 地址 | DNS / FQDN / 国家和 PLMN 选择是否正确 |
| Wi-Fi 网络 | 是否阻断 UDP 500/4500、NAT-T、DNS |
| IMS over IWLAN | IKE 成功后再看 IMS REGISTER |

## SIP 403判断

SIP 403 不能只写“网络拒绝”，要保留响应文本。

| 403 文本 | 优先方向 |
|---|---|
| `IMEI check failed` | 运营商 IMEI 备案 / 白名单 |
| `Forbidden` 无更多字段 | 签约、IMS profile、IMPI/IMPU、运营商策略 |
| USSD / USSI 403 | 运营商是否支持 IMS USSD，必要时回 CS |

## 最小证据包

```text
AP radio/main log
CarrierConfig dump
IMS APN / P-CSCF / PDN log
AT+EIMSCFG 或平台 IMS profile
MTK ccci_mdinit / L4BSBP / IMC-REG log
SIP REGISTER / 401 / 403 / 200
VoWiFi: IKE / ePDG / Wi-Fi 环境
对比机或运营商支持状态
```

## 关联案例

- [[../40_Case-Library/IMS/Imported_IMS_01_HMD场测反馈_VoLTE_注册_403]]
- [[../40_Case-Library/IMS/Imported_IMS_02_Iran_无法注册IMS问题]]
- [[../40_Case-Library/IMS/Imported_IMS_03_6032+_Spark反馈WFC注册有问题]]
- [[../40_Case-Library/IMS/2025-07-29_IMS_SMS-over-IP配置缺失]]


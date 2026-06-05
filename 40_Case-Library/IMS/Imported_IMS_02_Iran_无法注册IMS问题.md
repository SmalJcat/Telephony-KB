---
doc_type: case
quality: curated
domain: IMS
rat: LTE/5G
feature: IMS Registration / MTK SBP
platform: MTK
layer: AP/CCCI/Modem/IMC/SBP
symptom: "Iran 43211 卡 LTE 注册成功但不发起 IMS PDN，VoLTE/ViLTE 菜单存在但 IMS 无法注册"
cause: "MTK IMC 注册条件检查时 Operator code / SBP ID 为 0，43211 未命中 MNCMCC whitelist，返回 IMC_REG_CHECK_MNCMCC_FAILED，IMS PDN 不会发起"
source_log: "Old Outline knowledge base; split from IMS问题案例补充.md"
first_bad_point: "IMC_REG condition check failed: IMC_REG_CHECK_MNCMCC_FAILED before IMS PDN connectivity request"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - imported
  - ims
  - mtk
  - sbp
  - dsbp
  - imc
---

# Iran 43211 IMS 不注册：MTK SBP / MNCMCC whitelist 未命中

## 用户现象

G99 / MT6789 项目插入 Iran 43211 运营商 SIM 后，设置中有 VoLTE、ViLTE 菜单，但 IMS 无法注册。LTE attach 和默认承载正常，问题发生在 IMS PDN 发起之前。

## 结论

第一坏点不是 AP VoLTE 开关，也不是 LTE 注册失败。AP 能力配置检查通过，modem IMC 进入正常注册条件检查后，因为当前 `Operator code = 0` / `SBP ID = 0`，43211 未命中 IMS MNCMCC whitelist，返回：

```text
Normal REG condition check result: IMC_REG_CHECK_MNCMCC_FAILED
```

因此 IMS PDN 不会发起，后续也不会有 SIP REGISTER。

## 关键证据链

### LTE 注册正常但无 IMS PDN

```text
EMM_Attach_Request
EMM_Attach_Accept
ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_REQUEST
ACTIVATE_DEFAULT_EPS_BEARER_CONTEXT_ACCEPT
EMM_Attach_Complete
```

空口只看到 LTE 注册完成，未看到 IMS PDN connectivity request。

### AP IMS 能力配置通过

```text
AT+EIMSCFG=1,0,0,0,1,1
<volte> : 1(Voice over LTE enable)
<ims_sms> : 1(Enable)
<eims> : 1(Enable)
```

### IMC 注册条件失败

```text
[IMC-REG] imc_check_normal_reg_condition_satisfied()
[IMC-REG] ims_support:1
[IMC-REG] sim->priv.nw_ims_vops: (1)
[IMC-REG] Operator code = 0, IMSI-MNC:11, IMSI-MCC:432
[IMC-REG] imc_check_mncmcc_whitelist()
[IMC-REG] WhiteList_num:0
[IMC-REG] Normal REG condition check result: IMC_REG_CHECK_MNCMCC_FAILED
```

### SBP / DSBP 未匹配

```text
ccci_mdinit: PRJ_SBP_ID: ro.vendor.mtk_md_sbp_custom_value not exist, using default value
ccci_mdinit: Get: usp_sbp=-1, cip_sbp=0, project_sbp=0, nvram_sbp=0, set sbp=0
AT+EDSBP=2
[L4BSBP] PLMN ID=43211
[L4BSBP] PLMN ID (43211) not matched!
[L4BSBP] OPDB PLMN ID(43211) => SBP ID(0, SBP_ID_OM)
PROTOCOL_2 SBP ID = 0
```

## 调试验证

工程模式手动把 SBP ID 从 default `0` 改成 Airtel `147`，并关闭 MCC/MNC check 后，客户反馈 VoLTE 图标可见且功能可用。

软件侧临时验证方案：

```text
MTK_MD_SBP_CUSTOM_VALUE = 147
关闭 DSBP
```

验证日志：

```text
ccci_mdinit: PRJ_SBP_ID value: 147 for md1
ccci_mdinit: Get: usp_sbp=-1, cip_sbp=0, project_sbp=147, nvram_sbp=0, set sbp=147
set md boot data: mdl=0 sbp=147
AT+EDSBP=0
PROTOCOL_2 SBP ID = 147
Current SIM SBP ID = -1
```

## 风险边界

- 固定 `MTK_MD_SBP_CUSTOM_VALUE=147` 是项目级策略，会影响其他 SIM 的 IMS / 通话会议 / 补充业务等行为。
- `AT+ECFGSET`、`AT+ESBP` 更适合实验室或工厂调试，不建议作为商用设备运行时方案。
- LR12A 可通过某些 SBP custom mapping NV 验证生效，但原资料记录 LR13 不支持同一 NV；不同 modem baseline 必须重新确认。
- 更稳妥方向是 MTK patch、CXP / DSBP mapping 或运营商级 SBP 支持状态确认。

## 排查口径

| 现象 | 优先检查 |
|---|---|
| LTE 注册成功但无 IMS PDN | IMC 注册条件、SBP ID、IMS whitelist |
| AP 开关都为 true 但无 IMS 注册 | `AT+EIMSCFG` 只能证明 AP/modem 能力打开，不代表 IMC 条件满足 |
| `Operator code = 0` | 检查 CCCI SBP、SIM SBP、CXP/OPDB mapping |
| `IMC_REG_CHECK_MNCMCC_FAILED` | 检查运营商支持状态、SBP mapping、MTK patch/eService |

## 关联入口

- [[../../20_Service-Flows/IMS/IMS业务流程#IMS注册流程]]
- [[../../60_Configuration/IMS配置方法#MTK-SBP-DSBP-CXP]]


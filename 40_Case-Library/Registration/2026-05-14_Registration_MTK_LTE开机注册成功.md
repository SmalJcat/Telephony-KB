---
quality: curated
doc_type: case
domain: Registration
rat: LTE
feature: LTE registration
platform: MTK
chipset: MT6768
layer: AP/Modem/Network
scenario: 开机注册
symptom: 开机后LTE注册成功
cause: normal-flow
operator: China Unicom / 46001
project:
vendor_customization:
android_version: alps-mp-v0.mp1.rc-V9.3_tct.v0mp1rc.k6991v1.64_P8
modem_version: MOLY.LR12A.R3.MP.V353.4.P12
source_log:
  - 'F:\Log\流程Log\MTKLte注册流程\debuglogger'
first_bad_point: none
confidence: high
search_tier: case_summary
status: closed
tags:
  - registration
  - lte
  - mtk
  - poweron
  - attach
  - esm
---

# 2026-05-14 MTK LTE开机注册成功

## 结论

这份 MTK debuglogger 中，PHONE1 在开机后完成 LTE 注册：modem 侧完成 `EMM_Attach_Request -> EMM_Attach_Accept -> EMM_Attach_Complete`，默认 EPS bearer 建立，AP 侧同步为 `REG_HOME` / `IN_SERVICE`。当前样例是正常注册链路，可作为 MTK 平台 LTE 成功流程的对照片。

## 日志入口

| 类型           | 路径                                                                                                                   | 用途                      |
| ------------ | -------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| AP radio log | `F:\Log\流程Log\MTKLte注册流程\debuglogger\mobilelog\APLog_2026_0514_144323__6\boot__normal\radio_log_3__2026_0514_144323` | RILJ、ServiceState、APN下发 |
| Modem log    | `F:\Log\流程Log\MTKLte注册流程\debuglogger\mdlog1\MDLog1_2026_0514_144324\MDLog1_2026_0514_144236_data.muxz`               | MTK mdlog1 MUXZ         |
| Modem DB     | `F:\Log\流程Log\MTKLte注册流程\debuglogger\mdlog1\MDLog1_2026_0514_144324\MDDB_PHONE_ulwctg_n.EDB`                         | MACE2/ELT解码             |

MTK元数据：

| 字段       | 值                                                |
| -------- | ------------------------------------------------ |
| Platform | `MT6768_S00`                                     |
| Project  | `TK_MD_L4(LWCTG_6177M_6769)`                     |
| Modem SW | `MOLY.LR12A.R3.MP.V353.4.P12`                    |
| MtkSW    | `LR12A.R3.MP.W24.51.LTE.p4`                      |
| mdlog时间  | `2026-05-14 14:42:36.007104` 到 `14:43:22.999616` |

## Modem侧关键流程

| 时间              | 证据                                                                                   | 含义                             |
| --------------- | ------------------------------------------------------------------------------------ | ------------------------------ |
| 14:42:41.253568 | `[EMM PLMNSEL] getCurPlmn()= KAL_TRUE, cur_plmn = 46001f`                            | 当前目标 PLMN 为 46001              |
| 14:42:41.253568 | `[EMM REG] REG needs ESM msg to trigger attach`                                      | EMM 等待 ESM 默认 PDN 信息后触发 attach |
| 14:42:59.118976 | `[EMM REG] Initial check for attach is passed`                                       | Attach前置检查通过                   |
| 14:42:59.118976 | `[EMM REG] Procedure is started (EMMREG_EXECUTING_PROC_ATTACH)`                      | 启动 Attach 流程                   |
| 14:42:59.118976 | `[EMM REG] Decided attach type is EMM_ATTACH_TYPE_COMBINED_ATTACH`                   | combined EPS/IMSI attach       |
| 14:42:59.118976 | `MSG_ID_EMM_CONN_REG_EST_CNF`                                                        | EMM 收到连接建立确认，可承载 NAS           |
| 14:42:59.118976 | `[MS->NW] EMM_Attach_Request(...)`                                                   | UE 发出 Attach Request           |
| 14:42:59.118976 | `[EMM REG] ATTACH-REQUEST send success`                                              | Attach Request 已发送成功           |
| 14:43:00.119616 | `[NW->MS] EMM_Attach_Accept(...)`                                                    | 网络返回 Attach Accept             |
| 14:43:00.119616 | `active EPS bearer Num = 1`, `active EPS bearer ID: 5`                               | 默认 EPS bearer 已激活，EBI=5        |
| 14:43:00.119616 | `ATTACH-ACCEPT decode result = D_EMM_DEC_SUC`                                        | Attach Accept 解码成功             |
| 14:43:00.119616 | `ATTACH-ACCEPT processing result is EMMREG_ATTACH_ACCEPT_OK`                         | Attach Accept 处理成功             |
| 14:43:00.119616 | `attach result: EMM_ATTACH_RESULT_COMBINED_ATTACHED`                                 | 网络接受 combined attach           |
| 14:43:00.119616 | `[ESM] Record attach PDN established PLMN (PTI: 1, EBI: 5, PLMN: 46001f)`            | 默认 PDN/bearer 关联到 46001        |
| 14:43:00.119616 | `[MS->NW] EMM_Attach_Complete(cipher="KAL_TRUE")`                                    | UE 发送 Attach Complete          |
| 14:43:00.119616 | `[EMM REG] ATTACH-COMPLETE send success`                                             | Attach Complete 已发送成功          |
| 14:43:00.119616 | `[EMM REG] Procedure is end (EMMREG_EXECUTING_PROC_ATTACH)`                          | Attach 流程结束                    |
| 14:43:00.119616 | `RRCE: Update attach status. CS attached: KAL_TRUE PS attached: KAL_TRUE`            | RRC/EMM同步附着状态                  |
| 14:43:00.119616 | `ESM_SYSTEM_ATTACH_ING -> ESM_SYSTEM_ATTACH_NORMAL`, `ESM cause for attach PDN: (0)` | ESM进入正常态，无失败 cause             |
| 14:43:00.119616 | `NAS_REG_STATUS_REGISTERED_HOME`                                                     | CS/PS NAS注册态为 home             |

## AT/URC关键字段

| 时间 | 字段 | 含义 |
|---|---|---|
| 14:43:00.119616 | `+PSBEARER: 4096,3,0,0` | PS bearer 状态上报 |
| 14:43:00.119616 | `+EREG: 1,"E68A","04E0C636",4096,0,0,0,0` | LTE注册成功；TAC=`0xE68A`，CI=`0x04E0C636` |
| 14:43:00.119616 | `+EGREG: 1,"E68A","04E0C636",4096,"00",0,0,0,0` | 分组域注册成功 |
| 14:43:00.119616 | `+EIAREG: ME ATTACH "3gnet.MNC001.MCC460.GPRS",IPV4V6,0` | 初始附着 APN 为 `3gnet`，PDN type 为 `IPV4V6` |
| 14:43:00.319616 | `+ELTEBWINFO: 200` | LTE小区带宽上报，AP侧折算为 20000 kHz |

字段换算：

| 字段 | 十六进制 | 十进制 / AP侧显示 |
|---|---|---|
| TAC | `0xE68A` | `59018` |
| Cell ID | `0x04E0C636` | `81839670` |
| EARFCN | AP侧 `1650` | LTE Band 3 |
| PCI | AP侧 `251` | `251` |
| Bandwidth | AT侧 `200` | AP侧 `20000` |

## AP侧同步链路

| 时间 | 证据 | 含义 |
|---|---|---|
| 14:42:55.774929 | `UNSOL_RESPONSE_RADIO_STATE_CHANGED radioStateChanged: 1 [PHONE1]` | PHONE1 radio 可用 |
| 14:42:57.963570 | `[GsmSST1] setRadioPowerForReason power:true ... radioState:1` | ServiceStateTracker尝试保持 radio on |
| 14:43:00.167293 | `[0184]> SET_DATA_PROFILE [PHONE1]` | AP下发数据 profile |
| 14:43:00.189905 | `[0185]> SET_INITIAL_ATTACH_APN ... 3gnet ... 46001 ... IPV4V6 ... preferred=true [PHONE1]` | AP下发 initial attach APN |
| 14:43:00.193420 | `[0184]< SET_DATA_PROFILE [PHONE1]` | 数据 profile 下发成功 |
| 14:43:00.210898 | `[0185]< SET_INITIAL_ATTACH_APN [PHONE1]` | initial attach APN 下发成功 |
| 14:43:00.398053 | `[0191]< OPERATOR {CHN-UNICOM, UNICOM, 46001} [PHONE1]` | AP侧运营商同步为中国联通 46001 |
| 14:43:00.454817 | `[0192]< DATA_REGISTRATION_STATE ... REG_HOME, rat: LTE ... tac: 59018, earfcn: 1650 ... bandwidth: 20000` | PS域 LTE 注册成功 |
| 14:43:00.481418 | `[0193]< VOICE_REGISTRATION_STATE ... REG_HOME, rat: LTE ... registeredPlmn: 46001` | CS域服务态同步为 LTE home |
| 14:43:03.993830 | `NetworkRegistrationInfo{ domain=PS ... registrationState=HOME ... accessNetworkTechnology=LTE rejectCause=0 ... availableServices=[DATA,MMS] ... rRplmn=46001 }` | Android注册信息合成成功 |
| 14:43:04.751294 | `[GsmSST1] Poll ServiceState done: newSS={mVoiceRegState=0(IN_SERVICE), mDataRegState=0(IN_SERVICE) ... LTE}` | ServiceState进入 IN_SERVICE |
| 14:43:10.706226 | `onSetupDataNetwork: dataProfile=... 3gnet ... service state=IN_SERVICE` | 默认数据网络开始建立，使用 `3gnet` |

## 判断口径

- 这不是只在 AP 侧显示有网的样例；modem 侧已看到完整 `Attach Request / Attach Accept / Attach Complete`，且 ESM 进入 `ATTACH_NORMAL`。
- `+EREG/+EGREG` 中的 `TAC/CI` 与 AP `CellIdentityLte` 中的 `tac/ci` 能对齐，说明 AP 与 modem 看的是同一个 LTE 小区。
- PHONE0 在本日志中多次为 radio off / unknown，成功注册链路在 PHONE1；双卡场景下不要把 PHONE0 的无服务误判为本次注册失败。
- `SET_INITIAL_ATTACH_APN` 和 modem 侧 `+EIAREG` 均指向 `3gnet`，APN/PDN type 与默认承载链路一致。
- 如遇 MTK 注册失败，可按本样例反向找第一坏点：是否到 `getCurPlmn`、是否等到 ESM 默认 PDN、是否发出 `EMM_Attach_Request`、是否收到 `EMM_Attach_Accept`、是否有 `active EPS bearer ID`、AP 是否同步 `REG_HOME/IN_SERVICE`。

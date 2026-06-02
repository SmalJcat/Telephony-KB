---
doc_type: reference
domain: Configuration
status: active
quality: generated
platform: MTK
layer: Modem NV
mapping_type: NV parameter mapping
source: MTK modem code /home/wx/Modem/alps-release-s0.mp1.rc-tb-default_modem/modem
generated_on: 2026-05-27
search_tier: reference_only
---

# MTK 网络与能力 NV字段映射

<!-- REFERENCE_ONLY_BOUNDARY_START -->
## 使用边界

- 本页是字段表、参数表或外部片段，只用于查字段、查来源、做关键词回溯。
- 不作为流程结论、配置生效结论或真实问题第一坏点引用。
- 需要判断问题时，先回到对应主文档、排障流程或 Case。
<!-- REFERENCE_ONLY_BOUNDARY_END -->


## 阅读入口

- 本文从 [MTK-Modem-NV字段映射](MTK-Modem-NV字段映射.md) 拆出，只作为网络选择、UE capability、RAT 能力和 RF 能力相关 NV 字段定位表。
- 优先用 `PLMN`、`UE capability`、`LTE`、`NAS`、`C2K`、`UMTS`、`RF`、`band` 等关键词搜索，不按全文顺序阅读。
- 表内字段只能作为候选映射；最终配置要回到目标分支源码、默认 NV、生成产物和设备端 running NV 交叉确认。

用于把 LTE/UE capability、NAS、PLMN/network selection、C2K、UMTS/TD、RF capability 等运营商需求映射到 MTK modem NV 字段。

| 业务域 | NV/LID | 字段路径 | 参数作用 | 取值/单位/枚举 | 来源 |
|---|---|---|---|---|---|
| C2K | `NVRAM_EF_C2K_EHRPD_LID` | `pcmt_val_ehrpd` | PPP Partial Context Maintenance timer eHRPD: standalone eHRPD scenario. Unit: second. |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1092` |
| C2K | `NVRAM_EF_C2K_EHRPD_LID` | `pcmt_val_irat` | PPP Partial Context Maintenance timer eHRPD: LTE IRAT transition scenario. Unit: second. |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1093` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `AN_NAI` | AN NAI for A12 Authentication.can modify but with care according to the real NW. |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:980` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `DNS_PRI_IP_ADDR` | Primary DNS Server IP Address |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:986` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `DNS_SEC_IP_ADDR` | Secondary DNS Server IP Address |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:987` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `MipNaiEnabled` | Mip NAI enable or not |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1003` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `NumDeRegRetries` | Mip De-registration retry numbers, value 1-4 |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1001` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `NumRegRetries` | RRP MIP Registration Retry Attempts. value 0-2 |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:962` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `Padding` | padding, Padding[0] used and cannot modify |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1043` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `RRA` | Pre Re-registration backoff. value 0-3780 sec |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:963` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `RRPTimeout` | Timeout waiting for Registration Reply to MIP Registration Request.value 0-4 |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:961` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `SIP_DUN_NAI` | DUN NAI for DUN SIP challenge.can modify but with care according to the real NW. |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:979` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `SIP_NAI` | NAI for SIP challenge.can modify but with care according to the real NW. |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:978` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `T_DO_Retry` | EVDO connection retry timer |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:998` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `T_Dormancy` | HSPD into dormancy tiemr, value 1-60 |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:996` |
| C2K | `NVRAM_EF_C2K_HSPD_LID` | `T_Rapid_Dormancy` | HSPD into dormancy fast timer, value 1-10 |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:999` |
| C2K | `NVRAM_EF_C2K_VAL_SMS_CBS_LID` | `CbsState` | FALSE, CBS off; TRUE, CBS on |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1870` |
| C2K | `NVRAM_EF_C2K_VAL_SMS_CBS_LID` | `ChaMask` | channels bitmap |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1876` |
| C2K | `NVRAM_EF_C2K_VAL_SMS_CBS_LID` | `CmasMask` | cmas bitmap |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1879` |
| C2K | `NVRAM_EF_C2K_VAL_SMS_CBS_LID` | `LanMask` | language bitmap |  | `mcu/interface/service/nvram/c2k_nvram_editor.h:1873` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte1` | the first byte of the CSIM profile(Download) | b1:1 Profile download; b2:1 SMS-PP data download; b3:1 Reserved; b4:1 Menu selection; b5:1 SMS-PP data download; b6:1 Timer expiration; b7:1 Reserved; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2079` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte10` | the tenth byte of the CSIM profile(Soft keys support) | b1:1 Soft keys support for SELECT ITEM; b2:1 Soft keys support for SET UP MENU; b3:1 Reserved; b4:1 Reserved; b5:1 Reserved; b6:1 Reserved; b7:1 Reserved; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2427` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte11` | the eleventh byte of the CSIM profile(Soft keys information) | b1_8:8 Maximum number of soft keys available / 0xFF=Reserved for future use | `mcu/interface/service/nvram/c2k_nvram_editor.h:2459` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte12` | the twelfth byte of the CSIM profile(Bearer Independent protocol commands) | b1:1 Proactive UICC: OPEN CHANNEL; b2:1 Proactive UICC: CLOSE CHANNEL; b3:1 Proactive UICC: RECEIVE DATA; b4:1 Proactive UICC: SEND DATA; b5:1 Proactive UICC: GET CHANNEL STATUS; b6:1 Reserved; b7:1 Reserved; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2467` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte13` | the thirteenth byte of the CSIM profile(Bearer Independent protocol commands) | b1:1 Reserved; b2:1 Reserved; b3:1 Reserved; b4:1 Reserved; b5:1 Reserved; b6_8:3 Number of channels supported by terminal | `mcu/interface/service/nvram/c2k_nvram_editor.h:2505` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte14` | the fourteenth byte of the CSIM profile(Screen height) | b1_5:5 Number of characters supported down the terminal display; b6:1 Reserved; b7:1 Reserved; b8:1 Screen Sizing Parameters supported / 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2527` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte15` | the fifteenth byte of the CSIM profile(Screen width) | b1_7:1 Number of characters across the terminal display; b8:1 Variable size fonts / 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2545` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte16` | the sixteenth byte of the CSIM profile(Screen effects) | b1:1 Display can be resized; b2:1 Text Wrapping supported; b3:1 Text Scrolling supported; b4:1 Reserved; b5:1 Reserved; b6_8:1 Width reduction when in a menu / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2557` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte17` | the seventeenth byte of the CSIM profile(Bearer Independent protocol) | b1:1 TCP, UICC in client mode, remote connection; b2:1 UDP, UICC in client mode, remote connection; b3:1 Reserved; b4:1 Reserved; b5:1 Reserved; b6:1 Reserved; b7:1 Reserved; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2585` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte18` | the eighteenth byte of the CSIM profile | b1:1 Proactive UICC: DISPLAY TEXT (Variable Time out); b2:1 Proactive UICC: GET INKEY (help is supported); b3:1 Reserved; b4:1 Proactive UICC: GET INKEY (Variable Timeout); b5:1 Proactive UICC: PROVIDE LOCAL INFORMATION (ESN); b6:1 Reserved; b7:1 Reserved; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2617` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte19` | the nineteenth byte of the CSIM profile | b1_8:8 Reserved | `mcu/interface/service/nvram/c2k_nvram_editor.h:2653` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte2` | the second byte of the CSIM profile(Other) | b1:1 Command result; b2:1 Reserved; b3:1 Reserved; b4:1 Reserved; b5:1 Reserved; b6:1 UCS2 Entry supported; b7:1 UCS2 Display supported; b8:1 Display Text / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2117` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte20` | the twentieth byte of the CSIM profile(Proactive R-UIM) | b1:1 SEND CDMA SMS; b2:1 CDMA SMS-PP data download; b3:1 Reserved; b4:1 Reserved; b5:1 Reserved; b6:1 Reserved; b7:1 Reserved; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2660` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte3` | the third byte of the CSIM profile(Proactive UICC) | b1:1 Proactive UICC: DISPLAY TEXT; b2:1 Proactive UICC: GET INKEY; b3:1 Proactive UICC: GET INPUT; b4:1 Proactive UICC: MORE TIME; b5:1 Proactive UICC: PLAY TONE; b6:1 Proactive UICC: POLL INTERVAL; b7:1 Proactive UICC: POLLING OFF; b8:1 Proactive UICC: REFRESH / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported / ...(+4 enum values) | `mcu/interface/service/nvram/c2k_nvram_editor.h:2153` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte4` | the fourth byte of the CSIM profile(Proactive UICC) | b1:1 Proactive UICC: SELECT ITEM; b2:1 Proactive UICC: SEND SHORT MESSAGE with 3GPP-SMS-TPDU; b3:1 Reserved; b4:1 Reserved; b5:1 Proactive UICC: SET UP CALL; b6:1 Proactive UICC: SET UP MENU; b7:1 Proactive UICC: PROVIDE LOCAL INFORMATION (MCC, MNC, LAC, Cell ID & IMEI); b8:1 Proactive UICC: PROVIDE LOCAL INFORMATION (NMR) / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2197` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte5` | the fifth byte of the CSIM profile(Event driven information) | b1:1 Proactive UICC: SET UP EVENT LIST; b2:1 EVENT: MT call; b3:1 EVENT: Call connected; b4:1 EVENT: Call disconnected; b5:1 EVENT: Location status; b6:1 EVENT: User activity; b7:1 EVENT: Idle screen available; b8:1 EVENT: Card reader status / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported / ...(+4 enum values) | `mcu/interface/service/nvram/c2k_nvram_editor.h:2237` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte6` | the sixth byte of the CSIM profile(Event driven information extensions) | b1:1 EVENT: Language selection; b2:1 EVENT: Browser Termination; b3:1 EVENT: Data available; b4:1 EVENT: Channel status; b5:1 EVENT: Access Technology Change; b6:1 EVENT: Display parameters changed; b7:1 EVENT: Local Connection; b8:1 EVENT: Network Search Mode Change / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported / ...(+4 enum values) | `mcu/interface/service/nvram/c2k_nvram_editor.h:2281` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte7` | the seventh byte of the CSIM profile(Multiple card proactive commands) | b1:1 Reserved; b2:1 Reserved; b3:1 Reserved; b4:1 Reserved; b5:1 Reserved; b6:1 Reserved; b7:1 Reserved; b8:1 Reserved | `mcu/interface/service/nvram/c2k_nvram_editor.h:2325` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte8` | the eighth byte of the CSIM profile(Proactive UICC) | b1:1 Proactive UICC: TIMER MANAGEMENT (start, stop); b2:1 Reserved; b3:1 Proactive UICC: PROVIDE LOCAL INFORMATION (data time and time zone); b4:1 Proactive UICC: GET INKEY; b5:1 Reserved; b6:1 Reserved; b7:1 SETUP VALL; b8:1 Reserved / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2353` |
| C2K | `NVRAM_EF_CSIM_PROFILE_LID` | `byte9` | the ninth byte of the CSIM profile | b1:1 DISPLAY TEXT; b2:1 Reserved; b3:1 Proactive UICC: PROVIDE LOCAL INFORMATION (NMR); b4:1 Proactive UICC: PROVIDE LOCAL INFORMATION (language); b5:1 Proactive UICC: PROVIDE LOCAL INFORMATION (Timing Advance); b6:1 Reserved; b7:1 Reserved; b8:1 Proactive UICC: PROVIDE LOCAL INFORMATION (Access Technology) / 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported; 0x0=Not Supported; 0x1=Supported | `mcu/interface/service/nvram/c2k_nvram_editor.h:2389` |
| CL1 | `NVRAM_EF_CL1_CUST_ANT_FE_ROUTE_DATABASE_LID` | `ant_tuner_fe_route_database` | UTAS setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:940` |
| CL1 | `NVRAM_EF_CL1_CUST_BPI_CFG_LID` | `bpi_data` | BPI data configuration. |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:333` |
| CL1 | `NVRAM_EF_CL1_CUST_BPI_CFG_LID` | `bpi_timing` | BPI timing configuration. |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:357` |
| CL1 | `NVRAM_EF_CL1_CUST_DAT_ANT_TUNER_ROUTE_DATABASE_LID` | `c2k_dat_fe_route_db` | UDAT setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1217` |
| CL1 | `NVRAM_EF_CL1_CUST_DAT_ANT_TUNER_ROUTE_DATABASE_LID` | `feature_enable` | UDAT enable |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1216` |
| CL1 | `NVRAM_EF_CL1_CUST_ELNA_CFG_LID` | `elnaMapping_RX` | RX ELNA index setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1027` |
| CL1 | `NVRAM_EF_CL1_CUST_ELNA_CFG_LID` | `elnaMapping_RXD` | RXD ELNA index setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1028` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `band_support` | Band Class configuration. |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:303` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `det_lna_port_sel` | DET LNA port selection |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:313` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `pa_control_sel` | PA control type(mipi/bpi) |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:317` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `pa_timing` | PA control timing |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:307` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `pa_vdd_src_sel` | PA power selection |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:309` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `rx_diversity_enable` | RX diversity enable setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:314` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `rx_diversity_only_test_enable` | RX diversity only test enable setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:315` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `rx_lna_port_sel` | RX LNA port selection |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:310` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `rxd_lna_port_sel` | RXD LNA port selection |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:311` |
| CL1 | `NVRAM_EF_CL1_CUST_PARAM_LID` | `tx_lna_port_sel` | TX LNA port selection |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:312` |
| CL1 | `NVRAM_EF_CL1_CUST_RF_HOPPING_LID` | `c2k_rf_hopping_table` | Frequency hopping table setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1335` |
| CL1 | `NVRAM_EF_CL1_CUST_RF_HOPPING_LID` | `c2k_rf_hopping_table_en` | Frequency hopping table enable |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1334` |
| CL1 | `NVRAM_EF_CL1_CUST_TAS_FEATURE_LID` | `force_mode_tas_feature` | Force TAS setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:724` |
| CL1 | `NVRAM_EF_CL1_CUST_TAS_FEATURE_LID` | `tas_enable_on_real_sim` | TAS enable(Real sim) |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:728` |
| CL1 | `NVRAM_EF_CL1_CUST_TAS_FEATURE_LID` | `tas_enable_on_test_sim` | TAS enable(Test sim) |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:729` |
| CL1 | `NVRAM_EF_CL1_CUST_TAS_FEATURE_LID` | `tas_init_ant_state` | TAS init state |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:727` |
| CL1 | `NVRAM_EF_CL1_CUST_TAS_FEATURE_LID` | `tas_version` | TAS version |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:722` |
| CL1 | `NVRAM_EF_CL1_CUST_UTAS_ALGORITHM_PARAMETER_LID` | `UTAS_BRX_PARAMETER` | Blind Rx switching parameter |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:997` |
| CL1 | `NVRAM_EF_CL1_CUST_UTAS_ALGORITHM_PARAMETER_LID` | `UTAS_BTx_SO_PARAMETER` | Blind Tx switching parameter |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:984` |
| CL1 | `NVRAM_EF_CL1_CUST_UTAS_ALGORITHM_PARAMETER_LID` | `UTAS_DB_PARAMETER` | Dynamic barrier parameter |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:973` |
| CL1 | `NVRAM_EF_CL1_CUST_UTAS_ALGORITHM_PARAMETER_LID` | `UTAS_HTP_PARAMETER` | HTP parameter |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1009` |
| CL1 | `NVRAM_EF_CL1_CUST_UTAS_ALGORITHM_PARAMETER_LID` | `UTAS_STx_SO_PARAMETER` | sensing Tx switching parameter |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:964` |
| CL1 | `NVRAM_EF_CL1_DAT_FE_CAT_A_DATABASE_LID` | `dat_cat_a_fe_route` | DAT cat a route data |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1098` |
| CL1 | `NVRAM_EF_CL1_DAT_FE_CAT_B_DATABASE_LID` | `dat_cat_b_fe_route` | DAT cat b route data |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1116` |
| CL1 | `NVRAM_EF_CL1_DAT_FE_ROUTE_DATABASE_LID` | `c2k_dat_fe_route_db` | DAT route table setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1080` |
| CL1 | `NVRAM_EF_CL1_DAT_FE_ROUTE_DATABASE_LID` | `feature_enable` | DAT feature enable |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1079` |
| CL1 | `NVRAM_EF_CL1_DAT_MIPI_DATA_CAT_A_LID` | `Table` | DAT MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1155` |
| CL1 | `NVRAM_EF_CL1_DAT_MIPI_DATA_CAT_B_LID` | `Table` | DAT MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1200` |
| CL1 | `NVRAM_EF_CL1_DAT_MIPI_EVENT_CAT_A_LID` | `Table` | DAT event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1134` |
| CL1 | `NVRAM_EF_CL1_DAT_MIPI_EVENT_CAT_B_LID` | `Table` | DAT event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1179` |
| CL1 | `NVRAM_EF_CL1_DPD_COMMON_CTRL_LID` | `d_tar_th_dpd` | used for setting DPD switch point, not care currently |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1292` |
| CL1 | `NVRAM_EF_CL1_DPD_COMMON_CTRL_LID` | `dpd_normal_enable` | DPD feature enable setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1291` |
| CL1 | `NVRAM_EF_CL1_L1D_TX_POWER_OFFSET_LID` | `accTxPwrOffset` | tx power offset in dB of different band from band0 to band20,access tx power += accTxPwrOffset[band],default 0 |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1260` |
| CL1 | `NVRAM_EF_CL1_L1D_TX_POWER_OFFSET_LID` | `maxPwrbackoff` | access max power backoff of different band, UE max tx power -= maxPwrbackoff[band], default 0 |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1261` |
| CL1 | `NVRAM_EF_CL1_MIPI_ETM_PA_SECTION_DATA_1XRTT_LID` | `Table` | ETM TPC PA section data 1xrtt setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:679` |
| CL1 | `NVRAM_EF_CL1_MIPI_ETM_PA_SECTION_DATA_EVDO_LID` | `Table` | ETM TPC PA section data evdo setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:700` |
| CL1 | `NVRAM_EF_CL1_MIPI_ETM_TPC_DATA_LID` | `Table` | ETM TPC MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:658` |
| CL1 | `NVRAM_EF_CL1_MIPI_ETM_TPC_EVENT_LID` | `Table` | ETM TPC event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:636` |
| CL1 | `NVRAM_EF_CL1_MIPI_ETM_TX_DATA_LID` | `Table` | TX MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:611` |
| CL1 | `NVRAM_EF_CL1_MIPI_ETM_TX_EVENT_LID` | `Table` | ETM event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:588` |
| CL1 | `NVRAM_EF_CL1_MIPI_PARAM_LID` | `mipi_enable` | This data is not used. |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:396` |
| CL1 | `NVRAM_EF_CL1_MIPI_PARAM_LID` | `mipi_tool_version` | This data is not used. |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:397` |
| CL1 | `NVRAM_EF_CL1_MIPI_PA_SECTION_DATA_1XRTT_LID` | `Table` | TPC PA section data 1xrtt setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:545` |
| CL1 | `NVRAM_EF_CL1_MIPI_PA_SECTION_DATA_EVDO_LID` | `Table` | TPC PA section data evdo setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:566` |
| CL1 | `NVRAM_EF_CL1_MIPI_PA_SECTION_DPD_DATA_1XRTT_LID` | `Table` | TPC PA section data evdo setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1267` |
| CL1 | `NVRAM_EF_CL1_MIPI_PA_SECTION_DPD_DATA_EVDO_LID` | `Table` | TPC PA section data evdo setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1279` |
| CL1 | `NVRAM_EF_CL1_MIPI_RX_DATA_LID` | `Table` | RX MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:434` |
| CL1 | `NVRAM_EF_CL1_MIPI_RX_EVENT_LID` | `Table` | RX event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:413` |
| CL1 | `NVRAM_EF_CL1_MIPI_TPC_DATA_LID` | `Table` | TPC MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:524` |
| CL1 | `NVRAM_EF_CL1_MIPI_TPC_EVENT_LID` | `Table` | TPC event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:503` |
| CL1 | `NVRAM_EF_CL1_MIPI_TX_DATA_LID` | `Table` | TX MIPI data configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:479` |
| CL1 | `NVRAM_EF_CL1_MIPI_TX_EVENT_LID` | `Table` | TX event table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:458` |
| CL1 | `NVRAM_EF_CL1_PCFE_DPD_OTFC_CUSTOM_PARA_LID` | `dpd_otfc_custom` | used for setting temperature switch point if otfc feature is disable |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1298` |
| CL1 | `NVRAM_EF_CL1_PCFE_DPD_OTFC_CUSTOM_PARA_LID` | `pcfe_custom` | flag of OTFC feature |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1300` |
| CL1 | `NVRAM_EF_CL1_SAR_TX_POWER_OFFSET_LID` | `sar_tbl` | SAR/SWTP table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1242` |
| CL1 | `NVRAM_EF_CL1_TAS_TST_CONFIG_LID` | `tas_tst_band_support` | TAS tst band support |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1317` |
| CL1 | `NVRAM_EF_CL1_TAS_TST_CONFIG_LID` | `tas_tst_enable` | enable query state info |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1316` |
| CL1 | `NVRAM_EF_CL1_TAS_TST_CONFIG_LID` | `tas_tst_state_support` | TAS tst state support |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1318` |
| CL1 | `NVRAM_EF_CL1_TX_POWER_BACK_OFF_LID` | `tbl` | TX power back off setting |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1043` |
| CL1 | `NVRAM_EF_CL1_TX_POWER_OFFSET_LID` | `sar_tbl` | SAR/SWTP table configuration |  | `mcu/interface/service/nvram/cl1_nvram_editor.h:1060` |
| ERAC | `NVRAM_EF_EMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table` | EMM reject cause mapping table. Note: If __SBP_NVRAM_MAP_EMM_CAUSE__ is enabled, UE will apply the mapping rules in the table when processing the reject cause. |  | `mcu/interface/service/nvram/erac_nvram_editor.h:522` |
| ERRC | `NVRAM_EF_ERRC_AFR_SETTING_LID` | `hplmn_afr_mapping` | AFR feture setting depends on home PLMN in IMSI |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1927` |
| ERRC | `NVRAM_EF_ERRC_CUSTOM_FEATURE_LID` | `cap_by_plmn_table` | [DOC]ERRC capability setting by PLMN |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2706` |
| ERRC | `NVRAM_EF_ERRC_CUSTOM_FEATURE_LID` | `dynamic_downgrade_capa_setting` | [DOC] feature setting for dynamic downgrade capability |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2687` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `Q_qualmin_th_high` | [Doc] |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1744` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `Q_qualmin_th_low` | [Doc] |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1745` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `Q_qualmin_val` | [Doc] |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1746` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `Q_rxlev_th_high` | [Doc] |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1740` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `Q_rxlev_th_low` | [Doc] |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1741` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `Q_rxlev_val` | [Doc] |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1742` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `afr_mib_sib1_protect_tim_val` | MIB/SIB1 protection timer for AFR |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1712` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `afr_timer` | The guard timer value of AFR procedure.Unit in secound default:2. |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1667` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `background_search_status_in_test_mode` | Background Search related parameter setting when UE in test mode. | b1:1 2G4 FDD Background Search.; b2:1 3G4 FDD Background Search.; b3:1 2G4 TDD Background Search.; b4:1 3G4 TDD Background Search.; b5:4 Reserved. | `mcu/interface/service/nvram/errc_nvram_editor.h:1658` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `crc_ng_tim_shift` | CRC NG timer |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1633` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `csfb_enhancement_item_status` | CSFB/AFR related parameter setting. Note:If enable ___DISABLE_3G_AFR__, 3G AFR will be disabled | b1:1 not used; b2:1 Reduce LAU; b3:1 Defer SI13; b4:1 2G AFR; b5:1 3G AFR; b6:3 reserved | `mcu/interface/service/nvram/errc_nvram_editor.h:1637` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `csfb_enhancement_item_status_2` | CSFB/AFR related parameter setting part2. | b1:1 2G FDD eCSFB; b2:1 3G FDD eCSFB; b3:1 2G TDD eCSFB; b4:1 3G TDD eCSFB; b5:4 reserved | `mcu/interface/service/nvram/errc_nvram_editor.h:1669` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `csfb_enhancement_item_status_2_in_test_mode` | CSFB/AFR related parameter setting part 2 when UE in test mode. | b1:1 2G FDD eCSFB; b2:1 3G FDD eCSFB; b3:1 2G TDD eCSFB; b4:1 3G TDD eCSFB; b5:4 reserved | `mcu/interface/service/nvram/errc_nvram_editor.h:1677` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `csfb_enhancement_item_status_in_test_mode` | CSFB/AFR related parameter setting when UE in test mode. | b1:1 not used; b2:1 Reduce LAU; b3:1 Defer SI13; b4:1 2G AFR; b5:1 3G AFR; b6:3 reserved | `mcu/interface/service/nvram/errc_nvram_editor.h:1646` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `customer_handover_other_si_protection_tim_val` | protection timer for SI when HO |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1718` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `customer_handover_si1_protection_tim_val` | protection timer for SI1 when HO |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1716` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `customer_other_si_protection_tim_val` | protection timer for SI |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1717` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `customer_si1_protection_tim_val` | protection timer for SI1 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1715` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `enable_cust_qqual` | [Doc] Customized Qqualmin |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1743` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `enable_cust_qrxlev` | [Doc] Customized Qrxlevmin |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1739` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `enable_cust_resel_s_judge` | Customized reselection SIB1 Srxlev judge |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1771` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `errc_detection_timer_2` | detect no data period, Note: need turn on SBP_STMSI_PAGING_ATTACK_HANDLING |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1753` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `handover_mib_crc_ng_max` | MIB CRC NG count for handover |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1719` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `handover_mib_sib1_protect_tim_val` | MIB/SIB1 protection timer for handover |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1714` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `handover_si1_crc_ng_max` | SI1 CRC NG count for handover |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1721` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `handover_sib1_crc_ng_max` | SIB1 CRC NG count for handover |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1720` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `ho_mib_sib1_read_timer` | MIB/SIB1 protection timer for handover |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1702` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `ho_sib2_read_timer` | SIB2 protection timer for handover |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1703` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `ir_23g_b_event_rsrp_thresh` | Customized LTE serving cell RSRP threshold to ignore IRAT B event (qdbm) |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1782` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `ir_23g_b_event_rsrq_thresh` | Customized LTE serving cell RSRQ threshold to ignore IRAT B event (qdb) |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1783` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `ir_23g_b_event_sinr_thresh` | Customized LTE serving cell SINR threshold to ignore IRAT B event (qdb) |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1784` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `low_pri_si_crc_ng_max` | Low SI CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1722` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `mib_crc_ng_max` | MIB CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1624` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `mib_sib1_protect_tim_val` | MIB/SIB1 protection timer |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1631` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `pingpong_hist_tbl_valid_dur` | Protection timer for reselection pingpong history table, Note: need to turn on SBP_PINGPONG_AVOIDANCE_ENH |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1752` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `poweron_mib_sib1_protect_tim_val` | MIB/SIB1 protection timer for power on |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1713` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `resel_srxlev_bar_th` | Customized SIB1 Srxlev barring threshold when intra-LTE cell reselection is triggered |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1772` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `resel_srxlev_bar_time` | Customized SIB1 Srxlev barring time when intra-LTE cell reselection is triggered |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1773` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `serv_rsrq_thresh_umts_event` | Customized LTE Serving cell RSRQ threshold for UMTS-B1 cell reporting judgement. (qdbm) |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1777` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `si1_crc_ng_max` | SI1 CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1626` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `si_crc_ng_max` | SI CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1627` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `sib10_crc_ng_max` | SIB10 CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1628` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `sib11_crc_ng_max` | SIB11 CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1629` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `sib12_crc_ng_max` | SIB12 CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1630` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `sib1_crc_ng_max` | SIB1 CRC NG count |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1625` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `sib2_9_protect_tim_val` | SIBs protection timer |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1632` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `standby_mib_sib1_protect_tim_val` | MIB/SIB1 protection timer when standby |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1634` |
| ERRC | `NVRAM_EF_ERRC_PERFORMANCE_PARA_LID` | `standby_sib2_9_protect_tim_val` | SIBs protection timer when standby |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1635` |
| ERRC | `NVRAM_EF_LTE_CAP_LID` | `disable_bw` | disable bandwidth according to band(band 1 ~ band 256), LSB: 6RB,15RB,25RB,50RB,75RB,100RB |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1967` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `access_stratum_release` | spec 36.331 accessStratumRelease |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1984` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `csg_prox_ind_param_r9` | spec 36.331 csg-ProximityIndicationParameters-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2074` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `csg_prox_ind_param_r9.interFreqProximityIndication_r9` | spec 36.331 interFreqProximityIndication-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2076` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `csg_prox_ind_param_r9.intraFreqProximityIndication_r9` | spec 36.331 intraFreqProximityIndication-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2075` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `csg_prox_ind_param_r9.utran_ProximityIndication_r9` | spec 36.331 utran-ProximityIndication-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2077` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `deviceType_r9` | spec 36.331 deviceType-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2073` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `dl_256qam_r12` | spec 36.331 dl-256QAM-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2421` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r10` | spec 36.331 fdd-Add-UE-EUTRA-Capabilities-v1060 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2306` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r10.fgi_r10` | spec 36.331 featureGroupIndRel10-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2308` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r10.pmi_disabling_r10` | spec 36.331 pmi-Disabling-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2307` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11` | spec 36.331 fdd-Add-UE-EUTRA-Capabilities-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2326` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11.ePDCCH_r11` | spec 36.331 ePDCCH-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2327` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11.in_device_coex_ind_r11` | spec 36.331 inDeviceCoexInd-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2332` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11.multi_ACK_CSI_reporting_r11` | spec 36.331 multiACK-CSI-Reporting-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2328` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11.rsrq_meas_wideband_r11` | spec 36.331 rsrqMeasWideband-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2331` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11.ss_CCH_interf_Handl_r11` | spec 36.331 ss-CCH-InterfHandl-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2329` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r11.tx_div_PUCCH1b_ch_select_r11` | spec 36.331 txDiv-PUCCH1b-ChSelect-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2330` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9` | spec 36.331 fdd-Add-UE-EUTRA-Capabilities-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2155` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.feature_group_ind_add_r9` | spec 36.331 featureGroupIndRel9Add-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2161` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.feature_group_ind_r9` | spec 36.331 featureGroupIndicators |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2160` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.irat_param_utra_r9` | spec 36.331 interRAT-ParametersUTRA-v920 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2162` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.irat_param_utra_r9.e_RedirectionUTRA_r9_fdd` | spec 36.331 e-RedirectionUTRA-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2163` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.irat_param_utra_r9.e_RedirectionUTRA_r9_tdd` | spec 36.331 e-RedirectionUTRA-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2164` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9` | spec 36.331 neighCellSI-AcquisitionParameters-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2165` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.interFreqSI_AcquisitionForHO_r9_fdd` | spec 36.331 interFreqSI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2168` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.interFreqSI_AcquisitionForHO_r9_tdd` | spec 36.331 interFreqSI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2169` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.intraFreqSI_AcquisitionForHO_r9_fdd` | spec 36.331 intraFreqSI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2166` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.intraFreqSI_AcquisitionForHO_r9_tdd` | spec 36.331 intraFreqSI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2167` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.utran_SI_AcquisitionForHO_r9_fdd` | spec 36.331 utran-SI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2170` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.utran_SI_AcquisitionForHO_r9_tdd` | spec 36.331 utran-SI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2171` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.phylayer_param_r9` | spec 36.331 phyLayerParameters |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2156` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.phylayer_param_r9.ue_specific_ref_sigs` | spec 36.331 ue-SpecificRefSigsSupported |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2159` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.phylayer_param_r9.ue_tx_ante_sel_fdd` | spec 36.331 ue-TxAntennaSelectionSupported for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2157` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_r9.phylayer_param_r9.ue_tx_ante_sel_tdd` | spec 36.331 ue-TxAntennaSelectionSupported for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2158` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_v1180` | spec 36.331 fdd-Add-UE-EUTRA-Capabilities-v1180 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2373` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_v1180.mbms_non_serving_cell_r11` | spec 36.331 mbms-NonServingCell-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2375` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `fdd_add_ue_eutra_cap_v1180.mbms_scell_r11` | spec 36.331 mbms-SCell-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2374` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `feature_group_ind_add_r9_fdd` | spec 36.331 featureGroupIndRel9Add-r9, Note: option __VOLTE_SUPPOTR__ | FGI64:1 FGI64; FGI63:1 FGI63; FGI62:1 FGI62; FGI61:1 FGI61; FGI60:1 FGI60; FGI59:1 FGI59; FGI58:1 FGI58; FGI57:1 FGI57; FGI56:1 FGI56; FGI55:1 FGI55 / ...(+22 bit items) | `mcu/interface/service/nvram/errc_nvram_editor.h:2087` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `feature_group_ind_add_r9_tdd` | spec 36.331 featureGroupIndRel9Add-r9, Note: option __VOLTE_SUPPOTR__ | FGI64:1 FGI64; FGI63:1 FGI63; FGI62:1 FGI62; FGI61:1 FGI61; FGI60:1 FGI60; FGI59:1 FGI59; FGI58:1 FGI58; FGI57:1 FGI57; FGI56:1 FGI56; FGI55:1 FGI55 / ...(+22 bit items) | `mcu/interface/service/nvram/errc_nvram_editor.h:2121` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `feature_group_ind_fdd` | spec 36.331 featureGroupIndicators | FGI32:1 FGI32; FGI31:1 FGI31; FGI30:1 FGI30; FGI29:1 FGI29; FGI28:1 FGI28; FGI27:1 FGI27; FGI26:1 FGI26; FGI25:1 FGI25; FGI24:1 FGI24; FGI23:1 FGI23 / ...(+22 bit items) | `mcu/interface/service/nvram/errc_nvram_editor.h:1995` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `feature_group_ind_r10_fdd` | spec 36.331 featureGroupIndRel10-r10 | FGI132:1 FGI132; FGI131:1 FGI131; FGI130:1 FGI130; FGI129:1 FGI129; FGI128:1 FGI128; FGI127:1 FGI127; FGI126:1 FGI126; FGI125:1 FGI125; FGI124:1 FGI124; FGI123:1 FGI123 / ...(+22 bit items) | `mcu/interface/service/nvram/errc_nvram_editor.h:2233` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `feature_group_ind_r10_tdd` | spec 36.331 featureGroupIndRel10-r10 | FGI132:1 FGI132; FGI131:1 FGI131; FGI130:1 FGI130; FGI129:1 FGI129; FGI128:1 FGI128; FGI127:1 FGI127; FGI126:1 FGI126; FGI125:1 FGI125; FGI124:1 FGI124; FGI123:1 FGI123 / ...(+22 bit items) | `mcu/interface/service/nvram/errc_nvram_editor.h:2267` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `feature_group_ind_tdd` | spec 36.331 featureGroupIndicators | FGI32:1 FGI32; FGI31:1 FGI31; FGI30:1 FGI30; FGI29:1 FGI29; FGI28:1 FGI28; FGI27:1 FGI27; FGI26:1 FGI26; FGI25:1 FGI25; FGI24:1 FGI24; FGI23:1 FGI23 / ...(+22 bit items) | `mcu/interface/service/nvram/errc_nvram_editor.h:2029` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `freq_band_priority_adjustment_r12` | spec 36.331 freqBandPriorityAdjustment-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2382` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `freq_band_retrieval_r11` | spec 36.331 freqBandRetrieval-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2381` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `high_speed_enh_param_r14` | spec 36.331 highSpeedEnhParameters-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2486` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `high_speed_enh_param_r14.demodulation_enhance_r14` | spec 36.331 demodulationEnhancements-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2489` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `high_speed_enh_param_r14.meas_enhance_r14` | spec 36.331 measurementEnhancements-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2488` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `high_speed_enh_param_r14.prach_enhance_r14` | spec 36.331 prach-Enhancements-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2490` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt` | spec 36.331 cdma2000-1xRTT |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2355` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt.rx_Config_1XRTT` | spec 36.331 rx-Config1XRTT |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2357` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt.tx_Config_1XRTT` | spec 36.331 tx-Config1XRTT |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2356` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt_v1020` | spec 36.331 interRAT-ParametersCDMA2000-v1020 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2363` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt_v1020.e_CSFB_dual_1XRTT_r10` | spec 36.331 e-CSFB-dual-1XRTT-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2364` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt_v920` | spec 36.331 interRAT-ParametersCDMA2000-v920 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2359` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt_v920.e_CSFB_1XRTT_r9` | spec 36.331 e-CSFB-1XRTT-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2360` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_1xrtt_v920.e_CSFB_ConcPS_Mob1XRTT_r9` | spec 36.331 e-CSFB-ConcPS-Mob1XRTT-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2361` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_hrpd` | spec 36.331 cdma2000-HRPD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2351` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_hrpd.rx_Config_HRPD` | spec 36.331 rx-ConfigHRPD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2353` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_hrpd.tx_Config_HRPD` | spec 36.331 tx-ConfigHRPD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2352` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_v1130` | spec 36.331 interRAT-ParametersCDMA2000-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2366` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_c2k_v1130.cdma2000_NW_Sharing_r11` | spec 36.331 cdma2000-NW-Sharing-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2367` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_geram_v920` | spec 36.331 interRAT-ParametersGERAN-v920 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2066` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_geram_v920.dtm_r9` | spec 36.331 dtm-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2067` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_geram_v920.e_RedirectionGERAN_r9` | spec 36.331 e-RedirectionGERAN-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2068` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_tdd_v1020` | spec 36.331 interRAT-ParametersUTRA-TDD-v1020 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2204` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_tdd_v1020.e_RedirectionUTRA_TDD_r10_fdd` | spec 36.331 e-RedirectionUTRA-TDD-r10 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2205` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_tdd_v1020.e_RedirectionUTRA_TDD_r10_tdd` | spec 36.331 e-RedirectionUTRA-TDD-r10 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2206` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v920` | spec 36.331 interRAT-ParametersUTRA-v920 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2070` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v920.e_RedirectionUTRA_r9_fdd` | spec 36.331 e-RedirectionUTRA-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2071` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v920.e_RedirectionUTRA_r9_tdd` | spec 36.331 e-RedirectionUTRA-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2072` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0` | spec 36.331 interRAT-ParametersUTRA-v9c0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2192` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0.srvcc_FromUTRA_FDD_ToGERAN_r9` | spec 36.331 srvcc-FromUTRA-FDD-ToGERAN-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2196` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0.srvcc_FromUTRA_FDD_ToUTRA_FDD_r9` | spec 36.331 srvcc-FromUTRA-FDD-ToUTRA-FDD-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2195` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0.srvcc_FromUTRA_TDD128_ToGERAN_r9` | spec 36.331 srvcc-FromUTRA-TDD128-ToGERAN-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2198` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0.srvcc_FromUTRA_TDD128_ToUTRA_TDD128_r9` | spec 36.331 srvcc-FromUTRA-TDD128-ToUTRA-TDD128-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2197` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0.voiceOverPS_HS_UTRA_FDD_r9` | spec 36.331 voiceOverPS-HS-UTRA-FDD-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2193` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9c0.voiceOverPS_HS_UTRA_TDD128_r9` | spec 36.331 voiceOverPS-HS-UTRA-TDD128-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2194` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9h0` | spec 36.331 interRAT-ParametersUTRA-v9h0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2217` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `irat_param_utra_v9h0.mfbi_utra_r9` | spec 36.331 mfbi-UTRA-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2218` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13` | spec 36.331 LAA-Parameters-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2467` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13.cross_carrier_scheduling_laa_dl_r13` | spec 36.331 crossCarrierSchedulingLAA-DL-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2470` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13.csi_rs_drs_rrm_measure_laa_r13` | spec 36.331 csi-RS-DRS-RRM-MeasurementsLAA-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2475` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13.downlink_laa_r13` | spec 36.331 downlinkLAA-r13downlinkLAA-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2469` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13.ending_dwpts_r13` | spec 36.331 endingDwPTS-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2471` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13.second_slot_starting_position_r13` | spec 36.331 secondSlotStartingPosition-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2472` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `laa_param_r13.tm9_laa_r13` | spec 36.331 tm9-LAA-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2473` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwa_param_r13` | spec 36.331 lwa-Parameters-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2413` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwa_param_r13.lwa_buffer_size_r13` | spec 36.331 lwa-BufferSize-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2416` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwa_param_r13.lwa_r13` | spec 36.331 lwa-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2414` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwa_param_r13.lwa_split_bearer_r13` | spec 36.331 lwa-SplitBearer-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2415` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwi_param_1310` | spec 36.331 wlan-IW-Parameters-v1310 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2453` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwi_param_1310.rclwi_r13` | spec 36.331 rclwi-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2454` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwi_param_r12` | spec 36.331 WLAN-IW-Parameters-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2425` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwi_param_r12.wlan_iw_andsf_policies_r12` | spec 36.331 wlan-IW-ANDSF-Policies-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2427` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwi_param_r12.wlan_iw_ran_rules_r12` | spec 36.331 wlan-IW-RAN-Rules-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2426` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwip_param_r13` | spec 36.331 lwip-Parameters-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2456` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `lwip_param_r13.lwip_r13` | spec 36.331 lwip-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2457` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_r12` | spec 36.331 mac-Parameters-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2395` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_r12.logical_channel_sr_prohibit_timer_r12` | spec 36.331 logicalChannelSR-ProhibitTimer-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2397` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_r12.long_drx_command_r12` | spec 36.331 longDRX-Command-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2396` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430` | spec 36.331 mac-Parameters-v1430 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2520` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430.data_inact_mon_r14` | spec 36.331 dataInactMon-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2526` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430.multi_ul_sps_r14` | spec 36.331 multipleUplinkSPS-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2525` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430.short_sps_interval_fdd_r14` | spec 36.331 shortSPS-IntervalFDD-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2521` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430.short_sps_interval_tdd_r14` | spec 36.331 shortSPS-IntervalTDD-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2522` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430.skip_ul_dynamic_r14` | spec 36.331 skipUplinkDynamic-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2523` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mac_param_v1430.skip_ul_sps_r14` | spec 36.331 skipUplinkSPS-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2524` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mbms_param_r11` | spec 36.331 mbms-Parameters-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2369` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mbms_param_r11.mbms_non_serving_cell_r11` | spec 36.331 mbms-NonServingCell-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2371` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mbms_param_r11.mbms_scell_r11` | spec 36.331 mbms-SCell-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2370` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1130` | spec 36.331 measParameters-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2318` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1130.rsrq_meas_wideband_r11` | spec 36.331 rsrqMeasWideband-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2319` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v11a0` | spec 36.331 measParameters-v11a0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2418` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v11a0.benefits_from_interruption_r11` | spec 36.331 benefitsFromInterruption-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2419` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250` | spec 36.331 measParameters-v1250 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2384` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.alternative_time_to_trigger_r12` | spec 36.331 alternativeTimeToTrigger-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2388` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.crs_ds_meas_r12` | spec 36.331 crs-DiscoverySignalsMeas |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2389` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.csi_rs_dsm_r12` | spec 36.331 csi-RS-DiscoverySignalsMeas-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2393` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.extended_max_measid_r12` | spec 36.331 extendedMaxMeasId-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2392` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.extended_rsrq_lower_range_r12` | spec 36.331 extendedRSRQ-LowerRange-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2390` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.inc_mon_eutra_r12` | spec 36.331 incMonEUTRA-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2386` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.inc_mon_utra_r12` | spec 36.331 incMonUTRA-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2387` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.rsrq_on_all_symbols_r12` | spec 36.331 rsrq-OnAllSymbols-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2391` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1250.timer_t312_r12` | spec 36.331 timerT312-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2385` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310` | spec 36.331 measParameters-v1310 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2436` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.multi_band_info_report_r13` | spec 36.331 multiBandInfoReport-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2441` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.multi_band_info_report_r13` | spec 36.331 multiBandInfoReport-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2447` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.rs_sinr_meas_r13` | spec 36.331 rs-SINR-Meas-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2438` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.rssi_and_channel_occupancy_reporting_r13` | spec 36.331 rssi-AndChannelOccupancyReporting-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2443` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.rssi_and_channel_occupancy_reporting_r13` | spec 36.331 rssi-AndChannelOccupancyReporting-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2449` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.ul_pdcp_delay_r13` | spec 36.331 ul-PDCP-Delay-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2440` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.white_cell_list_r13` | spec 36.331 whiteCellList-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2439` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `meas_param_v1310.white_cell_list_r13` | spec 36.331 whiteCellList-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2446` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mmtel_param_r14` | spec 36.331 mmtel-Parameters-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2515` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mmtel_param_r14.delay_budget_rpt_r14` | spec 36.331 delayBudgetReporting-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2516` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mmtel_param_r14.pusch_enhancements_r14` | spec 36.331 pusch-Enhancements-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2517` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mmtel_param_r14.recommend_bit_rate_query_r14` | spec 36.331 recommendedBitRateQuery-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2519` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `mmtel_param_r14.recommend_bit_rate_r14` | spec 36.331 recommendedBitRate-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2518` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9` | spec 36.331 neighCellSI-AcquisitionParameters-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2078` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9.interFreqSI_AcquisitionForHO_r9_fdd` | spec 36.331 interFreqSI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2081` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9.interFreqSI_AcquisitionForHO_r9_tdd` | spec 36.331 interFreqSI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2082` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9.intraFreqSI_AcquisitionForHO_r9_fdd` | spec 36.331 intraFreqSI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2079` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9.intraFreqSI_AcquisitionForHO_r9_tdd` | spec 36.331 intraFreqSI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2080` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9.utran_SI_AcquisitionForHO_r9_fdd` | spec 36.331 utran-SI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2083` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nei_cell_si_acq_r9.utran_SI_AcquisitionForHO_r9_tdd` | spec 36.331 utran-SI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2084` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `netw_meas_param_v1250` | spec 36.331 UE-BasedNetwPerfMeasParameters-v1250 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2422` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `netw_meas_param_v1250.logged_mbsfn_measurements_r12` | spec 36.331 loggedMBSFNMeasurements-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2423` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nw_perf_meas_param_r10` | spec 36.331 ue-BasedNetwPerfMeasParameters-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2302` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nw_perf_meas_param_r10.logged_measurements_idle_r10` | spec 36.331 loggedMeasurementsIdle-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2303` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `nw_perf_meas_param_r10.standalone_GNSS_location_r10` | spec 36.331 standaloneGNSS-Location-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2304` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `otdoa_pos_cap_r10` | spec 36.331 otdoa-PositioningCapabilities-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2220` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `otdoa_pos_cap_r10.inter_freq_rstd_meas_r10` | spec 36.331 interFreqRSTD-Measurement-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2222` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `otdoa_pos_cap_r10.otdoa_ue_assisted_r10` | spec 36.331 otdoa-UE-Assisted-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2221` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_r11` | spec 36.331 otherParameters-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2321` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_r11.in_device_coex_ind_r11` | spec 36.331 inDeviceCoexInd-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2322` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_r11.power_pref_ind_r11` | spec 36.331 powerPrefInd-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2323` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_r11.ue_rx_tx_time_diff_measurements_r11` | spec 36.331 ue-Rx-TxTimeDiffMeasurements-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2324` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_v11d0` | spec 36.331 otherParameters-v11d0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2410` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_v11d0.in_device_coex_ind_ul_ca_r11` | spec 36.331 inDeviceCoexInd-UL-CA-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2411` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_v1360` | spec 36.331 other-Parameters-v1360 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2506` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `other_param_v1360.in_device_co_ind_hw_sharing_ind_r13` | spec 36.331 inDeviceCoexInd-HardwareSharingInd-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2507` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param` | spec 36.331 pdcp-Parameters |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1986` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param.max_num_rohc_sessions` | spec 36.331 maxNumberROHC-ContextSessions |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1988` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param.rohc_profiles` | spec 36.331 supportedROHC-Profiles |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1987` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1130` | spec 36.331 pdcp-Parameters-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2314` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1130.pdcp_SN_extension_r11` | spec 36.331 pdcp-SN-Extension-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2315` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1130.support_rohc_context_continue_r11` | spec 36.331 supportRohcContextContinue-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2316` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1430` | spec 36.331 pdcp-Parameters-v1430 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2480` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1430.rohc_ul` | spec 36.331 supportedUplinkOnlyROHC-Profiles-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2482` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1430.rohc_ul_profiles` | spec 36.331 supportedUplinkOnlyROHC-Profiles-r14 -profile0x0006-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2483` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1530` | spec 36.331 pdcp-Parameters-v1530 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2535` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `pdcp_param_v1530.supported_udc` | spec 36.331 supported-UDC-v1530 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2536` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param` | spec 36.331 phyLayerParameters |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1990` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param.ue_specific_ref_sigs` | spec 36.331 ue-SpecificRefSigsSupported |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1993` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param.ue_tx_ante_sel_fdd` | spec 36.331 ue-TxAntennaSelectionSupported for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1991` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param.ue_tx_ante_sel_tdd` | spec 36.331 ue-TxAntennaSelectionSupported for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:1992` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020` | spec 36.331 phyLayerParameters-v1020 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2224` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.cross_carrier_scheduling_r10` | spec 36.331 crossCarrierScheduling-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2228` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.multi_cluster_pusch_within_cc_r10` | spec 36.331 multiClusterPUSCH-WithinCC-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2230` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.non_contiguous_ul_ra_with_cc_info_r10` | spec 36.331 nonContiguousUL-RA-WithinCC-Info-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2231` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.pmi_disabling_r10` | spec 36.331 pmi-Disabling-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2227` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.simultaneous_pucch_pusch_r10` | spec 36.331 simultaneousPUCCH-PUSCH-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2229` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.tm9_with_8tx_fdd_r10` | spec 36.331 tm9-With-8Tx-FDD-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2226` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1020.two_antenna_ports_for_puscch_r10` | spec 36.331 twoAntennaPortsForPUCCH-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2225` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130` | spec 36.331 phyLayerParameters-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2208` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.crs_interf_handl_r11` | spec 36.331 crs-InterfHandl-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2210` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.ePDCCH_r11` | spec 36.331 ePDCCH-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2211` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.multi_ACK_CSI_reporting_r11` | spec 36.331 multiACK-CSI-Reporting-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2212` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.ss_CCH_interf_Handl_r11` | spec 36.331 ss-CCH-InterfHandl-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2213` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.tdd_SpecialSubframe_r11` | spec 36.331 tdd-SpecialSubframe-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2209` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.tx_div_PUCCH1b_ch_select_r11` | spec 36.331 txDiv-PUCCH1b-ChSelect-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2214` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1130.ul_CoMP_r11` | spec 36.331 ul-CoMP-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2215` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1170` | spec 36.331 phyLayerParameters-v1170 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2342` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1170.bit1` | spec 36.331 interBandTDD-CA-WithDifferentConfig-r11 MSB |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2343` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1170.bit2` | spec 36.331 interBandTDD-CA-WithDifferentConfig-r11 LSB |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2344` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250` | spec 36.331 phyLayerParameters-v1250 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2399` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250.ds_in_deact_scell_r12` | spec 36.331 discoverySignalsInDeactSCell-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2401` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250.e_harq_pattern_fdd_r12` | spec 36.331 e-HARQ-Pattern-FDD-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2402` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250.enhanced_4tx_codebook_r12` | spec 36.331 enhanced-4TxCodebook-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2403` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250.no_resource_restriction_for_tti_bundling_r12` | spec 36.331 noResourceRestrictionForTTIBundling-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2400` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250.pusch_feedback_mode_r12` | spec 36.331 pusch-FeedbackMode-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2405` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1250.tdd_fdd_ca_pcell_duplex_r12` | spec 36.331 tdd-FDD-CA-PCellDuplex-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2404` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1280` | spec 36.331 phyLayerParameters-v1280 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2429` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1280.alternative_tbs_indices_r12` | spec 36.331 alternativeTBS-Indices-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2430` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1310` | spec 36.331 phyLayerParameters-v1310 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2432` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1310.crs_interf_mitigation_tm10_r13` | spec 36.331 crs-InterfMitigationTM10-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2433` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1310.pdsch_collision_handling_r13` | spec 36.331 pdsch-CollisionHandling-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2434` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320` | spec 36.331 phyLayerParameters-v1320 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2494` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.para_tm9_r13` | spec 36.331 mimo-UE-Parameters-r13-parametersTM9-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2495` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.para_tm9_r13.alt_code_book_r13` | spec 36.331 altCodebook-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2496` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.para_tm9_r13.ch_meas_restriction_r13` | spec 36.331 channelMeasRestriction-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2497` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.para_tm9_r13.csi_rs_enhance_tdd_r13` | spec 36.331 csi-RS-EnhancementsTDD-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2499` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.para_tm9_r13.dmrs_enhance_r13` | spec 36.331 dmrs-Enhancements-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2498` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.srs_enhance_r13` | spec 36.331 srs-Enhancements-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2501` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1320.srs_enhance_tdd_r13` | spec 36.331 srs-EnhancementsTDD-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2500` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1330` | spec 36.331 phyLayerParameters-v1330 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2502` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1330.cch_interf_mitigation_ref_type_a_r13` | spec 36.331 cch-InterfMitigation-RefRecTypeA-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2503` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1330.cch_interf_mitigation_ref_type_b_r13` | spec 36.331 cch-InterfMitigation-RefRecTypeB-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2504` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1330.crs_interf_mitigation_tm1_to_tm9_r13_valid` | spec 36.331 crs-InterfMitigationTM1toTM9-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2505` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430` | spec 36.331 phyLayerParameters-v1430 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2508` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430.alternative_tbs_index_r14` | spec 36.331 alternativeTBS-Index-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2514` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430.dmrs_less_up_pts_r14` | spec 36.331 dmrs-LessUpPTS-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2511` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430.para_tm9_v1430` | spec 36.331 mimo-UE-Parameters-v1430 -parametersTM9-v1430 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2512` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430.para_tm9_v1430.ul_dmrs_enhance_r14` | spec 36.331 ul-dmrs-Enhancements-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2513` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430.tdd_special_subframe_r14` | spec 36.331 tdd-SpecialSubframe-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2509` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v1430.tdd_tti_bundling_r14` | spec 36.331 tdd-TTI-Bundling-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2510` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v920` | spec 36.331 phyLayerParameters-v920 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2063` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v920.enhancedDualLayerFDD_r9` | spec 36.331 enhancedDualLayerFDD-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2064` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v920.enhancedDualLayerTDD_r9` | spec 36.331 enhancedDualLayerTDD-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2065` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v9d0` | spec 36.331 phyLayerParameters-v9d0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2200` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v9d0.tm5_FDD_r9` | spec 36.331 tm5-FDD-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2201` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `phylayer_param_v9d0.tm5_TDD_r9` | spec 36.331 tm5-TDD-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2202` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v10j0` | spec 36.331 RF-Parameters-v10j0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2459` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v10j0.multi_ns_p_max_r10` | spec 36.331 multiNS-Pmax-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2460` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v1130` | spec 36.331 rf-Parameters-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2346` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v1130.multiple_timing_advance_r11` | spec 36.331 multipleTimingAdvance-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2349` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v1130.simultaneous_Rx_Tx_r11` | spec 36.331 simultaneousRx-Tx-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2347` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v1130.supported_CSI_Proc_r11_max_num` | spec 36.331 supportedCSI-Proc-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2348` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v12b0` | spec 36.331 RF-Parameters-v12b0 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2529` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v12b0.maxlayersmimo_indication_r12` | spec 36.331 maxLayersMIMO-Indication-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2530` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v1310` | spec 36.331 RF-Parameters-v1310 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2462` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rf_param_v1310.ue_power_class_1_2_4_5` | spec 36.331 ue-PowerClass-5-r13 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2463` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rlc_param_r12` | spec 36.331 rlc-Parameters-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2407` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `rlc_param_r12.extended_rlc_li_field_r12` | spec 36.331 extended-RLC-LI-Field-r12 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2408` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `son_param_r9` | spec 36.331 son-Parameters-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2085` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `son_param_r9.rach_Report_r9` | spec 36.331 rach-Report-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2086` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r10` | spec 36.331 tdd-Add-UE-EUTRA-Capabilities-v1060 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2310` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r10.fgi_r10` | spec 36.331 featureGroupIndRel10-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2312` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r10.pmi_disabling_r10` | spec 36.331 pmi-Disabling-r10 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2311` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11` | spec 36.331 tdd-Add-UE-EUTRA-Capabilities-v1130 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2334` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11.ePDCCH_r11` | spec 36.331 ePDCCH-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2335` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11.in_device_coex_ind_r11` | spec 36.331 inDeviceCoexInd-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2340` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11.multi_ACK_CSI_reporting_r11` | spec 36.331 multiACK-CSI-Reporting-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2336` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11.rsrq_meas_wideband_r11` | spec 36.331 rsrqMeasWideband-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2339` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11.ss_CCH_interf_Handl_r11` | spec 36.331 ss-CCH-InterfHandl-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2337` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r11.tx_div_PUCCH1b_ch_select_r11` | spec 36.331 txDiv-PUCCH1b-ChSelect-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2338` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9` | spec 36.331 tdd-Add-UE-EUTRA-Capabilities-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2172` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.feature_group_ind_add_r9` | spec 36.331 featureGroupIndRel9Add-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2179` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.feature_group_ind_r9` | spec 36.331 featureGroupIndicators |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2178` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.irat_param_utra_r9` | spec 36.331 interRAT-ParametersUTRA-v920 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2180` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.irat_param_utra_r9.e_RedirectionUTRA_r9_fdd` | spec 36.331 e-RedirectionUTRA-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2181` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.irat_param_utra_r9.e_RedirectionUTRA_r9_tdd` | spec 36.331 e-RedirectionUTRA-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2182` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9` | spec 36.331 neighCellSI-AcquisitionParameters-r9 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2184` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.interFreqSI_AcquisitionForHO_r9_fdd` | spec 36.331 interFreqSI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2187` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.interFreqSI_AcquisitionForHO_r9_tdd` | spec 36.331 interFreqSI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2188` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.intraFreqSI_AcquisitionForHO_r9_fdd` | spec 36.331 intraFreqSI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2185` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.intraFreqSI_AcquisitionForHO_r9_tdd` | spec 36.331 intraFreqSI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2186` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.utran_SI_AcquisitionForHO_r9_fdd` | spec 36.331 utran-SI-AcquisitionForHO-r9 for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2189` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.nei_cell_si_acq_r9.utran_SI_AcquisitionForHO_r9_tdd` | spec 36.331 utran-SI-AcquisitionForHO-r9 for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2190` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.phylayer_param_r9` | spec 36.331 phyLayerParameters |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2173` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.phylayer_param_r9.ue_specific_ref_sigs` | spec 36.331 ue-SpecificRefSigsSupported |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2176` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.phylayer_param_r9.ue_tx_ante_sel_fdd` | spec 36.331 ue-TxAntennaSelectionSupported for FDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2174` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_r9.phylayer_param_r9.ue_tx_ante_sel_tdd` | spec 36.331 ue-TxAntennaSelectionSupported for TDD |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2175` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_v1180` | spec 36.331 tdd-Add-UE-EUTRA-Capabilities-v1180 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2377` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_v1180.mbms_non_serving_cell_r11` | spec 36.331 mbms-NonServingCell-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2379` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `tdd_add_ue_eutra_cap_v1180.mbms_scell_r11` | spec 36.331 mbms-SCell-r11 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2378` |
| ERRC | `NVRAM_EF_UE_EUTRA_CAP_CSFB_LID` | `ul_256qam_r14` | spec 36.331 ul-256QAM-r14 ul-256QAM-r14 |  | `mcu/interface/service/nvram/errc_nvram_editor.h:2528` |
| L1 | `` | `TXD_ENABLE` | settings for switching on the tx power detector by band |  | `mcu/interface/service/nvram/l1_nvram_editor.h:2328` |
| L1 | `` | `is_enable` | settings for enabling the ANT RXPWR OFFSET |  | `mcu/interface/service/nvram/l1_nvram_editor.h:1367` |
| L1 | `` | `rx_power_offset_setting` | settings for RX POWER offset |  | `mcu/interface/service/nvram/l1_nvram_editor.h:1171` |
| L1 | `` | `rx_power_offset_setting.RPO_enable` | settings for RX POWER offset |  | `mcu/interface/service/nvram/l1_nvram_editor.h:1174` |
| L1 | `` | `rx_power_offset_setting.RPO_meta_enable` | settings for RX POWER offset |  | `mcu/interface/service/nvram/l1_nvram_editor.h:1177` |
| L4 | `NVRAM_EF_CSM_ESSP_LID` | `cfu_flag` | essp mode |  | `mcu/interface/service/nvram/l4_nvram_editor.h:1942` |
| L4 | `NVRAM_EF_MM_DATA_LID` | `fdd_umts_supported_speech` | fdd_umts_supported_speech | fdd_umts_supported_code:8 fdd_umts_supported_code / 0x60=FDD support CODEC | `mcu/interface/service/nvram/l4_nvram_editor.h:2026` |
| L4 | `NVRAM_EF_MM_DATA_LID` | `fdd_umts_supported_speech_byte2` | fdd_umts_supported_speech_byte2 | AMR_WB:8 3G AMR WB / 0x00=Not supported; 0x04=supported | `mcu/interface/service/nvram/l4_nvram_editor.h:2033` |
| L4 | `NVRAM_EF_MM_DATA_LID` | `mm_non_drx_timer_value` | mm_non_drx_timer_value | mm_non_drx_timer_value:8 mm_non_drx_timer_value | `mcu/interface/service/nvram/l4_nvram_editor.h:2186` |
| L4 | `NVRAM_EF_MM_DATA_LID` | `speech_version` | Supported speech version | FR:1 FR; HR:1 HR; EFR:1 EFR; AMR_FR:1 AMR FR; AMR_HR:1 AMR HR / 0x0=Not supported; 0x1=Supported; 0x0=Not supported; 0x1=Supported; 0x0=Not supported; 0x1=Supported; 0x0=Not supported; 0x1=Supported; 0x0=Not supported; 0x1=Supported | `mcu/interface/service/nvram/l4_nvram_editor.h:1986` |
| L4 | `NVRAM_EF_MM_DATA_LID` | `speech_version_byte2` | speech_version_byte2 | AMR_WB:8 2G AMR WB / 0x0=Not supported; 0x2=supported | `mcu/interface/service/nvram/l4_nvram_editor.h:2018` |
| NAS | `NVRAM_EF_MM_DISABLE_SRVCC_IE_PLMN_LID` | `disable_srvcc_table.rat` | Current RAT |  | `mcu/interface/service/nvram/nas_nvram_editor.h:714` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.mm_cause` | Reject cause from peer message |  | `mcu/interface/service/nvram/nas_nvram_editor.h:689` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.mm_msg` | MM or GMM reject message |  | `mcu/interface/service/nvram/nas_nvram_editor.h:687` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.new_cause_on_hplmn` | mapped cause if camp on plmn is HPLMN |  | `mcu/interface/service/nvram/nas_nvram_editor.h:701` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.new_cause_on_vplmn` | mapped cause if camp on plmn is VPLMN |  | `mcu/interface/service/nvram/nas_nvram_editor.h:703` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.reserve1` | Reserved for future use |  | `mcu/interface/service/nvram/nas_nvram_editor.h:695` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.reserve2` | Reserved for future use |  | `mcu/interface/service/nvram/nas_nvram_editor.h:697` |
| NAS | `NVRAM_EF_MM_GMM_REJECT_CAUSE_MAPPING_LID` | `mapping_table.reserve3` | Reserved for future use |  | `mcu/interface/service/nvram/nas_nvram_editor.h:699` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.gmss_test_mode` | GMSS supported feature for test | gmss_test_mode:8 / 0x1=Enforce add 3GPP_ANY in MSPL list in Home country; 0x2=Enforce add 3GPP_ANY in MSPL list in Non-home country; 0x4=Enable extended MSPL search; 0x8=Skip LTE search in C2K only area | `mcu/interface/service/nvram/nas_nvram_editor.h:545` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.long_mpsr_duration` | MPSR timer max duration when LTE is not available |  | `mcu/interface/service/nvram/nas_nvram_editor.h:569` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.lte_unavail_db_num` | Number of stored LTE unavailable location |  | `mcu/interface/service/nvram/nas_nvram_editor.h:572` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.lte_unavail_max_count` | Upper limit of LTE unavailable times in one location |  | `mcu/interface/service/nvram/nas_nvram_editor.h:570` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.lte_unavail_rate_threshold` | Minimum threshold of LTE available percentage |  | `mcu/interface/service/nvram/nas_nvram_editor.h:571` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.mpsr_duration` | GMSS MPSR timer length |  | `mcu/interface/service/nvram/nas_nvram_editor.h:544` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.mpsr_max_duration` | tele-MPSR timer max duration |  | `mcu/interface/service/nvram/nas_nvram_editor.h:568` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.scan_duration` | GMSS scan timer length |  | `mcu/interface/service/nvram/nas_nvram_editor.h:542` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.sleep_duration` | GMSS sleep timer length |  | `mcu/interface/service/nvram/nas_nvram_editor.h:543` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.tele_mpsr_max_stage` | tele-MPSR max stage |  | `mcu/interface/service/nvram/nas_nvram_editor.h:566` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.tele_mpsr_multiplier` | tele-MPSR multiplier |  | `mcu/interface/service/nvram/nas_nvram_editor.h:565` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.tele_mpsr_nv_arr` | tele-MPSR array |  | `mcu/interface/service/nvram/nas_nvram_editor.h:567` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.tele_mpsr_repeat_counter` | tele-MPSR repeat counter |  | `mcu/interface/service/nvram/nas_nvram_editor.h:564` |
| NAS | `NVRAM_EF_NWSEL_DATA_LID` | `gmss_data.vzw_lab_test_plmn` | VZW lab test PLMN |  | `mcu/interface/service/nvram/nas_nvram_editor.h:555` |
| RR | `NVRAM_EF_GAS_CSG_FINGERPRINT_LID` | `apc_feature_type` | APC feature type settings | F4b:4 first 4 bits; L4b:4 last 4 bits no use / 0x0=disable; 0x1=enable; 0x3=enable si3 report | `mcu/interface/service/nvram/rr_nvram_editor.h:306` |
| RR | `NVRAM_EF_GAS_CSG_FINGERPRINT_LID` | `auto_report_period` | 0~3600s |  | `mcu/interface/service/nvram/rr_nvram_editor.h:329` |
| RR | `NVRAM_EF_GAS_CSG_FINGERPRINT_LID` | `fake_cell_auto_report` | APC feature fake cell auto report | b1:1 bit1 / 0x0=disable auto report; 0x1=enable auto report | `mcu/interface/service/nvram/rr_nvram_editor.h:320` |
| SBP | `NVRAM_EF_SBP_MODEM_CONFIG_LID` | `sbp_mode` | SBP ID(Phase out, use NVRAM_EF_SBP_IDS_LID instead) |  | `mcu/interface/service/nvram/sbp_nvram_editor.h:162` |
| SBP | `NVRAM_EF_SBP_MODEM_DATA_CONFIG_LID` | `sbp_mode` | SBP ID(Phase out, use NVRAM_EF_SBP_IDS_LID instead) |  | `mcu/interface/service/nvram/sbp_nvram_editor.h:192` |
| SIM | `NVRAM_EF_SIM_PROFILE_LID` | `nvram_sim_profile` | SIM/USIM Terminal profile |  | `mcu/interface/service/nvram/sim_nvram_editor.h:219` |
| TD | `NVRAM_EF_AST_TL1_DAT_PARAM_LID` | `TL1D_DAT_CONFIG` | , DAT configration |  | `mcu/interface/service/nvram/td_nvram_editor.h:3461` |
| TD | `NVRAM_EF_AST_TL1_RFFE_PARAM_LID` | `eMipiDeviceID` | , MIPI-control device IDs, the ID should be unique for each device(PA, ASM,...), and these ID will also used in following data table(e.g., RX ON data table) to identify that device |  | `mcu/interface/service/nvram/td_nvram_editor.h:1331` |
| TD | `NVRAM_EF_AST_TL1_RFFE_PARAM_LID` | `eMipiInitData` | , initial data for MIPI control |  | `mcu/interface/service/nvram/td_nvram_editor.h:1340` |
| TD | `NVRAM_EF_AST_TL1_RFFE_PARAM_LID` | `uwTxmDeviceFlag` | , indicate the RFFR device is TXM or not for band34(bit0) and band39(bit1). 1 means TXM, i.e., PA and ASM are same device; 0 means PA ASM are independent device, for the case PA itself has ASM function but not used by 3G TDD, set it to 0 |  | `mcu/interface/service/nvram/td_nvram_editor.h:1330` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `TxPower_Offset` | , TX POWER offset |  | `mcu/interface/service/nvram/td_nvram_editor.h:1193` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tAbbApcVoltCfg` | , APC configration |  | `mcu/interface/service/nvram/td_nvram_editor.h:1146` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tBpiEventCfg` | , BPI configration |  | `mcu/interface/service/nvram/td_nvram_editor.h:1127` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tBpiSetting` | , BPI related configration |  | `mcu/interface/service/nvram/td_nvram_editor.h:1082` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tEtmVoltCfg` | , ETM configration |  | `mcu/interface/service/nvram/td_nvram_editor.h:1182` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tOtPortSelCfg` | , config thr RF TX/RX port |  | `mcu/interface/service/nvram/td_nvram_editor.h:1159` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tReserverData` | , some misc iterms |  | `mcu/interface/service/nvram/td_nvram_editor.h:1314` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tTrxIQswapCfg` | , IQ swap configration for TX RX |  | `mcu/interface/service/nvram/td_nvram_editor.h:1166` |
| TD | `NVRAM_EF_AST_TL1_RF_PARAM_LID` | `tVpaVoltCfg` | , VPA configration |  | `mcu/interface/service/nvram/td_nvram_editor.h:1169` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tDisableDownlink` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), to turn off DL link |  | `mcu/interface/service/nvram/td_nvram_editor.h:558` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tDisableUplink` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), to turn off UL link |  | `mcu/interface/service/nvram/td_nvram_editor.h:660` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tDisableUplinkE` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario disable uplink in band39 |  | `mcu/interface/service/nvram/td_nvram_editor.h:1017` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tDisableUplinkF` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario disable uplink in band39 |  | `mcu/interface/service/nvram/td_nvram_editor.h:915` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tDlsGapCtrl` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario of DL->DL |  | `mcu/interface/service/nvram/td_nvram_editor.h:711` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tEnableDownlink` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), to turn on DL link |  | `mcu/interface/service/nvram/td_nvram_editor.h:507` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tEnableUplink` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), to turn on UL link |  | `mcu/interface/service/nvram/td_nvram_editor.h:609` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tEnableUplinkE` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario enable uplink in band40 |  | `mcu/interface/service/nvram/td_nvram_editor.h:966` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tEnableUplinkF` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario enable uplink in band39 |  | `mcu/interface/service/nvram/td_nvram_editor.h:864` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tUlDlGapCtrl` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario of UL->DL |  | `mcu/interface/service/nvram/td_nvram_editor.h:813` |
| TD | `NVRAM_EF_AST_TL1_RF_TIMESEQ_LID` | `tUlsGapCtrl` | , (uwAction(i),swAction(i)TimingAdv,i=1~25) is the event to happen at swAction(i)TimingAdv us echip(Tc/8), for the scenario of UL->DL |  | `mcu/interface/service/nvram/td_nvram_editor.h:762` |
| TD | `NVRAM_EF_AST_TL1_TAS_CUSTOM_PARAMES_LID` | `tdbandsetting` | , TAS related |  | `mcu/interface/service/nvram/td_nvram_editor.h:3506` |
| TD | `NVRAM_EF_AST_TL1_TAS_CUSTOM_PARAMES_LID` | `tdbandsetting` | , TAS related |  | `mcu/interface/service/nvram/td_nvram_editor.h:3575` |
| UMTS | `NVRAM_EF_UMTS_A54_SMC_IGNR_LID` | `whitelist_PLMN.mcc1` | mcc1 |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1555` |
| UMTS | `NVRAM_EF_UMTS_A54_SMC_IGNR_LID` | `whitelist_PLMN.mcc2` | mcc2 |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1557` |
| UMTS | `NVRAM_EF_UMTS_A54_SMC_IGNR_LID` | `whitelist_PLMN.mcc3` | mcc3 |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1559` |
| UMTS | `NVRAM_EF_UMTS_A54_SMC_IGNR_LID` | `whitelist_PLMN.mnc1` | mnc1 |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1561` |
| UMTS | `NVRAM_EF_UMTS_A54_SMC_IGNR_LID` | `whitelist_PLMN.mnc2` | mnc2 |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1563` |
| UMTS | `NVRAM_EF_UMTS_A54_SMC_IGNR_LID` | `whitelist_PLMN.mnc3` | mnc3 |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1565` |
| UMTS | `NVRAM_EF_UMTS_ELEVATOR_MODE_SETTING_LID` | `lte_timer_for_camping_check` | LTE timer for camping check |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1618` |
| UMTS | `NVRAM_EF_UMTS_ELEVATOR_MODE_SETTING_LID` | `pingpong_avoidance_threshold` | ping pong avoidance threshold |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1620` |
| UMTS | `NVRAM_EF_UMTS_ELEVATOR_MODE_SETTING_LID` | `pingpong_avoidance_timer` | ping pong avoidance timer |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1622` |
| UMTS | `NVRAM_EF_UMTS_ELEVATOR_MODE_SETTING_LID` | `plmn_enabled` | enabled_for_plmns |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1624` |
| UMTS | `NVRAM_EF_UMTS_ELEVATOR_MODE_SETTING_LID` | `rssi_diff_between_elevator_modes` | RSSI diff between elevator modes |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1614` |
| UMTS | `NVRAM_EF_UMTS_ELEVATOR_MODE_SETTING_LID` | `ttt_for_elevator_mode` | TTT for elevator mode |  | `mcu/interface/service/nvram/umts_nvram_editor.h:1616` |
| UMTS | `NVRAM_EF_UMTS_USIME_RRC_DYNAMIC_CAP_FDD_LID` | `rrce_feature_cap` | RRCE feature |  | `mcu/interface/service/nvram/umts_nvram_editor.h:650` |

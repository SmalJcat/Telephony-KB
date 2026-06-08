---
doc_type: reference
domain: Configuration
status: active
quality: imported_reference
platform: UNISOC
layer: Modem/Operator NV
source: Modem NV参数映射.md
search_tier: reference_only
---

# UNISOC Default NV字段映射

<!-- REFERENCE_ONLY_BOUNDARY_START -->
## 使用边界

- 本页是字段表、参数表或外部片段，只用于查字段、查来源、做关键词回溯。
- 不作为流程结论、配置生效结论或真实问题第一坏点引用。
- 需要判断问题时，先回到对应主文档、排障流程或 Case。
<!-- REFERENCE_ONLY_BOUNDARY_END -->


## 阅读入口

- 本文从主入口 [Modem NV参数映射](Modem NV参数映射.md) 拆出，只作为字段定位索引。
- UNISOC default NV 字段、模块和默认值索引。
- 最终配置必须回到目标平台源码、默认 NV、生成产物和设备端 running NV 交叉确认。

## UNISOC Default NV字段映射

| 模块 | 子模块/路径 | 属性名 | 默认值 | 说明 |
|---|---|---|---|---|
| OPERATOR_NV_GAS | `gas_avoid_pseudo_base_station\avoid_pseudo_base_station` | `avoid_pseudo_base_station[0]` | 0 | 0:not avoid pseudo base station; 1: avoid pseudo base station; |
| OPERATOR_NV_GAS | `gas_eutra_measure_and_report_supported\eutra_measure_and_report_supported` | `eutra_measure_and_report_supported[0]` | 1 | 0:not support; 1:support; |
| OPERATOR_NV_GAS | `gas_gsm_csfb_fr_supported\gsm_csfb_fr_supported` | `gsm_csfb_fr_supported[0]` | 1 | 0:not support; 1:support; |
| OPERATOR_NV_GAS | `gas_vamos_level\vamos_level` | `vamos_level[0]` | 1 | 0:not support; 1: vamos-1; 2: vamos-2; |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ike_encr` | 0xc | IKE Encryption: 2: ENCR_DES; 3: ENCR_3DES; 7: ENCR_BLOWFISH; 9: ENCR_DES_IV32; 11: ENCR_NULL; 12: ENCR_AES_CBC; 13: ENCR_AES_CTR |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ike_encr_key_len` | 128 | IKE Encryption key size |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ike_intg` | 0x2 | IKE Integrity: 1: AUTH_HMAC_MD5_96; 2: AUTH_HMAC_SHA1_96; 5: AUTH_AES_XCBC_96; 12: AUTH_HMAC_SHA2_256_128; 13: AUTH_HMAC_SHA2_384_192; 14: AUTH_HMAC_SHA2_512_256 |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ike_prf` | 0x2 | IKEv2 Pseudo Random Function: 1: PRF_HMAC_MD5; 2: PRF_HMAC_SHA1; 4: PRF_AES128_XCBC; 5: PRF_HMAC_SHA2_256; 6: PRF_HMAC_SHA2_384; 7: PRF_HMAC_SHA2_512 |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ike_dh` | 0x2 | IKEv2 Diffie-Hellman Group: 1: 768-bit MODP Group; 2: 1024-bit MODP Group; 5: 1536-bit MODP Group; 14: 2048-bit MODP Group; 15: 3072-bit MODP Group; 16: 4096-bit MODP Group; 17: 6144-bit MODP Group; 18: 8192-bit MODP Group |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ipsec_encr` | 0xc | IPSec Encryption: 2: ENCR_DES; 3: ENCR_3DES; 4: ENCR_RC5; 7: ENCR_BLOWFISH; 11: ENCR_NULL; 12: ENCR_AES_CBC; 13: ENCR_AES_CTR |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ipsec_encr_key_len` | 128 | IPSec Encryption key size |
| OPERATOR_NV_IMS | `ike_alg_config\ike_alg_param\ike_alg_param[0]` | `ipsec_integ` | 0x2 | IPSec Integrity: 0: NONE; 1: AUTH_HMAC_MD5_96; 2: AUTH_HMAC_SHA1_96; 5: AUTH_AES_XCBC_96 |
| OPERATOR_NV_IMS | `ike_cap_config\ike_cap_support` | `ike_cap_support[0]` | 0 |  |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_idr_type` | 0x2 | identify idr type, 1:IPV4_ADDR; 2: FQDN; 3: RFC822_ADDR; 5: IPV6_ADDR; 9: DER_ASN1_DN; 10: DER_ASN1_GN; 11: KEY_ID |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_addr_type` | 0x0 | ePDG address type, 0:VPLMN; 1: HPLMN; 2: static FQDN |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_cached` | 0x0 | need epdg_cached when using some dns ip fail, 0: NO; 1: YES |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_addr` | "" |  |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_apn_ims` | "ims" |  |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_apn_ss` | "" |  |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_apn_mms` | "" |  |
| OPERATOR_NV_IMS | `ike_epdg_config\epdg_param\epdg_param[0]` | `epdg_apn_sos` | "" |  |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ipsec_life_time` | 86400 | IPSec Life Time |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ipsec_life_jitter_time` | 1800 | IPSec Life Jitter Time |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ike_life_time` | 86400 | IKE Life Time |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ike_rekey_jitter_time` | 1800 | How long before IKE/ESP SA expiry should attempts to negotiate a rekey begin |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ike_reauth_time` | 86400 | ike reauth  time |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `nat_keep_alive_time` | 60 | Keep Alive Timer for NAT Traversal |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `pdp_period_time` | 60 | Time period in seconds after which the UE shall perform the DPD |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ike_retransmit_type` | 0 | resend timer type: A(2,2,2,2): 0, B(1,2,4,8): 1, C(1,2,3,4): 2 |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ike_retransmit_time` | 2 | resend time, should be set '1' when resend type is B or C |
| OPERATOR_NV_IMS | `ike_time_config\ike_time_param\ike_time_param[0]` | `ike_retransmit_max_num` | 5 | Maximum number of times a UE shall retransmit an IKEv2 packet if it does not receive a response, 3 times (retransmit timer: 1, 2, 4, 8, give up) |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `inner_ip_type_ims` | 0x0 | subnet type: 0: IPv4v6; 1: IPv4; 2: IPv6   bit7: 1:do not follow 3gpp access ip type; 0:follow 3gpp access ip type |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `inner_ip_type_sos` | 0x0 | subnet type: 0: IPv4v6; 1: IPv4; 2: IPv6   bit7: 1:do not follow 3gpp access ip type; 0:follow 3gpp access ip type |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `inner_ip_type_ss` | 0x0 | subnet type: 0: IPv4v6; 1: IPv4; 2: IPv6   bit7: 1:do not follow 3gpp access ip type; 0:follow 3gpp access ip type |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `inner_ip_type_mms` | 0x0 | subnet type: 0: IPv4v6; 1: IPv4; 2: IPv6   bit7: 1:do not follow 3gpp access ip type; 0:follow 3gpp access ip type |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `no_init_notify_ims` | 0x0 | without INITIAL_CONTACT notify: 0: with; 1: without |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `no_init_notify_sos` | 0x0 | without INITIAL_CONTACT notify: 0: with; 1: without |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `no_init_notify_ss` | 0x0 | without INITIAL_CONTACT notify: 0: with; 1: without |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `no_init_notify_mms` | 0x0 | without INITIAL_CONTACT notify: 0: with; 1: without |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_with_proposal2` | 0x0 | with proposal2: 0: without; 1: with |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_imei_attr` | 0x4001 | Configuration Payload Attribute Type for IMEI |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_fast_reauth` | 0x0 | support fast re-authentication: 0: NO; 1: YES |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_mobike` | 0x0 | support MOBIKE: 0: NO; 1: YES |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_esp_fragment` | 0x1 | esp fragment by ip: 0: NO; 1: YES |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_test_mode` | 0x0 | psit test mode: 0: stub on tcp/ip; 1: stub on MN and tcp/ip; 2: no stub |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_dscp` | 0x30 | dscp value of ike |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_inner_retry` | 0x0 | need ike_inner_retry when eap state fail: 0: NO; 1: YES |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_ping_addr` | "" | ping address before attach |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_idi` | "" |  |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_cfg_attr_ims` | "20,21" | Configuration Payload Attribute list for ims: 20,21 |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_cfg_attr_sos` | "20,21" | Configuration Payload Attribute list for sos |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_cfg_attr_ss` | "" | Configuration Payload Attribute list for ss |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_cfg_attr_mms` | "" | Configuration Payload Attribute list for mms |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `dpd_when_mocall` | 0x00 | whether start dpd when make a vowifi call: 0: don't start 1: start |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `ike_fragment` | 0x0 | support IKEv2 message fragment: 0: NO; 1: YES |
| OPERATOR_NV_IMS | `ike_ue_config\ue_param\ue_param[0]` | `vowifi_tun_mtu` | 1400 | ipsec config vowifi_tun_mtu to ap |
| OPERATOR_NV_IMS | `ims_afterring_csfb\csfbAfterRcvRingEnabled` | `csfbAfterRcvRingEnabled[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_allow_degrade_in_hold\allowDegradeInHold` | `allowDegradeInHold[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `audio_codec_type` | 0x6 | Bit 0:evs;  Bit 1:amr-wb; Bit 2:amr-nb \| All audio codecs supported: Bit 0:evs;  Bit 1:amr-wb; Bit 2:amr-nb |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `amr_nb_modeset` | 0xFF | Bit 0:4.75kbps;1:5.15kbps;2:5.90kbps;3:6.70kbps;4:7.40kbps;5:7.95kbps;6:10.20kbps;7:12.20kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `amr_wb_modeset` | 0x1FF | Bit 0:6.60kbps;1:8.85kbps;2:12.65kbps;3:14.25kbps;4:15.85kbps;5:18.25kbps;6:19.85kbps;7:23.05kbps;8:23.85kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_io_modeset` | 0x1FF | Bit 0:6.60kbps;1:8.85kbps;2:12.65kbps;3:14.25kbps;4:15.85kbps;5:18.25kbps;6:19.85kbps;7:23.05kbps;8:23.85kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_prim_min_bw` | 0 | 0:nb; 1:wb; 2:swb; 3:fb |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_prim_max_bw` | 2 | 0:nb; 1:wb; 2:swb; 3:fb \| Max EVS bandwidth: 0:NB;1:WB;2:SWB;3:FB |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_prim_min_br` | 0 | 0:5.9; 1:7.2; 2:8.0; 3:9.6; 4:13.2; 5:16.4; 6:24.4; 7:32; 8:48; 9:64; 10:96; 11:128; |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_prim_max_br` | 6 | 0:5.9; 1:7.2; 2:8.0; 3:9.6; 4:13.2; 5:16.4; 6:24.4; 7:32; 8:48; 9:64; 10:96; 11:128; \| Max EVS bitrate: 0:5.9kbps;1:7.2kbps;2:8.0kbps;3:9.6kbps;4:13.2kbps;5:16.4kbps;6:24.4kbps;7:32kbps;8:48kbps;9:64kbps;10:96kbps;11:128kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_ch_aw_mode` | 0 | 255:Disable; 0:Enable; 2/3/5/7:Enable and use frame offset 2/3/5/7 at begining; |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `amr_nb_def_mode` | 7 | 0:4.75kbps;1:5.15kbps;2:5.90kbps;3:6.70kbps;4:7.40kbps;5:7.95kbps;6:10.20kbps;7:12.20kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `amr_wb_def_mode` | 8 | 0:6.60kbps;1:8.85kbps;2:12.65kbps;3:14.25kbps;4:15.85kbps;5:18.25kbps;6:19.85kbps;7:23.05kbps;8:23.85kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_io_def_mode` | 8 | 0:6.60kbps;1:8.85kbps;2:12.65kbps;3:14.25kbps;4:15.85kbps;5:18.25kbps;6:19.85kbps;7:23.05kbps;8:23.85kbps |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `evs_prim_def_br` | 4 | 0:5.9; 1:7.2; 2:8.0; 3:9.6; 4:13.2; 5:16.4; 6:24.4; 7:32; 8:48; 9:64; 10:96; 11:128; |
| OPERATOR_NV_IMS | `ims_audio_codec\volte_audio_codec\volte_audio_codec[0]` | `amr_mo_oa_mode` | 1 | MO call coders for both amr-nb and amr-wb: 0: be; 1: be>oa; 2: oa; 3: oa>be; |
| OPERATOR_NV_IMS | `ims_audio_enable_before_ringing\audioEnableBeforeRinging` | `audioEnableBeforeRinging[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `evs_payloadtype` | 96 | the dynamic payloadtype of EVS codec |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `amr_wb_be_payloadtype` | 98 | the dynamic payloadtype of AMR-WB with BE mode |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `amr_wb_oa_payloadtype` | 100 | the dynamic payloadtype of AMR-WB with OA mode |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `amr_be_payloadtype` | 110 | the dynamic payloadtype of AMR with BE mode |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `amr_oa_payloadtype` | 112 | the dynamic payloadtype of AMR with OA mode |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `evs_config_payloadtype` | 114 | the dynamic payloadtype of EVS with config |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `tele_16k_payloadtype` | 101 | the dynamic payloadtype of Telephone-Event-16K |
| OPERATOR_NV_IMS | `ims_audio_pt\volte_audio_pt\volte_audio_pt[0]` | `tele_8k_payloadtype` | 103 | the dynamic payloadtype of Telephone-Event-8K |
| OPERATOR_NV_IMS | `ims_audio_rtcp_enable\audio_RTCPEnabled` | `audio_RTCPEnabled[0]` | 0x1 |  |
| OPERATOR_NV_IMS | `ims_audio_timeout\audio_timeout\audio_timeout[0]` | `audioRtpTimeout` | 30 | Seconds. Call will be disconnected if not receive audio RTP before expire |
| OPERATOR_NV_IMS | `ims_audio_timeout\audio_timeout\audio_timeout[0]` | `audioRtcpTimeout` | 0 | Seconds. Call will be disconnected if not receive audio RTCP before expire |
| OPERATOR_NV_IMS | `ims_bline_in_sesslevel_enable\bline_in_sesslevel_enable` | `bline_in_sesslevel_enable[0]` | 0x1 | 0: don't add b line in session description; 1: add b line in session description |
| OPERATOR_NV_IMS | `ims_bsf_param\bsf_param\bsf_param[0]` | `ss_BsfUri` | "" | BSF URI |
| OPERATOR_NV_IMS | `ims_bsf_param\bsf_param\bsf_param[0]` | `ss_BsfPort` | 80 | the BSF service PORT |
| OPERATOR_NV_IMS | `ims_bsf_param\bsf_param\bsf_param[0]` | `ss_BsfHttpsEnable` | 0 | bsf ssl enable |
| OPERATOR_NV_IMS | `ims_callforbid_direct_rereg\sip_directRestartReg` | `sip_directRestartReg[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_call_no_answer_timer\NoAnswerTimer` | `NoAnswerTimer[0]` | 128 |  |
| OPERATOR_NV_IMS | `ims_call_retry_config\retry_config` | `retry_config[0]` | "503:6:0,580:6:4" |  |
| OPERATOR_NV_IMS | `ims_carry_accesstype\sip_isCarryAccesstype` | `sip_isCarryAccesstype[0]` | 0 | Carry +g.3gpp.accesstype in REGISTER or not. 0: Not carry,1: Carry, default:0 |
| OPERATOR_NV_IMS | `ims_cat_support\sip_catSupport` | `sip_catSupport[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_check_call_video\sip_callvideocheck` | `sip_callvideocheck[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_check_isim_imsi\CheckIsimImsi` | `CheckIsimImsi[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_codec_with_inactive_media\codec_with_inactive_media` | `codec_with_inactive_media[0]` | 1 | 0: only carry m= media 0; 1: still with one coder for this media |
| OPERATOR_NV_IMS | `ims_confprecondition_enable\ConfPreconditionEnabled` | `ConfPreconditionEnabled[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_confRefer_inDialog\confRefer_inDialog` | `confRefer_inDialog[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_confsub_indialog\confSubscribe_inDialog` | `confSubscribe_inDialog[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_conf_add_call_gcf\conf_add_call_gcf` | `conf_add_call_gcf[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_conf_allowMergeConfForParticipant\ims_conf_allowMergeConfForParticipant` | `ims_conf_allowMergeConfForParticipant[0]` | 0 | If participant allow other call to be merged into existed conference, 0:not allow; 1:allow |
| OPERATOR_NV_IMS | `ims_conf_uri\conf_uri` | `conf_uri[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_contact_media_param\contact_media\contact_media[0]` | `contact_aduio` | 1 | 0:contact header without audio param;1:contact header with audio param |
| OPERATOR_NV_IMS | `ims_contact_media_param\contact_media\contact_media[0]` | `contact_video` | 1 | 0:contact header without video param;1:contact header with video param |
| OPERATOR_NV_IMS | `ims_crs_capability\ims_crsCapabilities\ims_crsCapabilities[0]` | `crs_support` | 1 |  |
| OPERATOR_NV_IMS | `ims_crs_capability\ims_crsCapabilities\ims_crsCapabilities[0]` | `pdelay` | 1 | Pdelay timer length in seconds |
| OPERATOR_NV_IMS | `ims_crs_capability\ims_crsCapabilities\ims_crsCapabilities[0]` | `pqos` | 2 | Pqos timer length in seconds |
| OPERATOR_NV_IMS | `ims_csfb_after_neg_fail\csfb_after_neg_fail` | `csfb_after_neg_fail[0]` | 0 | 0: MO don't csfb after audio media neg fail; 1: MO csfb after audio media neg fail |
| OPERATOR_NV_IMS | `ims_csfb_error_code\csfb_errorCode` | `csfb_errorCode[0]` | "400,403,484,500,503,580" |  |
| OPERATOR_NV_IMS | `ims_cut_different_node_enable\ims_cut_different_node_enable` | `ims_cut_different_node_enable[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_degrade_with_error_code\degradeWithErrorCode` | `degradeWithErrorCode[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_direct_alert\sip_directAlert` | `sip_directAlert[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_dscp\DSCP\DSCP[0]` | `ims_DSCP_SIP` | 26 |  |
| OPERATOR_NV_IMS | `ims_dscp\DSCP\DSCP[0]` | `ims_DSCP_Audio` | 46 |  |
| OPERATOR_NV_IMS | `ims_dscp\DSCP\DSCP[0]` | `ims_DSCP_Video` | 40 |  |
| OPERATOR_NV_IMS | `ims_dynamic_codecrate_audio\dynamic_codecrate_audio` | `dynamic_codecrate_audio[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_dynamic_resolution_video\dynamic_resolution_video` | `dynamic_resolution_video[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ect_transfer_mode\ectTransferMode` | `ectTransferMode[0]` | 3 |  |
| OPERATOR_NV_IMS | `ims_emg_call_timer\emg_call_timer\emg_call_timer[0]` | `sip_emergInviteTime` | 10 | emergency INVITE wait for 18x response timer, the timer value is measured in second |
| OPERATOR_NV_IMS | `ims_emg_call_timer\emg_call_timer\emg_call_timer[0]` | `sip_emergCallTime` | 0 | emergency INVITE wait for 200 OK response timer, the timer value is measured in second |
| OPERATOR_NV_IMS | `ims_emg_treg_timer\sip_timerTemergreg` | `sip_timerTemergreg[0]` | 12000 | the timer value is measured in ms |
| OPERATOR_NV_IMS | `ims_emg_urn_generic\sip_emerg_urn_generic` | `sip_emerg_urn_generic[0]` | 0 | when the emergency urn corresponds to multipe types, use the generic type |
| OPERATOR_NV_IMS | `ims_encrypt_prefix_numbers\EncryptPrefixNum` | `EncryptPrefixNum[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `SMSoIP_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `SMSoIP_roaming_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `MMTEL_voice_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `MMTEL_voice_roaming_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `MMTEL_video_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `MMTEL_video_roaming_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `USSI_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `USSI_roaming_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `SS_XCAP_config_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_exempt_param\exempt_param\exempt_param[0]` | `SS_XCAP_config_roaming_exempt` | 0xFF |  |
| OPERATOR_NV_IMS | `ims_from_preferred\ims_fromPreferred` | `ims_fromPreferred[0]` | 0 | From header field is used for determination of the originating party identity in OIP service. 0: Not used, 1: Used, default:0 |
| OPERATOR_NV_IMS | `ims_giba\GIBA` | `GIBA[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_hdr_comp\compactSipHdr` | `compactSipHdr[0]` | 0 | Use compact sip header |
| OPERATOR_NV_IMS | `ims_heldtone_enable\heldToneEnable` | `heldToneEnable[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_imsi_enable\sip_imsiEnabled` | `sip_imsiEnabled[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_init_media_dir\initMediaDir` | `initMediaDir[0]` | 0 | Init Media direction in INVITE. 0: a=sendrecv,1: inactive, default:0 |
| OPERATOR_NV_IMS | `ims_invite_nosdp_video_enable\inviteNoSDP_videoEnable` | `inviteNoSDP_videoEnable[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_ipsec_alg_param\sip_ipsecAlgParam\sip_ipsecAlgParam[0]` | `sip_ipsecIntegrAlgo` | 0x3 | BIT0:hmac-sha-1-96; BIT1:hmac-md5-96; |
| OPERATOR_NV_IMS | `ims_ipsec_alg_param\sip_ipsecAlgParam\sip_ipsecAlgParam[0]` | `sip_ipsecCipherAlgo` | 0x7 | BIT0:null;  BIT1:aes-cbc;  BIT2:des-ede3-sbc |
| OPERATOR_NV_IMS | `ims_ipsec_enable\sip_ipsecEnabled` | `sip_ipsecEnabled[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_keep_alive\keepAlive\keepAlive[0]` | `keepAliveMode` | 0 | 0:disactive,1:only tcp keep alive, 2:only udp keep alive, 3: both tcp and udp keep alive |
| OPERATOR_NV_IMS | `ims_keep_alive\keepAlive\keepAlive[0]` | `keepAliveUdpTimer` | 29 | Upper limit period of Udp to send keep-alive message. Unit:s |
| OPERATOR_NV_IMS | `ims_keep_alive\keepAlive\keepAlive[0]` | `keepAliveTcpTimer` | 120 | Upper limit period of Tcp to send keep-alive message. Unit:s |
| OPERATOR_NV_IMS | `ims_kickconf_refer_rsp\kickConfbyRefer2xx` | `kickConfbyRefer2xx[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `regwithLocation` | 0 | 3gpp reg with location |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `withLocation` | 0 | 3gpp normal call with location |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `sosWithLocation` | 1 | emerg call with location |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `wifi_regwithLocation` | 0 | reg with location \| wifi reg with location |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `wifi_withLocation` | 0 | normal call with location \| wifi normal call with location |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `locationType` | 1 | bit0:point with latitude,longitude; bit1:point with latitude,longitude,altitude; bit2:civic; bit3:circle; bit4:ellipse |
| OPERATOR_NV_IMS | `ims_location_param\location_param\location_param[0]` | `revers` | 0 | revers |
| OPERATOR_NV_IMS | `ims_maintain_in_cs\maintainIMSInCS` | `maintainIMSInCS[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_msg_with_imei\sip_MsgWithIMEI` | `sip_MsgWithIMEI[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_mwi_event\sip_mwiSubEvent\sip_mwiSubEvent[0]` | `sip_mwiExpireSec` | 0 | MWI Subscribe expire time send to server in Subscribe request header |
| OPERATOR_NV_IMS | `ims_mwi_event\sip_mwiSubEvent\sip_mwiSubEvent[0]` | `sip_mwiEventEnabled` | 0 | SSend subscribe for MWI |
| OPERATOR_NV_IMS | `ims_neg_answer_with_init_param\neg_answer_with_init_param` | `neg_answer_with_init_param[0]` | 0 | 0: neg answer with former offer; 1: neg answer with init param |
| OPERATOR_NV_IMS | `ims_nopem_perftone\perferToneForNoPEM` | `perferToneForNoPEM[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_noreport_after_ring_nopem\noReportAfterRingNoPEM` | `noReportAfterRingNoPEM[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_notallow_refering\notAllowedRefering` | `notAllowedRefering[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_over_3gpp\ims_over_3gpp_enable` | `ims_over_3gpp_enable[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_over_wifi\ims_over_wifi_enable` | `ims_over_wifi_enable[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_pcscf_port\sip_pcscf_port` | `sip_pcscf_port[0]` | 5060 |  |
| OPERATOR_NV_IMS | `ims_pem_activate_timeout\activateTimeoutForPEM` | `activateTimeoutForPEM[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_playlocaltone_norbt\playLocalToneAfterNoRBT` | `playLocalToneAfterNoRBT[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_precondition_enable\sip_preconditionEnabled` | `sip_preconditionEnabled[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_precondition_enable_onactive\sip_PreconditionEnabledOnActive` | `sip_PreconditionEnabledOnActive[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_qos_local_strength_tag\qos_local_strength_tag` | `qos_local_strength_tag[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_quantum_encrypt_prefix_numbers\Quantum_EncryptPrefixNum` | `Quantum_EncryptPrefixNum[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_reg_authalgo\sip_authorizationAlgo` | `sip_authorizationAlgo[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_reg_domain\domain` | `domain[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_reg_expire\sip_regExpireSec` | `sip_regExpireSec[0]` | 600000 | Register expire time send to server in register request header |
| OPERATOR_NV_IMS | `ims_reg_resp_protype\reg_resp_protype` | `reg_resp_protype[0]` | "403:5" |  |
| OPERATOR_NV_IMS | `ims_reg_retry_after_zero\sip_regRetryAfterZero` | `sip_regRetryAfterZero[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_reg_retry_count\sip_regRetryCount` | `sip_regRetryCount[0]` | 2 |  |
| OPERATOR_NV_IMS | `ims_reg_retry_timer\sip_regRetryTimer\sip_regRetryTimer[0]` | `sip_regRetryBaseTime` | 30 | Re-register base time interval if register failed, in seconds |
| OPERATOR_NV_IMS | `ims_reg_retry_timer\sip_regRetryTimer\sip_regRetryTimer[0]` | `sip_regRetryMaxTime` | 1800 | Re-register max time interval if register failed, in seconds |
| OPERATOR_NV_IMS | `ims_reg_sub_event\sip_regEventEnabled` | `sip_regEventEnabled[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_reg_sub_expire\sip_subExpireSec` | `sip_subExpireSec[0]` | 600000 |  |
| OPERATOR_NV_IMS | `ims_reject_upgradecode\rejectUpgradeCode` | `rejectUpgradeCode[0]` | 200 |  |
| OPERATOR_NV_IMS | `ims_reject_upgrad_for_resume\rejectUpgradeForResume` | `rejectUpgradeForResume[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_reliable_alert\sip_reliableAlert` | `sip_reliableAlert[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_report_disable\ims_report_disable` | `ims_report_disable[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_reset_rate_by_as\resetRateByAS` | `resetRateByAS[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_resource_always_ready\resourceAlwaysReady` | `resourceAlwaysReady[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ring_timer\ring_timer\ring_timer[0]` | `RingingTimer` | 75 | MT call no answer timer after send 180 (Sec) |
| OPERATOR_NV_IMS | `ims_ring_timer\ring_timer\ring_timer[0]` | `RingbackTimer` | 80 | MO call no answer timer after receive 180 (Sec) |
| OPERATOR_NV_IMS | `ims_ring_timerout_errorcode\ringTimerOutErrorCode` | `ringTimerOutErrorCode[0]` | 486 |  |
| OPERATOR_NV_IMS | `ims_rsrvcc_capability\sip_rsrvccCapabilities\sip_rsrvccCapabilities[0]` | `rsrvcc_support` | 0 |  |
| OPERATOR_NV_IMS | `ims_rsrvcc_capability\sip_rsrvccCapabilities\sip_rsrvccCapabilities[0]` | `rsrvcc_altering` | 0 |  |
| OPERATOR_NV_IMS | `ims_rsrvcc_capability\sip_rsrvccCapabilities\sip_rsrvccCapabilities[0]` | `rsrvcc_mid_call` | 0 |  |
| OPERATOR_NV_IMS | `ims_rsrvcc_capability\sip_rsrvccCapabilities\sip_rsrvccCapabilities[0]` | `reserve1` | 0 | reserve for future \| for 4 bytes alighment |
| OPERATOR_NV_IMS | `ims_rs_rr_param\rtcp_rs_rr\rtcp_rs_rr[0]` | `audio_rs` | 600 |  |
| OPERATOR_NV_IMS | `ims_rs_rr_param\rtcp_rs_rr\rtcp_rs_rr[0]` | `audio_rr` | 2000 |  |
| OPERATOR_NV_IMS | `ims_rs_rr_param\rtcp_rs_rr\rtcp_rs_rr[0]` | `video_rs` | 8000 |  |
| OPERATOR_NV_IMS | `ims_rs_rr_param\rtcp_rs_rr\rtcp_rs_rr[0]` | `video_rr` | 6000 |  |
| OPERATOR_NV_IMS | `ims_rtcp_interval\audioRtcpInterval` | `audioRtcpInterval[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_rtt_conf_merge_type\rtt_conf_merge_type\rtt_conf_merge_type[0]` | `TAConf_MergeType` | 0 | 1. merge to Text conference; 0. merge to Audio conference |
| OPERATOR_NV_IMS | `ims_rtt_conf_merge_type\rtt_conf_merge_type\rtt_conf_merge_type[0]` | `TVConf_MergeType` | 0 | 2. merge to Text conference; 1. merge to Video conference; 0. merge to Audio conference |
| OPERATOR_NV_IMS | `ims_session_timer_param\call_refresh\call_refresh[0]` | `sip_MinSE` | 90 | Value in Min-SE (Min session expires), in seconds |
| OPERATOR_NV_IMS | `ims_session_timer_param\call_refresh\call_refresh[0]` | `sip_sessionTimer` | 0 | Value in Session-Expire, in seconds |
| OPERATOR_NV_IMS | `ims_session_timer_param\call_refresh\call_refresh[0]` | `sip_mtSessionTimer` | 0 |  |
| OPERATOR_NV_IMS | `ims_session_timer_param\call_refresh\call_refresh[0]` | `sip_sessionTimerRefresher` | 0 | 0:NONE; 1:UAC; 2:UAS |
| OPERATOR_NV_IMS | `ims_session_timer_param\call_refresh\call_refresh[0]` | `sip_mtSessionTimerRefresher` | 0 | 0:NONE; 1:UAC; 2:UAS |
| OPERATOR_NV_IMS | `ims_session_timer_param\call_refresh\call_refresh[0]` | `sip_SessionRefreshMethod` | 0 | 0: refresh session with update, 1:refresh session with invite,default:0 |
| OPERATOR_NV_IMS | `ims_sig_comp\sip_sigComp\sip_sigComp[0]` | `sip_sigCompEnabled` | 0 | Sigcomp |
| OPERATOR_NV_IMS | `ims_sig_comp\sip_sigComp\sip_sigComp[0]` | `sip_sigCompType` | 0 | 0:default; 1:Dynamic Lzss; 2:Lzss |
| OPERATOR_NV_IMS | `ims_sip_emergToNum\sip_emergToNum` | `sip_emergToNum[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_sip_ipmtu\sip_ipmtu` | `sip_ipmtu[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_sip_mtu\sip_mtu` | `sip_mtu[0]` | 1300 |  |
| OPERATOR_NV_IMS | `ims_sip_param\sip_param\sip_param[0]` | `localTimeZone` | 0 | Bitmask: Bit 0:CNI take LTZ on vowifi, Bit 1:PLCI take LTZ on vowifi, Bit 2:PCNI take LTZ on vowifi, Bit 3:PLANI take LTZ on vowifi, Bit 4:PANI take LTZ on vowifi, Bit 5:PANI take LTZ on volte. default:0 |
| OPERATOR_NV_IMS | `ims_sip_param\sip_param\sip_param[0]` | `rejectCallBy603` | 0 | Bitmask: bit0: user reject by 603 if audio call, bit1: user reject by 603 if video call, bit2: user reject by 603 if second call is audio call, bit3: user reject by 603 if second call is video call, default:0 user reject all call by 486 |
| OPERATOR_NV_IMS | `ims_sip_trans_timer\sip_trans_timer\sip_trans_timer[0]` | `sip_timerT1` | 2000 | UDP SIP message retransmitting interval base time in ms |
| OPERATOR_NV_IMS | `ims_sip_trans_timer\sip_trans_timer\sip_trans_timer[0]` | `sip_timerT2` | 16000 | MAX UDP SIP message retransmitting interval (non INVITE) in ms |
| OPERATOR_NV_IMS | `ims_sip_trans_timer\sip_trans_timer\sip_trans_timer[0]` | `sip_timerT4` | 17000 | Absorb retrans message time, in ms |
| OPERATOR_NV_IMS | `ims_sms_tr1m_timer\ims_sms_tr1m_timer` | `ims_sms_tr1m_timer[0]` | 0x8028 |  |
| OPERATOR_NV_IMS | `ims_srvcc_capability\sip_srvccCapabilities\sip_srvccCapabilities[0]` | `alerting` | 1 | Support alerting SRVCC (aSRVCC) |
| OPERATOR_NV_IMS | `ims_srvcc_capability\sip_srvccCapabilities\sip_srvccCapabilities[0]` | `midCall` | 1 | Support mid-call SRVCC |
| OPERATOR_NV_IMS | `ims_srvcc_capability\sip_srvccCapabilities\sip_srvccCapabilities[0]` | `pre_alerting` | 1 | Support pre-alerting SRVCC (bSRVCC) |
| OPERATOR_NV_IMS | `ims_srvcc_capability\sip_srvccCapabilities\sip_srvccCapabilities[0]` | `emc_midcall` | 0 | R15 emc call srvcc |
| OPERATOR_NV_IMS | `ims_srvcc_capability\sip_srvccCapabilities\sip_srvccCapabilities[0]` | `bsrvcc_mt` | 0 | Support term pre-alerting SRVCC (bSRVCCMT) |
| OPERATOR_NV_IMS | `ims_srvcc_success_timer\srvcc_success_timer` | `srvcc_success_timer[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ssac_enable\SSAC_Enable` | `SSAC_Enable[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ss_CfTargetNumPrefix\ss_CfTargetNumPrefix` | `ss_CfTargetNumPrefix[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_ss_DeactiveCondition\ims_ss_DeactiveCondition` | `ims_ss_DeactiveCondition[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_CwEnable` | 1 | Support Local CW or NW CW: 0: NW cw,1: local CW, default:1 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_SrvEnable` | 0 | Support DNS srv Enable,1:SRV enable,0: SRV disable,default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_IpPriority` | 1 | Support Ipv4 or Ipv6 priority,0:IPV4 high priority,1: IPV6 high priority,default:1 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_HttpsEnable` | 0 | Support HTTPS Enable,0:http,1: https,default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_ActCFNLEnable` | 0 | Support Activate CFNL when activated CFNRC according  IR92,0:not support ,1: support,default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_MediaEnable` | 0 | Support HTTP-PUT xml condition take media tag,0:according nw ability,1: take audio or video by AT;2 no taken when nw query result has  media.default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_OirProvision` | 4 | supsrv provision status reason,0: OIR not provisioned,1: OIR provisioned in permanent mode,2: unknown,3: OIR temporary mode presentation restricted,4: OIR temporary mode presentation allowed,default:4 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_OirLocalconfig` | 0 | Support Local OIR or NW OIR: 0: NW OIR,1: local OIR, default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_CbLocalconfig` | 0 | Support Local CB or NW CB: 0: NW CB,1: local CB, default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_CrtNewRidEnable` | 1 | Support Creat new rule id: 0: can not creat new rule id,1: can creat new rule id, default:1 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_XcapReqKeepAlive` | 0 | xcap request mode: 0: Connection close,1: keep-alive, default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_XcapSmallIpEnable` | 0 | xcap smallest ip policy enable: 0: disable,1: enable, default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_XcapUri` | "" | XCAP URI |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_http_request_timeout` | 9 | wait http response until timeout, default:9 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_LocalPortStart` | 0 | the Local PORT Start. 0: TCP config local port. other digit: IMS set local port to TCP, default:0 |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_XcapPort` | 80 | the XCAP service PORT |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_XcapAuid` | "" | SS vendor auid |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_cwAudioEnable` | 1 | Callwaiting audio:0:Disable,1,Enable |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_cwVideoEnable` | 1 | Callwaiting video:0:Disable,1,Enable |
| OPERATOR_NV_IMS | `ims_ss_param\ss_param\ss_param[0]` | `ss_HttpConditionEnable` | 1 | Http condition request enable:0:Disable,1,Enable |
| OPERATOR_NV_IMS | `ims_ss_ParseActiveEnable\ims_ss_ParseActiveEnable` | `ims_ss_ParseActiveEnable[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_ss_psforbidden_rspcode\ims_ss_psforbidden_rspcode` | `ims_ss_psforbidden_rspcode[0]` | "403" |  |
| OPERATOR_NV_IMS | `ims_ss_QryAllCbEnable\ims_ss_QryAllCbEnable` | `ims_ss_QryAllCbEnable[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_ss_QryCdivEnable\ims_ss_QryCdivEnable` | `ims_ss_QryCdivEnable[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ss_QryOirBaseRootReslt\ims_ss_QryOirBaseRootReslt` | `ims_ss_QryOirBaseRootReslt[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ss_QryRestReportDisable\ims_ss_QryRestReportDisable` | `ims_ss_QryRestReportDisable[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_ss_ReqCarryPrefix\ims_ss_ReqCarryPrefix` | `ims_ss_ReqCarryPrefix[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_support_cnap\isSupportCnap` | `isSupportCnap[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_support_confsub\support_confSubscribe` | `support_confSubscribe[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_support_name_televt\supportNamedTelEvt` | `supportNamedTelEvt[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_support_RTT\RTT_Support` | `RTT_Support[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_support_third_encrypt\SupportThirdEncrypt` | `SupportThirdEncrypt[0]` | 0 | 1: Support Third Party Encrypt |
| OPERATOR_NV_IMS | `ims_take_pcni\isTakePCNI` | `isTakePCNI[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_tcall_timer\sip_timerTcall` | `sip_timerTcall[0]` | 10000 | INVITE no response (100) expire time, in ms |
| OPERATOR_NV_IMS | `ims_tcp_linger\tcp_lingerEnable` | `tcp_lingerEnable[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_tcp_mss\tcp_mss` | `tcp_mss[0]` | 1280 |  |
| OPERATOR_NV_IMS | `ims_tcp_sack\tcp_sack` | `tcp_sack[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_text_qci_id\text_qci_id` | `text_qci_id[0]` | "1689" |  |
| OPERATOR_NV_IMS | `ims_tqostimerlen\tqosTimerLen` | `tqosTimerLen[0]` | 6000 | the length of tqos timer, in ms |
| OPERATOR_NV_IMS | `ims_treg_timer\sip_timerTreg` | `sip_timerTreg[0]` | 128000 | Try next PCSCF if Register request no response for the time, in ms |
| OPERATOR_NV_IMS | `ims_ua_name_config\ua_name_config\ua_name_config[0]` | `sip_uaNameMatchString` | "" |  |
| OPERATOR_NV_IMS | `ims_ua_name_config\ua_name_config\ua_name_config[0]` | `sip_uaNameReplaceString` | "" |  |
| OPERATOR_NV_IMS | `ims_ua_name_pre\sip_uaNamePrefix` | `sip_uaNamePrefix[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_ua_name_type\sip_uaNameType` | `sip_uaNameType[0]` | 0 | ua name type |
| OPERATOR_NV_IMS | `ims_ue_port\sip_ue_port` | `sip_ue_port[0]` | 5060 |  |
| OPERATOR_NV_IMS | `ims_ue_tcp_port\sip_ue_tcp_port` | `sip_ue_tcp_port[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_unpromsg_pani\sip_UnproMsgWithPANI` | `sip_UnproMsgWithPANI[0]` | 1 | 0/1: send initial register without/with PANI |
| OPERATOR_NV_IMS | `ims_update_conf_by_match\updateConfbyMatch` | `updateConfbyMatch[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_update_remote_uri\ims_updateremoteuri` | `ims_updateremoteuri[0]` | 1 | update the remote address. 0: Not update, 1: Update, default:1 |
| OPERATOR_NV_IMS | `ims_upgrade_conf_enable\upgradeConfEnabled` | `upgradeConfEnabled[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_upgrade_timer\MoUpgradeTimer` | `MoUpgradeTimer[0]` | 30 |  |
| OPERATOR_NV_IMS | `ims_url_fmt\service_urlFmt` | `service_urlFmt[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_use_isim\UseIsimAccount` | `UseIsimAccount[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_use_pau_domain\sip_usePauDomain` | `sip_usePauDomain[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ussi_csfb_code\USSI_csfbCode` | `USSI_csfbCode[0]` | "403" |  |
| OPERATOR_NV_IMS | `ims_ussi_enable\USSI_Enabled` | `USSI_Enabled[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_ussi_withcall\ims_ussi_withcall` | `ims_ussi_withcall[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_videoconf_mergetype\VideoConf_MergeType` | `VideoConf_MergeType[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H265_AS_720P30` | 2162 | H265:bandwidth of 720P with frame rate as 30. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H264_AS_720P30` | 2162 | H264:bandwidth of 720P with frame rate as 30. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H265_AS_VGA30` | 660 | H265:bandwidth of VGA with frame rate as 30. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H264_AS_VGA30` | 960 | H264:bandwidth of VGA with frame rate as 30. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H265_AS_VGA15` | 640 | H265:bandwidth of VGA with frame rate as 15. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H264_AS_VGA15` | 640 | H264:bandwidth of VGA with frame rate as 15. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H265_AS_QVGA30` | 480 | H265:bandwidth of QVGA with frame rate as 30. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H264_AS_QVGA30` | 480 | H264:bandwidth of QVGA with frame rate as 30. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H265_AS_QVGA15` | 384 | H265:bandwidth of QVGA with frame rate as 15. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_as_param\videoAs\videoAs[0]` | `H264_AS_QVGA15` | 384 | H264:bandwidth of QVGA with frame rate as 15. Unit:kbps |
| OPERATOR_NV_IMS | `ims_video_codec_type\video_codec_type` | `video_codec_type[0]` | 0x1 |  |
| OPERATOR_NV_IMS | `ims_video_max_resolution\video_max_resolution` | `video_max_resolution[0]` | 2 |  |
| OPERATOR_NV_IMS | `ims_video_rtcpfb_enable\video_rtcpFbEnable` | `video_rtcpFbEnable[0]` | 0x1 |  |
| OPERATOR_NV_IMS | `ims_video_support\video_support` | `video_support[0]` | 1 |  |
| OPERATOR_NV_IMS | `ims_wait_reinvite\WaitReInviteTimer` | `WaitReInviteTimer[0]` | 0x0 |  |
| OPERATOR_NV_IMS | `ims_wifiunavailable_time\wifiunavailable_time` | `wifiunavailable_time[0]` | 0 |  |
| OPERATOR_NV_IMS | `ims_with_countrycode\withCountrycode` | `withCountrycode[0]` | "" |  |
| OPERATOR_NV_IMS | `ims_with_nofork_header\withNoForkHeader` | `withNoForkHeader[0]` | 0 | 1: with no-fork Header, default:0 |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]` | `feature_switch` | 0x0 | feature switch,0:OFF; 1:ON \| 0: disable this feature;1:enable this feature. \| feature switch for customer setting of report B1/B2 active thresh \| bit0:cphs feature;bit1-4:is_support_smart_card;bit5:roaming broker feature;bit6:local PB service check;others reserved for future |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]\reserve` | `reserve[0]` | 0x0 | update dcoc reg enable, 1:enable, other: disable \| audProcControl : Bit7-bit0: R_LIMIT;   Bit10-bit8:   lcf Filter type=0(f1f1);  Bit11:   EQ_tuning_enable;Bit15-12:reserved. |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]\reserve` | `reserve[1]` | 0x0 | exlna cs band index1 pri reg0x03FA \| f1_g0 |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]\reserve` | `reserve[2]` | 0x0 | exlna cs band index1 pri reg0x01A0 \| f1_g1 |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]` | `srv_rsrp_th` | 0x7FFF | good serving cell absolute rsrp thres ,e.g:-120 means: -120dbm |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]` | `srv_rsrq_th` | 0x7FFF | good serving cell absolute rsrq thres ,e.g:-20 means: -20db |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]` | `srv_sinr_th` | 0x7FFF | good serving cell absolute sinr thres ,e.g:0x1 means: 1db |
| OPERATOR_NV_LAS | `las_bad_cell_a2_offset\bad_cell_a2_offset\bad_cell_a2_offset[0]` | `bad_a2_rsrp_offset` | 0x0 | a2 offset,e.g:-3 means: nw_a2_thres + (-3) dbm |
| OPERATOR_NV_LAS | `las_band_priority_setting\band_priority_setting\band_priority_setting[0]` | `num_of_band_priority_list` | 0x0 | total number of band in band priority list |
| OPERATOR_NV_LAS | `las_band_priority_setting\band_priority_setting\band_priority_setting[0]` | `is_same_priority` | 0x1 | 1: the bands in list have same priority; 0:FALSE, the band priority is set according the order of the band list, the 1st band has the highest priority and so on. |
| OPERATOR_NV_LAS | `las_band_priority_setting\band_priority_setting\band_priority_setting[0]` | `only_search_these_band` | 0x0 |  |
| OPERATOR_NV_LAS | `las_band_priority_setting\band_priority_setting\band_priority_setting[0]\reserve` | `reserve[0]` | 0x0 | update dcoc reg enable, 1:enable, other: disable \| audProcControl : Bit7-bit0: R_LIMIT;   Bit10-bit8:   lcf Filter type=0(f1f1);  Bit11:   EQ_tuning_enable;Bit15-12:reserved. |
| OPERATOR_NV_LAS | `las_band_priority_setting\band_priority_setting\band_priority_setting[0]\reserve` | `reserve[1]` | 0x0 | exlna cs band index1 pri reg0x03FA \| f1_g0 |
| OPERATOR_NV_LAS | `las_band_priority_setting\band_priority_setting\band_priority_setting[0]\reserve` | `reserve[2]` | 0x0 | exlna cs band index1 pri reg0x01A0 \| f1_g1 |
| OPERATOR_NV_LAS | `las_camped_threshold\camped_threshold\camped_threshold[0]\threshold` | `qrxlvmin_th` | 0x7FFFFFFF |  |
| OPERATOR_NV_LAS | `las_camped_threshold\camped_threshold\camped_threshold[0]\threshold` | `qrxlvmin_val` | 0x7FFFFFFF | qrxlvmin_val should in this range [-140, -44] |
| OPERATOR_NV_LAS | `las_camped_threshold\camped_threshold\camped_threshold[0]\threshold` | `qualmin_th` | 0x7FFFFFFF |  |
| OPERATOR_NV_LAS | `las_camped_threshold\camped_threshold\camped_threshold[0]\threshold` | `qualmin_val` | 0x7FFFFFFF | qualmin_val should in this range [-34, -3] |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\to_be_ignored_band_bitmap` | `to_be_ignored_band_bitmap[0]` | 0x0 | bit0 means b1,bit1 meas b2, indecate b1~b32 |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\to_be_ignored_band_bitmap` | `to_be_ignored_band_bitmap[1]` | 0x0 | bit0 means b33,bit1 meas b34, indecate b33~b64 |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\to_be_ignored_band_bitmap` | `to_be_ignored_band_bitmap[2]` | 0x0 | bit0 means b65,bit1 meas b66, b65 to b96 |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\to_be_ignored_band_bitmap` | `to_be_ignored_band_bitmap[3]` | 0x0 | bit0 means b97,bit1 meas b98, b97 to b128 |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]` | `bandlist_filter_enable` | 0x0 | if allow capability report filter according to to_be_ignored_band_bitmap,0:disable; 1:enable |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\reserve` | `reserve[0]` | 0x0 | update dcoc reg enable, 1:enable, other: disable \| audProcControl : Bit7-bit0: R_LIMIT;   Bit10-bit8:   lcf Filter type=0(f1f1);  Bit11:   EQ_tuning_enable;Bit15-12:reserved. |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\reserve` | `reserve[1]` | 0x0 | exlna cs band index1 pri reg0x03FA \| f1_g0 |
| OPERATOR_NV_LAS | `las_cap_bandlist_filter\cap_bandlist_filter\cap_bandlist_filter[0]\reserve` | `reserve[2]` | 0x0 | exlna cs band index1 pri reg0x01A0 \| f1_g1 |
| OPERATOR_NV_LAS | `las_enhancedduallayerfdd_r9\enhancedduallayerfdd_r9` | `enhancedduallayerfdd_r9[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_LAS | `las_fgi\fgi\fgi[0]` | `FGI_delta` | 0x2F8FF6BC | LTE FGI index 1 ~ 32 |
| OPERATOR_NV_LAS | `las_fgi\fgi\fgi[0]` | `FGIadd_r9_delta` | 0xC0800000 | LTE FGI index 33 ~ 64 |
| OPERATOR_NV_LAS | `las_fgi\fgi\fgi[0]` | `FGI_r10_delta` | 0x00000000 | LTE FGI index 101 ~ 132 |
| OPERATOR_NV_LAS | `las_fgi\fgi\fgi[0]` | `fgi_feature_switch` | 0x0 | feature switch for customer setting of FGI |
| OPERATOR_NV_LAS | `las_forbidden_redirection_while_volte\forbidden_redirection_while_volte\forbidden_redirection_while_volte[0]` | `feature_switch` | 0x0 | feature switch,0:OFF; 1:ON \| 0: disable this feature;1:enable this feature. \| feature switch for customer setting of report B1/B2 active thresh \| bit0:cphs feature;bit1-4:is_support_smart_card;bit5:roaming broker feature;bit6:local PB service check;others reserved for future |
| OPERATOR_NV_LAS | `las_forbidden_redirection_while_volte\forbidden_redirection_while_volte\forbidden_redirection_while_volte[0]` | `valid_period_of_cell_info` | 0 | 0:cell need not saved, 1: cell will save 1sec; 2: cell will save 2sec; ect. |
| OPERATOR_NV_LAS | `las_interrat_ps_ho_togeran\interrat_ps_ho_togeran` | `interrat_ps_ho_togeran[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_LAS | `las_irat_resel_threshold\irat_resel_threshold\irat_resel_threshold[0]` | `lte_rsrp_threshold` | 0x7FFFFFFF |  |
| OPERATOR_NV_LAS | `las_irat_resel_threshold\irat_resel_threshold\irat_resel_threshold[0]` | `lte_rsrq_threshold` | 0x7FFFFFFF |  |
| OPERATOR_NV_LAS | `las_irat_resel_threshold\irat_resel_threshold\irat_resel_threshold[0]` | `wcdma_rscp_threshold` | 0x7FFFFFFF |  |
| OPERATOR_NV_LAS | `las_irat_resel_threshold\irat_resel_threshold\irat_resel_threshold[0]` | `gsm_rssi_threshold` | 0x7FFFFFFF |  |
| OPERATOR_NV_LAS | `las_multiack_csi_reporting_r11\multiack_csi_reporting_r11` | `multiack_csi_reporting_r11[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_LAS | `las_multins_pmax_r10\las_multins_pmax_r10` | `las_multins_pmax_r10[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_LAS | `las_pdcp_sn_extension_r11\pdcp_sn_extension_r11` | `pdcp_sn_extension_r11[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_LAS | `las_pdcp_timer\pdcp_timer\pdcp_timer[0]` | `LTE_PDCP_DiscardTimer` | 0x0 | LTE PDCP DiscardTimer |
| OPERATOR_NV_LAS | `las_rach_report_r9\rach_report_r9` | `rach_report_r9[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_LAS | `las_redirection_geran_r9\redirection_geran_r9` | `redirection_geran_r9[0]` | 1 |  |
| OPERATOR_NV_LAS | `las_report_stub\report_stub\report_stub[0]` | `reportthresh_feature_switch` | 0x0 | feature switch for customer setting of report A1/A2/A3/A4/A5/B1/B2 active thresh |
| OPERATOR_NV_LAS | `las_report_threshold\report_threshold\report_threshold[0]` | `feature_switch` | 0x0 | feature switch,0:OFF; 1:ON \| 0: disable this feature;1:enable this feature. \| feature switch for customer setting of report B1/B2 active thresh \| bit0:cphs feature;bit1-4:is_support_smart_card;bit5:roaming broker feature;bit6:local PB service check;others reserved for future |
| OPERATOR_NV_LAS | `las_rsrq_meas_wide_band\rsrq_meas_wide_band` | `rsrq_meas_wide_band[0]` | 3 |  |
| OPERATOR_NV_LAS | `las_ue_specificrefsigssupported\ue_specificrefsigssupported` | `ue_specificrefsigssupported[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\default_APN_info` | `apn_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\default_APN_info` | `pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\default_APN_info` | `roaming_pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\default_APN_info` | `user_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\default_APN_info` | `password` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\default_APN_info` | `auth_type` | 0 | 0:; 1:;2:; 3: |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\ims_APN_info` | `apn_name` | "IMS" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\ims_APN_info` | `pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\ims_APN_info` | `roaming_pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\ims_APN_info` | `user_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\ims_APN_info` | `password` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\ims_APN_info` | `auth_type` | 0 | 0:; 1:;2:; 3: |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\sos_APN_info` | `apn_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\sos_APN_info` | `pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\sos_APN_info` | `roaming_pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\sos_APN_info` | `user_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\sos_APN_info` | `password` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\sos_APN_info` | `auth_type` | 0 | 0:; 1:;2:; 3: |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\xcap_APN_info` | `apn_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\xcap_APN_info` | `pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\xcap_APN_info` | `roaming_pdp_type` | 3 | 0:null;1:IPV4; 2:IPV6; 3:IPV4/IPV6 |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\xcap_APN_info` | `user_name` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\xcap_APN_info` | `password` | "" |  |
| OPERATOR_NV_MN | `mn_apn_info\apn_info_all\apn_info_all[0]\xcap_APN_info` | `auth_type` | 0 | 0:; 1:;2:; 3: |
| OPERATOR_NV_MN | `mn_cell_info_age\cell_info_age` | `cell_info_age[0]` | 0 | 0:for counting time with network;1:for counting time without network |
| OPERATOR_NV_MN | `mn_clir_domain\clir_domain` | `clir_domain[0]` | 0 | 0: depend on ss domain; 1:cs only; |
| OPERATOR_NV_MN | `mn_cp_local_ring_back_tone_id\cp_local_ring_back_tone_id` | `cp_local_ring_back_tone_id[0]` | 3 | cp local ring back tone id |
| OPERATOR_NV_MN | `mn_cs_normal_call_num\cs_normal_call_num\cs_normal_call_num[0]` | `cs_normal_call_num` | "" | cs normal call number string |
| OPERATOR_NV_MN | `mn_cs_normal_call_retry_times\cs_normal_call_retry_times` | `cs_normal_call_retry_times[0]` | 4 | default retry 4 times, period is 2s; max retry 30 times |
| OPERATOR_NV_MN | `mn_cs_rej_mo\cs_rej_mo` | `cs_rej_mo[0]` | 0 | cs_rej_mo. |
| OPERATOR_NV_MN | `mn_cw_strategy\cw_strategy` | `cw_strategy[0]` | 1 | ue based ss service,0: CS setting following IMS ue based setting; 1:Just IMS us based setting |
| OPERATOR_NV_MN | `mn_delay_rls_ut_pdn\delay_rls_ut_pdn` | `delay_rls_ut_pdn[0]` | 0 | 1:delay 240s to release xcap pdn after build success |
| OPERATOR_NV_MN | `mn_dereg_ims_after_chg_to_23g\dereg_ims_after_chg_to_23g` | `dereg_ims_after_chg_to_23g[0]` | 0 | 0: no need; 1:need |
| OPERATOR_NV_MN | `mn_dereg_ims_in_srvcc\dereg_ims_in_srvcc` | `dereg_ims_in_srvcc[0]` | 0 | 0: no need; 1:need |
| OPERATOR_NV_MN | `mn_dtmf_duration\dtmf_duration` | `dtmf_duration[0]` | 1 | The unit is 0.1 seconds. such as:vaule=1 denote 100ms |
| OPERATOR_NV_MN | `mn_ecc_check_register\ecc_check_register` | `ecc_check_register[0]` | 0 | ps ecc need to check whether ims normal register has been completed |
| OPERATOR_NV_MN | `mn_ecc_control_feature\ecc_control_feature` | `ecc_control_feature[0]` | 0 | control ecc feature.(bit0:multi emergency category,establish normal cs call;bit1:emc_bs=1,vops=0,attempt IMS EC when the CS EC fails, do local emergency register;bit2:current_rat=unknown,0:ps prefer,1:cs prefer |
| OPERATOR_NV_MN | `mn_ecc_cs_only\ecc_cs_only` | `ecc_cs_only[0]` | 0 | 0: supoort ecc via cs and ims; 1:only support ecc via cs |
| OPERATOR_NV_MN | `mn_ecc_cs_prefer\ecc_cs_prefer` | `ecc_cs_prefer[0]` | 0 | 0:default; 1:cs prefer |
| OPERATOR_NV_MN | `mn_ecc_prefer_rat_cfg\ecc_prefer_rat_cfg` | `ecc_prefer_rat_cfg[0]` | 0 | 0:5G_4G_3G_2G; 1:5G_4G_2G_3G |
| OPERATOR_NV_MN | `mn_ecc_sr_not_derived_need_retry_ps\ecc_sr_not_derived_need_retry_ps` | `ecc_sr_not_derived_need_retry_ps[0]` | 0 | 0: ecc sr rej by nw cause 9 do not supoort ecc retry ps; 1:ecc sr rej by nw cause 9 support ecc retry ps |
| OPERATOR_NV_MN | `mn_emc_need_csfb_when_roaming\emc_need_csfb_when_roaming` | `emc_need_csfb_when_roaming[0]` | 0 | 0:emc no need csfb when roaming; 1:emc need csfb when roaming |
| OPERATOR_NV_MN | `mn_emc_pdn_retry_policy\retry_policy` | `retry_policy[0]` | "5:1;135,5:0;157,0:0;160,0:0" |  |
| OPERATOR_NV_MN | `mn_ext_ecc_via_cs_domain\ext_ecc_via_cs_domain` | `ext_ecc_via_cs_domain[0]` | 1 | 0: not support ext ecc via cs; 1: supoort ext ecc via cs |
| OPERATOR_NV_MN | `mn_fdn_enable_config\fdn_check_enable\fdn_check_enable[0]` | `sms_sc` | 1 | 0: not check; 1: check |
| OPERATOR_NV_MN | `mn_fdn_enable_config\fdn_check_enable\fdn_check_enable[0]` | `sms_da` | 1 | 0: not check; 1: check |
| OPERATOR_NV_MN | `mn_fdn_enable_config\fdn_check_enable\fdn_check_enable[0]` | `ussd` | 1 | 0: not check; 1: check |
| OPERATOR_NV_MN | `mn_fdn_enable_config\fdn_check_enable\fdn_check_enable[0]` | `call` | 1 | 0: not check; 1: check |
| OPERATOR_NV_MN | `mn_fdn_enable_config\fdn_check_enable\fdn_check_enable[0]` | `pdp` | 1 | 0: not check; 1: check |
| OPERATOR_NV_MN | `mn_fdn_enable_config\fdn_check_enable\fdn_check_enable[0]` | `ss` | 1 | 0: not check; 1: check |
| OPERATOR_NV_MN | `mn_forbid_activate_ims_pdn_when_roaming\forbid_activate_ims_pdn_when_roaming` | `forbid_activate_ims_pdn_when_roaming[0]` | 0 | 0:allow; 1:forbid |
| OPERATOR_NV_MN | `mn_forbid_send_cs_sms_when_roaming\forbid_send_cs_sms_when_roaming` | `forbid_send_cs_sms_when_roaming[0]` | 0 | 0: allow; 1: 1: forbid when international roaming |
| OPERATOR_NV_MN | `mn_forbid_send_nas_sms\forbid_send_nas_sms` | `forbid_send_nas_sms[0]` | 0 | 0: allow nas sms; 1: forbid nas sms |
| OPERATOR_NV_MN | `mn_forbid_ss_over_ps_when_roaming\forbid_ss_over_ps_when_roaming` | `forbid_ss_over_ps_when_roaming[0]` | 0 | 0: allow; 1: forbid ss domain over ps when roaming |
| OPERATOR_NV_MN | `mn_ignore_volte_switch_when_ecc_call\ignore_volte_switch_when_ecc_call` | `ignore_volte_switch_when_ecc_call[0]` | 0 | 0:default; 1:volte switch off, ps preferr |
| OPERATOR_NV_MN | `mn_ims_deregister_ho_to_vowifi_idle\ims_deregister_ho_to_vowifi_idle` | `ims_deregister_ho_to_vowifi_idle[0]` | 0 | 0: not deregister ims; 1:deregister ims |
| OPERATOR_NV_MN | `mn_ims_pdn_cause_26_retry_duration\ims_pdn_cause_26_retry_duration` | `ims_pdn_cause_26_retry_duration[0]` | 0 | ims pdn rej with cause 26 retry duration, unit: s |
| OPERATOR_NV_MN | `mn_ims_pdn_cause_29_not_allow_retry\ims_pdn_cause_29_not_allow_retry` | `ims_pdn_cause_29_not_allow_retry[0]` | 0 | ims pdn rej with cause 29 not allow retr, 0: feature close, 1: feature open |
| OPERATOR_NV_MN | `mn_ims_pdn_cause_33_not_allow_retry\ims_pdn_cause_33_not_allow_retry` | `ims_pdn_cause_33_not_allow_retry[0]` | 0 | ims pdn rej with cause 33 not allow retr, 0: feature close, 1: feature open |
| OPERATOR_NV_MN | `mn_ims_pdn_cause_55_not_allow_retry\ims_pdn_cause_55_not_allow_retry` | `ims_pdn_cause_55_not_allow_retry[0]` | 0 | ims pdn rej with cause 55 not allow retr, 0: feature close, 1: feature open |
| OPERATOR_NV_MN | `mn_ims_pdp_over_3g\ims_pdp_over_3g` | `ims_pdp_over_3g[0]` | 0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `delivery_order` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `delivery_of_err_sdu` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `traffic_handling_priority` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `traffic_class` | 0x2 | 3:interactive;4:background |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `max_bt_ul` | 0xFFFF |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `guaranteed_bt_ul` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `max_bt_dl` | 0xFFFF |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `guaranteed_bt_dl` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `max_sdu_size` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]\sdu_error_ratio` | `sdu_error_ratio[0]` | 0x4 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]\sdu_error_ratio` | `sdu_error_ratio[1]` | 0xFF |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]\residual_ber` | `residual_ber[0]` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]\residual_ber` | `residual_ber[1]` | 0xFF |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `transfer_delay` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_qos_info\ims_pdp_qos_info\ims_pdp_qos_info[0]` | `signal_indication` | 0x0 |  |
| OPERATOR_NV_MN | `mn_ims_pdp_vc_timer\mn_pdp_vc_timer_info\mn_pdp_vc_timer_info[0]` | `mn_ims_pdp_lte_vc_timer` | 0 | LTE retry timer |
| OPERATOR_NV_MN | `mn_ims_pdp_vc_timer\mn_pdp_vc_timer_info\mn_pdp_vc_timer_info[0]` | `mn_ims_pdp_nr_vc_timer` | 0 | NR retry timer |
| OPERATOR_NV_MN | `mn_ims_register_403_feature\ims_register_403_feature` | `ims_register_403_feature[0]` | 0 | if receiving a SIP 403 FORBIDDEN response to the SIP REGISTER,UE SHALL xxx until a new initial attach occurs.(bit0:NOT reattempt to establish IMS PDN connection;bit1:Apply SS via CS domain;bit2:Apply SS via XCAP again |
| OPERATOR_NV_MN | `mn_ims_register_feature\ims_register_feature` | `ims_register_feature[0]` | 0 | if receiving a register message.(bit0:ims voice over ps is false support ims register |
| OPERATOR_NV_MN | `mn_invokeid_init_value\invokeid_init_value` | `invokeid_init_value[0]` | 0 | such as:value=0, invokeid initial value is 0;value=2, invokeid initial value is 2 |
| OPERATOR_NV_MN | `mn_is_ho_used_init_reqType\is_ho_used_init_reqType` | `is_ho_used_init_reqType[0]` | 0 | vowifi idle handover to volte, used init or handover |
| OPERATOR_NV_MN | `mn_lte_default_bearer_not_need_fallback_flag\mn_lte_default_bearer_not_need_fallback_flag` | `mn_lte_default_bearer_not_need_fallback_flag[0]` | 0 | 0:not need to change;1: mn lte default bearer not need fallback |
| OPERATOR_NV_MN | `mn_lte_ims_pdn_retry_policy\retry_policy` | `retry_policy[0]` | "8:6,16:3,0:0;55;158,0:0" |  |
| OPERATOR_NV_MN | `mn_mvno_info\mvno_info` | `mvno_info[0]` | "" |  |
| OPERATOR_NV_MN | `mn_need_config_default_apn\need_config_default_apn` | `need_config_default_apn[0]` | 0 |  |
| OPERATOR_NV_MN | `mn_need_pco_im_cn_subssystem_signaling\need_pco_im_cn_subssystem_signaling` | `need_pco_im_cn_subssystem_signaling[0]` | 0 |  |
| OPERATOR_NV_MN | `mn_rej_cs_videomt\rej_cs_videomt` | `rej_cs_videomt[0]` | 0 | 0:Not rej(downgrade CS MTvideo call to audio call); 1:reject CS MT video call SETUP MSG |
| OPERATOR_NV_MN | `mn_retry_emc_pdn\retry_emc_pdn` | `retry_emc_pdn[0]` | 1 | 0:is not retry emergency PDN Connectivity; 1:is retry emergency PDN Connectivity.(when received PDN Reject with Cause 31.) |
| OPERATOR_NV_MN | `mn_retry_ims_pdn_timer24h\retry_ims_pdn_timer24h` | `retry_ims_pdn_timer24h[0]` | 0 | IMS APN is rejected(causes 27,33),shall retry every 24 hours or not.0:not retry; 1:retry |
| OPERATOR_NV_MN | `mn_retry_ims_pdp_with_expo_timer\retry_ims_pdp_with_expo_timer` | `retry_ims_pdp_with_expo_timer[0]` | 0 | 1:retry ims pdp with an exponential timer;0:is not retry ims pdp with an exponential timer. |
| OPERATOR_NV_MN | `mn_rtt_ecc_support\rtt_ecc_support` | `rtt_ecc_support[0]` | 0 |  |
| OPERATOR_NV_MN | `mn_sms_feature_control\sms_feature_control` | `sms_feature_control[0]` | 0 | BIT0 for class 0 sms report feature |
| OPERATOR_NV_MN | `mn_sms_using_ims\sms_using_ims` | `sms_using_ims[0]` | 3 | 0: disable sms over ims; 1: enable sms over ims |
| OPERATOR_NV_MN | `mn_ss_domain\ss_domain` | `ss_domain[0]` | 0 | 0: ps prefer; 1:ps only; 2:cs only |
| OPERATOR_NV_MN | `mn_ss_ike_attach_fail_retry_count\ss_ike_attach_fail_retry_count` | `ss_ike_attach_fail_retry_count[0]` | 0 | 0: ike attach fail not retry; nonzero value:ike attach fail retry count |
| OPERATOR_NV_MN | `mn_ss_no_reply_time\time_param\time_param[0]` | `cs_time` | 0x14 | no reply time when on cs |
| OPERATOR_NV_MN | `mn_ss_no_reply_time\time_param\time_param[0]` | `ut_time` | 0x14 | no reply time when on ut |
| OPERATOR_NV_MN | `mn_ss_set_clir\ss_set_clir` | `ss_set_clir[0]` | 0 | 0: didn't support set clir through network; 1:support set clir through network |
| OPERATOR_NV_MN | `mn_support_lte_default_bearer_deact\mn_support_lte_default_bearer_deact` | `mn_support_lte_default_bearer_deact[0]` | 0 | 0:last data pdp can not deactivate in lte;1:when ap deactivate last data pdp in lte锛宑p send pdp disconnet req to network; |
| OPERATOR_NV_MN | `mn_switch_control_380\switch_control_380` | `switch_control_380[0]` | 0 | 0: refer to 3GPP protocol; 1:ims normal switch to cs normal |
| OPERATOR_NV_MN | `mn_ue_base_ss_domain\ue_base_ss_domain` | `ue_base_ss_domain[0]` | 0 | 0:no sepcial following ss domain setting; 1:Ue base setting whatever SS domain setting or Volte support or not |
| OPERATOR_NV_MN | `mn_ursp_pre_cfg_string\ursp_pre_cfg_string` | `ursp_pre_cfg_string[0]` | "" |  |
| OPERATOR_NV_MN | `mn_volte_ho_use_current_pdn_type\volte_ho_use_current_pdn_type` | `volte_ho_use_current_pdn_type[0]` | 1 | 1:use current pdn type; 0:use vowifi register ip type |
| OPERATOR_NV_MN | `mn_vowifi_ecc\vowifi_ecc` | `vowifi_ecc[0]` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_ike_init_attach\mn_vowifi_ike_init_attach` | `mn_vowifi_ike_init_attach[0]` | 0 | idle handover to vowifi,0: ho attach request; 1:init attach request |
| OPERATOR_NV_MN | `mn_vowifi_n1_cap\vowifi_n1_cap` | `vowifi_n1_cap[0]` | 0 | ue enable u1 mode capability setting,0: not enable u1 mode ; 1: enable u1 mode |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `normal_call_retry_forbidden` | 0 | 1:normal call not retry when ue register on vowifi and inter-roaming in 3gpp network |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sms_retry_forbidden` | 0 | 1:sms not retry when ue register on vowifi and inter-roaming in 3gpp network |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sub1_cfg` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sub2_cfg` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sub3_cfg` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sub4_cfg` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sub5_cfg` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_roaming_cfg\vowifi_roaming_cfg\vowifi_roaming_cfg[0]` | `sub6_cfg` | 0 |  |
| OPERATOR_NV_MN | `mn_vowifi_ut\vowifi_ut` | `vowifi_ut[0]` | 0 | ut over vowifi setting,0: ut over 3gpp only; 1:ut over wifi only |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `vowifi_on_airplane` | 0x1 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `wifi_idle_rssi_low` | 0x52 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `wifi_idle_rssi_high` | 0x4B |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `wifi_call_rssi_low` | 0x4B |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `wifi_call_rssi_high` | 0x46 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cellular_preferred_432vowifi` | 0x0 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_5g_dbm_low` | 0x6e |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_5g_dbm_high` | 0x67 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_4g_dbm_low` | 0x73 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_4g_dbm_high` | 0x6A |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_3g_dbm_low` | 0x78 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_3g_dbm_high` | 0x69 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_2g_dbm_low` | 0x6E |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_pref_2g_dbm_high` | 0x63 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `vowifi_threshold_loop_count` | 0x7 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `vowifi_qos_loop_count` | 0x7 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `volte_threshold_loop_count` | 0xF |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `volte_call_threshold_loop_count` | 0xF |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_audio_loss_medium` | 0x1E |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_audio_jitter_medium` | 0xC8 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_audio_rtt_medium` | 0x7D0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_video_loss_medium` | 0x14 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_video_jitter_medium` | 0xC8 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_video_rtt_medium` | 0x7D0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_audio_loss_low` | 0x28 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_audio_jitter_low` | 0x12C |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_audio_rtt_low` | 0xBB8 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_video_loss_low` | 0x1E |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_video_jitter_low` | 0x12C |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `qos_video_rtt_low` | 0xBB8 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `punitive_policy_logic` | 0x1 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `punitive_interval_timer` | 0x5 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `punitive_max_time` | 0x1E |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `mobike_another_ap_timeout` | 0x1770 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `vowifi_on_roaming` | 0x1 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `country_codes` | "" | ISO 3166-1 two letter country code |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `custom_retry_policy_logic` | 0x0 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]\custom_retry_attempt_times` | `custom_retry_attempt_times[0]` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]\custom_retry_attempt_times` | `custom_retry_attempt_times[1]` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]\custom_retry_attempt_times` | `custom_retry_attempt_times[2]` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]\custom_retry_attempt_times` | `custom_retry_attempt_times[3]` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]\custom_retry_attempt_times` | `custom_retry_attempt_times[4]` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]\custom_retry_attempt_times` | `custom_retry_attempt_times[5]` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `trigger_vowifi_after_lte` | 0x0 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `volte_vowifi_call_ho_forbidden` | 0x0 | bit0:has volte call,not handover vowifi; bit1:has vowifi call,not handover volte; bit2:has roaming volte call,not handover vowifi; bit3:has roaming vowifi call,not handover volte |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `wifi_attach_retry_customized_policy` | 0x0 | 0x4:error_code(8192/8193/9000/9001/9002/9003/10500/11001), retry accord backoff_timer;0x03:error_code 24(AUTH_FAIL)or range 8192-16378,retry ont time;0x02:CC33/29/55,not retry;0x01:error_code 9001(No_APN_subscription),not retry; 0x00:deal with default implementation |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `cell_on_roaming_init_register` | 0x0 | 0x01:true; 0x00:false |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `running_wifi_prefer` | 0x0 | 0x01:true; 0x00:false running on vowifi preferr when user set wifi prefer and ims not avaliable in 3gpp |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `vowifi_enable_in_fm_roaming` | 0x1 | 0x01:true; 0x00:disable vowifi when ue in fm and roaming |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `volte_forbid_ho_time` | 0x0 |  |
| OPERATOR_NV_N3GPP | `n3gpp_cmcp_vowifi\vowifi_config\vowifi_config[0]` | `wifi_forbid_ho_time` | 0x0 |  |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_1` | 0x1 | config the a5/1 value |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_2` | 0x0 | config the a5/2 value |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_3` | 0x1 | config the a5/3 value |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_4` | 0x0 | config the a5/4 value |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_5` | 0x0 | config the a5/5 value |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_6` | 0x0 | config the a5/6 value |
| OPERATOR_NV_NAS | `nas_a5_config\a5_config\a5_config[0]` | `a5_7` | 0x0 | config the a5/7 value |
| OPERATOR_NV_NAS | `nas_abort_ps_conn_in_pch_state_when_hplmn_timer_expiry\abort_ps_conn_in_pch_state_when_hplmn_timer_expiry` | `abort_ps_conn_in_pch_state_when_hplmn_timer_expiry[0]` | 0x1 | abort_ps_conn_in_pch_state_when_hplmn_timer_expiry, 1:when HPLMN scan timer expire, and UE is in PCH state, it will release PS connection |
| OPERATOR_NV_NAS | `nas_adjust_enable_N1_timer_flag\nas_adjust_enable_N1_timer_flag` | `nas_adjust_enable_N1_timer_flag[0]` | 0 | 0: adjust enable N1 timer flag off; 1:adjust enable N1 timer flag on |
| OPERATOR_NV_NAS | `nas_attach_count_for_cause19\nv_config\nv_config[0]` | `set_flag` | 0 | 0: no set count for customer; 1: set count for customer |
| OPERATOR_NV_NAS | `nas_attach_count_for_cause19\nv_config\nv_config[0]` | `set_count` | 0 | x: attach attempt count is x, must be config together with set_flag, the scope is '1~5' |
| OPERATOR_NV_NAS | `nas_attach_rej_with_cause15_disablelte_flag\attach_rej_with_cause15_disablelte_flag` | `attach_rej_with_cause15_disablelte_flag[0]` | 0 | 0: attach rej with cause15 not disable lte; 1:attach rej with cause15 to disable lte |
| OPERATOR_NV_NAS | `nas_attach_rej_with_cause6_disable_card_flag\attach_rej_with_cause6_disable_card_flag` | `attach_rej_with_cause6_disable_card_flag[0]` | 0 | 0: attach rej with cause6 to disable card flag off; 1:attach rej with cause6 to disable card flag on |
| OPERATOR_NV_NAS | `nas_attach_rej_with_cause7_chg_to_111_count\nas_attach_rej_with_cause7_chg_to_111_count` | `nas_attach_rej_with_cause7_chg_to_111_count[0]` | 0 | x: attach rej with cause7 chg to cause111 count is x |
| OPERATOR_NV_NAS | `nas_attach_without_esm_flag\attach_without_esm_flag` | `attach_without_esm_flag[0]` | 0 | 0: attach without esm flag off; 1:attach without esm flag on |
| OPERATOR_NV_NAS | `nas_attach_with_imsi_after_simrefresh_flag\nas_attach_with_imsi_after_simrefresh_flag` | `nas_attach_with_imsi_after_simrefresh_flag[0]` | 0 | 0:attach mobileId from sim; 1:attach mobileId is imsi |
| OPERATOR_NV_NAS | `nas_cause12_to_13_flag\cause12_to_13_flag` | `cause12_to_13_flag[0]` | 0x0 | 1:LTE attach or tau rej cause 12 to 13; 0: LTE attach or tau rej cause 12 not change to 13 |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_5` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_5` | `chg_cause_for_ehplmn` | 0x0 | camp on ehplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_5` | `chg_cause_for_vplmn` | 0x0 | camp on vplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_6` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_6` | `chg_cause_for_ehplmn` | 0x0 | camp on ehplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_6` | `chg_cause_for_vplmn` | 0x0 | camp on vplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_7` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_7` | `chg_cause_for_ehplmn` | 0x0 | camp on ehplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_7` | `chg_cause_for_vplmn` | 0x0 | camp on vplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_11` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_11` | `chg_cause_for_ehplmn` | 0x0 | camp on ehplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_11` | `chg_cause_for_vplmn` | 0x0 | camp on vplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_12` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_12` | `chg_cause_for_ehplmn` | 0x0 | camp on ehplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_12` | `chg_cause_for_vplmn` | 0x0 | camp on vplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_14` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_14` | `chg_cause_for_ehplmn` | 0x0 | camp on ehplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_cause_from_nw\chg_cause_from_nw\chg_cause_from_nw[0]\nw_cause_14` | `chg_cause_for_vplmn` | 0x0 | camp on vplmn, need transform cause, 0: not need transform, 1~111: the transferred cause. |
| OPERATOR_NV_NAS | `nas_chg_to_auto_mode_cfg\chg_to_auto_mode_cfg` | `chg_to_auto_mode_cfg[0]` | 0x0 | config for SIM 1, bit0: when domestic roaming fail, other bits: reserved |
| OPERATOR_NV_NAS | `nas_clear_code_feature_support\clear_code_feature_support` | `clear_code_feature_support[0]` | 0 | MX telcel clear code feature support or not.0:not support; 1:support |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_0` | 0x0 | config the nas_common_feature_0 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_1` | 0x0 | config the nas_common_feature_1 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_2` | 0x0 | bit0:fastreturn to lte after csfb ss serv without LU. default closed;bit1:adjust plmn avail base on mcc. default closed;bit2:set the follow_on_proceed without follow_on_request. default closed; bit3-bit7:reserve; |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_3` | 0x0 | config the nas_common_feature_3 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_4` | 0x0 | config the nas_common_feature_4 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_5` | 0x0 | config the nas_common_feature_5 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_6` | 0x0 | config the nas_common_feature_6 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_7` | 0x0 | config the nas_common_feature_7 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_8` | 0x0 | config the nas_common_feature_8 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_9` | 0x0 | config the nas_common_feature_9 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_10` | 0x0 | config the nas_common_feature_10 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_11` | 0x0 | config the nas_common_feature_11 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_12` | 0x0 | config the nas_common_feature_12 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_13` | 0x0 | config the nas_common_feature_13 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_14` | 0x0 | config the nas_common_feature_14 value |
| OPERATOR_NV_NAS | `nas_common_feature\nas_common_feature\nas_common_feature[0]` | `nas_common_feature_15` | 0x0 | config the nas_common_feature_15 value |
| OPERATOR_NV_NAS | `nas_detach_without_switch_off_flag\detach_without_switch_off_flag` | `detach_without_switch_off_flag[0]` | 0 | 0: detach request without switch_off flag; 1:detach request with switch_off flag |
| OPERATOR_NV_NAS | `nas_dis_4g_type_cfg\dis_4g_type_cfg` | `dis_4g_type_cfg[0]` | 0x0 | disable E-UTRAN type, 0: disable whole E-UTRAN rat; 1:only disable current PLMN+E-UTRAN combination, other value: reserved |
| OPERATOR_NV_NAS | `nas_dl_adv_recv_performance_support_flag\dl_adv_recv_performance_support_flag` | `dl_adv_recv_performance_support_flag[0]` | 0x0 | 1: support dl_adv_recv_performance; 0:not support dl_adv_recv_performance |
| OPERATOR_NV_MN | `nas_do_facility_rej_if_invokeid_mismatch\nas_do_facility_rej_if_invokeid_mismatch` | `nas_do_facility_rej_if_invokeid_mismatch[0]` | 1 | 1:do facility rej when incokeid mismatch ; 0:do nothing |
| OPERATOR_NV_NAS | `nas_eea_eia_config\eea_eia_config` | `eea_eia_config[0]` | 0xff | the high half byte corresponds EEA0-EEA3, the low half byte corresponds EIA0-EIA3 |
| OPERATOR_NV_NAS | `nas_fast_return_not_allowed_after_csmt_lu_flag\fast_return_not_allowed_after_csmt_lu_flag` | `fast_return_not_allowed_after_csmt_lu_flag[0]` | 0x0 | 1: csfb umts mt call ,after LU completely ,some operator will release RRC,for this case, don't allow fast return to LTE, still wait umts page ; 0:csfb umts mt call ,after LU completely ,some operator will release RRC,for this case,allow fast return to LTE |
| OPERATOR_NV_NAS | `nas_follow_on_request_csfb_flag\follow_on_request_flag` | `follow_on_request_flag[0]` | 0x0 | 1:mo csfb to 3g carry follow on,mt csfb to 3g and lai change carry follow on,0:mt csfb to 3g  and lai not change without follow on |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_1` | 0x0 | config the gea_1 value |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_2` | 0x0 | config the gea_2 value |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_3` | 0x1 | config the gea_3 value |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_4` | 0x0 | config the gea_4 value |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_5` | 0x0 | config the gea_5 value |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_6` | 0x0 | config the gea_6 value |
| OPERATOR_NV_NAS | `nas_gea_config\gea_config\gea_config[0]` | `gea_7` | 0x0 | config the gea_7 value |
| OPERATOR_NV_NAS | `nas_hplmn_search_time\hplmn_search_time` | `hplmn_search_time[0]` | 0x0 | 0: defalut ivalid value; x: one minute |
| OPERATOR_NV_NAS | `nas_invalid_sim_recovery_cfg\invalid_sim_recovery_cfg\invalid_sim_recovery_cfg[0]` | `specific_procedures` | 0x0 | config which procedure need to transfer cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. \| config which processes need to transform Cause. bit0: lte attach, bit1: tau, bit2: lte mt detach, bit3: lte sr. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_invalid_sim_recovery_cfg\invalid_sim_recovery_cfg\invalid_sim_recovery_cfg[0]` | `retry_duration` | 0x0 | the duration between retries, the unit is second, 0: no need to transfer; 60: the maximum |
| OPERATOR_NV_NAS | `nas_invalid_sim_recovery_cfg\invalid_sim_recovery_cfg\invalid_sim_recovery_cfg[0]` | `retry_count` | 0x0 | the count of retries, 0: no need to transfer; 4: the maximum. |
| OPERATOR_NV_NAS | `nas_lrplmnsi_flag\nas_lrplmnsi_flag` | `nas_lrplmnsi_flag[0]` | 1 | 0: not use lrplmnsi; 1:use lrplmnsi |
| OPERATOR_NV_NAS | `nas_lte_algo_config\lte_algo_config` | `lte_algo_config[0]` | 0xFF | bit from left to right represent EEA0-EEA3,EIA0-EIA3 |
| OPERATOR_NV_NAS | `nas_lu_first_when_emegecycall\lu_first_when_emegecycall` | `lu_first_when_emegecycall[0]` | 0x0 | whether initial lu when emc call csfb to wcdma or GSM,bit0:lu before emc call when lai changed csfb to wcdma; bit1:lu before emc call when lai changed csfb to GSM |
| OPERATOR_NV_NAS | `nas_mo_sms_send_cp_ack\mo_sms_send_cp_ack` | `mo_sms_send_cp_ack[0]` | 0 | 0: not send cp ack; 1: send cp ack |
| OPERATOR_NV_NAS | `nas_need_cs_service_to_keep_sms_only_flag\need_cs_service_to_keep_sms_only_flag` | `need_cs_service_to_keep_sms_only_flag[0]` | 0x0 | 1: need ps_cs service, but keep sms function only for cs service; 0:no need keep sms function only for cs service |
| OPERATOR_NV_NAS | `nas_need_send_ehplmn_to_as_flag\need_send_ehplmn_to_as_flag` | `need_send_ehplmn_to_as_flag[0]` | 0x1 | 1: if one of EPLMNS belong to EHPLMN, EHPLMN should be sent to AS as EPLMN if it`s act is same with current act; 0:no need to send |
| OPERATOR_NV_NAS | `nas_need_support_roaming_flag\nas_need_support_roaming_flag` | `nas_need_support_roaming_flag[0]` | 0x0 | 0:need_support_roaming when eplmn is in ehplmn; 1:no need_support_roaming when eplmn is in ehplmn |
| OPERATOR_NV_NAS | `nas_nw_detach_req_keep_reattach_not_required_flag\nw_detach_req_keep_reattach_not_required_flag` | `nw_detach_req_keep_reattach_not_required_flag[0]` | 0 | 0: nw detach request with reattach_not_required change to reattach required; 1:nw detach request with reattach_not_required and keep it |
| OPERATOR_NV_NAS | `nas_pdp_act_need_protect_flag\pdp_act_need_protect_flag` | `pdp_act_need_protect_flag[0]` | 0x0 | 1: protect pdp activating process; 0:not protect pdp activating process |
| OPERATOR_NV_NAS | `nas_pdp_act_need_protect_period\pdp_act_need_protect_period` | `pdp_act_need_protect_period[0]` | 0 | 0: default invalid value; x: how many seconds to protect pdp activating process,recommended value is 5s |
| OPERATOR_NV_NAS | `nas_pdp_act_rej_with_cause33_chg_to_cause50_flag\nas_pdp_act_rej_with_cause33_chg_to_cause50_flag` | `nas_pdp_act_rej_with_cause33_chg_to_cause50_flag[0]` | 0x0 | 1:need change; 0:no need change |
| OPERATOR_NV_NAS | `nas_permanent_automatic_mode_flag\permanent_automatic_mode_flag` | `permanent_automatic_mode_flag[0]` | 0 | 0: don't keep permanent automatic mode; 1:keep permanent automatic mode |
| OPERATOR_NV_NAS | `nas_plmn_not_support_cs_service_flag\plmn_not_support_cs_service_flag` | `plmn_not_support_cs_service_flag[0]` | 0x0 | 0: nw support cs; 1:nw not support cs |
| OPERATOR_NV_NAS | `nas_prefer_3g_registeration_config\prefer_3g_registeration_config\prefer_3g_registeration_config[0]` | `is_prefer_reg_3g_hplmn` | 0x0 | 0:not need prefer 3g registeration;1:prefer 3g registeration |
| OPERATOR_NV_NAS | `nas_prefer_3g_registeration_config\prefer_3g_registeration_config\prefer_3g_registeration_config[0]` | `return_4g_time` | 0xff | 0xff:not initiative return 4g; other valid value is x second |
| OPERATOR_NV_NAS | `nas_prefer_hplmn_feature_flag\prefer_hplmn_feature_flag` | `prefer_hplmn_feature_flag[0]` | 0x0 | prefer_hplmn_feature_flag, 1:select hplmn first at poweron |
| OPERATOR_NV_NAS | `nas_priority_used_hplmn_timer_from_sim\priority_used_hplmn_timer_from_sim` | `priority_used_hplmn_timer_from_sim[0]` | 0 | 0:normal process; 1:priority used hplmn timer from EFHPPLMN file |
| OPERATOR_NV_NAS | `nas_prior_try_all_rplmn_and_rat_flag\prior_try_all_rplmn_and_rat_flag` | `prior_try_all_rplmn_and_rat_flag[0]` | 0x0 | 1: prior try all rplmn and rat flag for SIM 1; 0: default |
| OPERATOR_NV_NAS | `nas_quickly_select_back_to_rplmn_rat_flag\nas_quickly_select_back_to_rplmn_rat_flag` | `nas_quickly_select_back_to_rplmn_rat_flag[0]` | 1 | 0: not back to rplmn rat; 1:back to rplmn rat when hplmn attach rej by #15;other bits reserved for other situation |
| OPERATOR_NV_NAS | `nas_rat_priority_order_config\rat_priority_order_config\rat_priority_order_config[0]` | `rat_priority_order_switch` | 0x0 | rat priority order switch,1:open 0:close |
| OPERATOR_NV_NAS | `nas_rat_priority_order_config\rat_priority_order_config\rat_priority_order_config[0]` | `ratid_1` | 0x0 | config the first rat id value;eg:LTE:16,3G:2,2G:1,0:invalid |
| OPERATOR_NV_NAS | `nas_rat_priority_order_config\rat_priority_order_config\rat_priority_order_config[0]` | `ratid_2` | 0x0 | config the second rat id value;eg:LTE:16,3G:2,2G:1,0:invalid |
| OPERATOR_NV_NAS | `nas_rat_priority_order_config\rat_priority_order_config\rat_priority_order_config[0]` | `ratid_3` | 0x0 | config the third rat id value;eg:LTE:16,3G:2,2G:1,0:invalid |
| OPERATOR_NV_NAS | `nas_rat_priority_order_config\rat_priority_order_config\rat_priority_order_config[0]` | `ratid_4` | 0x0 | config fourth rat id value;eg:LTE:16,3G:2,2G:1,0:invalid |
| OPERATOR_NV_NAS | `nas_rplmn_rat_flag\nas_rplmn_rat_flag` | `nas_rplmn_rat_flag[0]` | 0 | 0: use rplmn rat; 1:not use rplmn rat |
| OPERATOR_NV_NAS | `nas_search_rplmn_ignore_eplmn_flag\search_rplmn_ignore_eplmn_flag` | `search_rplmn_ignore_eplmn_flag[0]` | 0 | 0: search rplmn need consider the eplmn when power on; 1:search rplmn need ingnore the eplmn when power on |
| OPERATOR_NV_NAS | `nas_sel_rplmn_only\sel_rplmn_only` | `sel_rplmn_only[0]` | 0 | when poweron for mode_change, whether select rplmn only or with eplmns. 0: default: select rplmn with eplmns ; 1: select rplmn only |
| OPERATOR_NV_NAS | `nas_set_dis_eutran_timer_duration_as_t3402_timer_flag\set_dis_eutran_timer_duration_as_t3402_timer_flag` | `set_dis_eutran_timer_duration_as_t3402_timer_flag[0]` | 0 | 0: set dis_eutran_timer duration as t3402 remaining time flag off; 1:set dis_eutran_timer duration as t3402 remaining time flag on |
| OPERATOR_NV_NAS | `nas_set_tin_to_ptmsi_for_csfb_mt_cfg\set_tin_to_ptmsi_for_csfb_mt_cfg` | `set_tin_to_ptmsi_for_csfb_mt_cfg[0]` | 0x1 | After ims registered succ ue receive cs paging csfb to 2/3g, and 2/3g not initiate ps register or register ps fail,then return to lte, 0:not set P-TMSI, 1:set P-TMSI |
| OPERATOR_NV_NAS | `nas_sor_support_flag\sor_support_flag` | `sor_support_flag[0]` | 0x0 | 1: support steer of roaming; 0:not support steer of roaming |
| OPERATOR_NV_NAS | `nas_start_backoff_timer_t3396_flag\nas_start_backoff_timer_t3396_flag` | `nas_start_backoff_timer_t3396_flag[0]` | 0x0 | 0:need start backoff timer t3396; 1:no need start backoff timer t3396 |
| OPERATOR_NV_NAS | `nas_start_backoff_timer_t3396_flag_custom\nv_config\nv_config[0]` | `start_backoff_timer_t3396_in_2G_3G_mode_flag` | 0 | 1:need start backoff timer t3396 in 2G or 3G; 0:no need start backoff timer t3396 in 2G or 3G |
| OPERATOR_NV_NAS | `nas_start_backoff_timer_t3396_flag_custom\nv_config\nv_config[0]` | `start_backoff_timer_t3396_for_cause29_flag` | 0 | 1:need start backoff timer t3396 for cause29; 0:no need start backoff timer t3396 for cause29 |
| OPERATOR_NV_NAS | `nas_stop_enable_lte_when_apn_change_flag\nas_stop_enable_lte_when_apn_change_flag` | `nas_stop_enable_lte_when_apn_change_flag[0]` | 0x0 | 1:need start backoff timer t3396; 0:no need start backoff timer t3396 |
| OPERATOR_NV_NAS | `nas_take_imsi_in_simlock_flag\take_imsi_in_simlock_flag` | `take_imsi_in_simlock_flag[0]` | 0x0 | take imsi in cm service req at simlock state |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\emm_cause_19_esm_cause` | `emm_cause_19_esm_cause[0]` | 0x0 | specific esm cause need to transfer attach attempt counter to max |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\emm_cause_19_esm_cause` | `emm_cause_19_esm_cause[1]` | 0x0 | specific esm cause need to transfer attach attempt counter to max |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\emm_cause_19_esm_cause` | `emm_cause_19_esm_cause[2]` | 0x0 | specific esm cause need to transfer attach attempt counter to max |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\emm_cause_19_esm_cause` | `emm_cause_19_esm_cause[3]` | 0x0 | specific esm cause need to transfer attach attempt counter to max |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\emm_cause_19_esm_cause` | `emm_cause_19_esm_cause[4]` | 0x0 | specific esm cause need to transfer attach attempt counter to max |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[0]` | `reg_cause` | 0x0 | config which cause need to transfer reg attempt counter to max. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[0]` | `specific_procs` | 0x0 | config which processes need to transfer. bit0: lte attach, bit1: tau. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[1]` | `reg_cause` | 0x0 | config which cause need to transfer reg attempt counter to max. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[1]` | `specific_procs` | 0x0 | config which processes need to transfer. bit0: lte attach, bit1: tau. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[2]` | `reg_cause` | 0x0 | config which cause need to transfer reg attempt counter to max. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[2]` | `specific_procs` | 0x0 | config which processes need to transfer. bit0: lte attach, bit1: tau. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[3]` | `reg_cause` | 0x0 | config which cause need to transfer reg attempt counter to max. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[3]` | `specific_procs` | 0x0 | config which processes need to transfer. bit0: lte attach, bit1: tau. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[4]` | `reg_cause` | 0x0 | config which cause need to transfer reg attempt counter to max. |
| OPERATOR_NV_NAS | `nas_transfer_reg_attempt_counter_to_max_cfg\cause_cfg\cause_cfg[0]\reg_cause_info\reg_cause_info[4]` | `specific_procs` | 0x0 | config which processes need to transfer. bit0: lte attach, bit1: tau. The remaining bits are reserved. |
| OPERATOR_NV_NAS | `nas_uea_algo_support_flag\uea_algo_support_flag` | `uea_algo_support_flag[0]` | 0x7 | bit0~bit7 means wheather support uea0~uea7 |
| OPERATOR_NV_NAS | `nas_ue_isr_support\ue_isr_support` | `ue_isr_support[0]` | 0x1 | 0:The mobile station not support ISR; 1:The mobile station supports ISR |
| OPERATOR_NV_NAS | `nas_ue_usage_setting\ue_usage_setting` | `ue_usage_setting[0]` | 0xFF | UE's usage setting, 0: voice centric; 1:data centric; 0xFF:invalid value |
| OPERATOR_NV_NAS | `nas_ue_voice_domain_preference\ue_voice_domain_preference` | `ue_voice_domain_preference[0]` | 0x7F | bit8 indicate whether lte only vdp config 1:LTE only vdp config,0: non lte only vdp config; bit 1-bit0, UE's voice_domain_preference, 0:cs only, 1:IMS_PS_VOICE_ONLY,2:CS_VOICE_PREFER_IMS_PS_VOICE_SEC,3:IMS_PS_VOICE_PREFER_CS_VOICE_SEC,0x7F: default invalid value |
| OPERATOR_NV_NAS | `nas_uia_algo_support_flag\uia_algo_support_flag` | `uia_algo_support_flag[0]` | 0x6 | bit0~bit7 means wheather support uia0~uia7 |
| OPERATOR_NV_NAS | `nas_update_ehplmn_availability_by_hplmnwact\update_ehplmn_availability_by_hplmnwact` | `update_ehplmn_availability_by_hplmnwact[0]` | 0 | 0:update card available information to list; 1:don't update card available information to list |
| OPERATOR_NV_NRAS | `nras_vonr\vonr` | `vonr[0]` | 1 | 0: not support, 1: support |
| OPERATOR_NV_WAS | `was_amr_wb_supported\amr_wb_supported` | `amr_wb_supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_band_prioritized\band_prior_list\band_prior_list[0]` | `prio_band1` | 0x0 |  |
| OPERATOR_NV_WAS | `was_band_prioritized\band_prior_list\band_prior_list[0]` | `prio_band2` | 0x0 |  |
| OPERATOR_NV_WAS | `was_band_prioritized\band_prior_list\band_prior_list[0]` | `prio_band3` | 0x0 |  |
| OPERATOR_NV_WAS | `was_band_prioritized\band_prior_list\band_prior_list[0]` | `prio_band4` | 0x0 |  |
| OPERATOR_NV_WAS | `was_cellcap_current\cellcap_current` | `cellcap_current[0]` | 0 |  |
| OPERATOR_NV_WAS | `was_cellfach_reselect_to_lte_supported\cellfach_reselect_to_lte_supported` | `cellfach_reselect_to_lte_supported[0]` | 0 |  |
| OPERATOR_NV_WAS | `was_commonE_DCH_Supported\commonE_DCH_Supported` | `commonE_DCH_Supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_dpcch_dtx_supported\dpcch_dtx_supported` | `dpcch_dtx_supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_enhanced_fdpch_Supported\enhanced_fdpch_Supported` | `enhanced_fdpch_Supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_hsdsch_cell_fach_Supported\hsdsch_cell_fach_Supported` | `hsdsch_cell_fach_Supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_HSDSCH_DRX_Supported\HSDSCH_DRX_Supported` | `HSDSCH_DRX_Supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_hsscch_less_supported\hsscch_less_supported` | `hsscch_less_supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_legacy_FD_disable\legacy_FD_disable` | `legacy_FD_disable[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_pdcp_nodata_timer\pdcp_nodata_timer` | `pdcp_nodata_timer[0]` | 255 |  |
| OPERATOR_NV_WAS | `was_rlc_mac_iis_supported\rlc_mac_iis_supported` | `rlc_mac_iis_supported[0]` | 1 | 0:not support; 1:support; |
| OPERATOR_NV_WAS | `was_scr_wait_release_timer\scr_wait_release_timer` | `scr_wait_release_timer[0]` | 0 |  |
| OPERATOR_NV_WAS | `was_slot_format4_supported\slot_format4_supported` | `slot_format4_supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_wcdma_best_rscp_supported\wcdma_best_rscp_supported` | `wcdma_best_rscp_supported[0]` | 0 |  |
| OPERATOR_NV_WAS | `was_wcdma_csfb_all_band_configed\wcdma_csfb_all_band_configed` | `wcdma_csfb_all_band_configed[0]` | 0 |  |
| OPERATOR_NV_WAS | `was_wcdma_csfb_all_band_needed\was_wcdma_csfb_all_band_needed` | `was_wcdma_csfb_all_band_needed[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_wcdma_csfb_force_fr_in_ps_supported\wcdma_csfb_force_fr_in_ps_supported` | `wcdma_csfb_force_fr_in_ps_supported[0]` | 1 |  |
| OPERATOR_NV_WAS | `was_wcdma_csfb_fr_supported\wcdma_csfb_fr_supported` | `wcdma_csfb_fr_supported[0]` | 1 | 0:not support; 1:support; |
| OPERATOR_NV_WAS | `was_wcdma_fng_mips_supported\wcdma_fng_mips_supported` | `wcdma_fng_mips_supported[0]` | 0 |  |
| OPERATOR_NV_WAS | `was_wcdma_testmode_rrcrej_bar_cell\wcdma_testmode_rrcrej_bar_cell` | `wcdma_testmode_rrcrej_bar_cell[0]` | 0 |  |

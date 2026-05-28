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

# MTK UT/XCAP NV字段映射

<!-- REFERENCE_ONLY_BOUNDARY_START -->
## 使用边界

- 本页是字段表、参数表或外部片段，只用于查字段、查来源、做关键词回溯。
- 不作为流程结论、配置生效结论或真实问题第一坏点引用。
- 需要判断问题时，先回到对应主文档、排障流程或 Case。
<!-- REFERENCE_ONLY_BOUNDARY_END -->


用于把 UT、XCAP、补充业务、HTTP timeout、CF/CB 等运营商需求映射到 MTK modem NV 字段。

| 业务域 | NV/LID | 字段路径 | 参数作用 | 取值/单位/枚举 | 来源 |
|---|---|---|---|---|---|
| UT/XCAP/SS | `NVRAM_EF_SSDS_PDN_FAIL_PROFILE_LID` | `pdn_fail_entry` | pdn fail path entry |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:316` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_PDN_PROFILE_LID` | `pdn_path_entry` | pdn profile entry |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:233` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_REQUEST_PROFILE_LID` | `req_path_entry` | request path entry |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:81` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_RESPONSE_PROFILE_LID` | `response_path_entry` | response path entry |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:155` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `disable_ut_timer_nw_no_resp_value_entry.action` | action |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:455` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `disable_ut_timer_nw_no_resp_value_entry.action.timer_value` | timer value |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:458` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `disable_ut_timer_nw_no_resp_value_entry.is_valid` | this entry valid? |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:440` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `disable_ut_timer_value_entry.action` | action |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:430` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `disable_ut_timer_value_entry.action.timer_value` | timer value |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:433` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `disable_ut_timer_value_entry.is_valid` | this entry valid? |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:415` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `reuse_pdn_timer_value_entry.action` | action |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:405` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `reuse_pdn_timer_value_entry.action.timer_value` | timer value |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:408` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_TIMER_VALUE_PROFILE_LID` | `reuse_pdn_timer_value_entry.is_valid` | this entry valid? |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:390` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `cb_no_action_allow` | Support no <action> and <allow> element in Call Barring | cb_no_action_allow:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:572` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `clear_cache_after_put` | Clear XCAP Cache data after PUT message | clear_cache_after_put:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:580` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `dns_server_ipv4v6_priority` | DNS Server Priority by IPv4 or IPv6 | dns_server_ipv4v6_priority:8 / 0=DNS_SERVER_IPV6_FIRST; 1=DNS_SERVER_IPV4_FIRST | `mcu/interface/service/nvram/ssds_nvram_editor.h:672` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `enable_custom_user_agent_string` | Support Customized XCAP User Agent String | enable_custom_user_agent_string:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:644` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `enable_tmpi` | GBA needs TMPI header | enable_tmpi:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:492` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `exclusive_cb` | Call Barring Rule Exclusive | exclusive_cb:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:628` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `fwd_num_use_sip_uri` | Call Forwarding number uses SIP URI format | fwd_num_use_sip_uri:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:564` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `gba_connection_timeout` | GBA HTTP Connection Timeout Value (in milliseconds) |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:685` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `gba_port` | GBA Server Port Number |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:681` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `gba_retry_times` | GBA HTTP Connection Retry Times |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:683` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `gzip_support` | Support HTTP gzip compression | gzip_support:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:548` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `media_tag` | Support Media Tag in Call Forwarding / Call Barring Rules or not | media_tag:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:476` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `media_type` | Support Media Type in Call Forwarding / Call Barring Rules | media_type:8 / 0=MEDIA_TYPE_STANDARD; 1=MEDIA_TYPE_ONLY_AUDIO; 2=MEDIA_TYPE_SEPERATE; 3=MEDIA_TYPE_VIDEO_WITH_AUDIO | `mcu/interface/service/nvram/ssds_nvram_editor.h:652` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `need_quotation_mark` | SimservType Attribute needs Quotation mark | need_quotation_mark:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:532` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `remove_invalid_actions` | Remove Non-3GPP defined Actions Element | remove_invalid_actions:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:588` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `set_cfnrc_with_cfnl` | Update Call forwarding not logged-in after updating Call forwarding not reachable | set_cfnrc_with_cfnl:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:556` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `ssl_trust` | Client Side skip checking SSL certificates | ssl_trust:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:540` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `support_adding_unprovisioned_rule` | Support Adding Unprovisioned Rule | support_adding_unprovisioned_rule:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:620` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `support_cfnl` | Support Call forwarding not logged-in | support_cfnl:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:484` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `support_put_cf_root` | Support PUT the Whole CF Node | support_put_cf_root:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:508` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `support_put_clir_root` | Support PUT the while CLIR Node | support_put_clir_root:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:524` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `support_put_cw_root` | Support PUT Call Waiting Node | support_put_cw_root:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:636` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `support_user_name_tmpi` | GBA support using TMPI as UserName | support_user_name_tmpi:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:612` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `timer_in_cfnry` | Timer inside Call forwarding not reachable | timer_in_cfnry:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:516` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `url_encoding` | XCAP Server URL encoding option | url_encoding:8 / 0=URL ENCODING NONE; 1=URL ENCODING DOC SELECTOR; 2=URL ENCODING NODE SELECTOR; 3=URL ENCODING DOC_SELECTOR + URL ENCODING NODE SELECTOR | `mcu/interface/service/nvram/ssds_nvram_editor.h:662` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `use_first_xui_element` | Use First element in XUI | use_first_xui_element:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:596` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `use_saved_xui` | Use XUI saved in NVRAM when not IMS-registerred | use_saved_xui:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:604` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `xcap_cache` | Cache XCAP Data | xcap_cache:8 / 0=Disabled; 1=Enabled | `mcu/interface/service/nvram/ssds_nvram_editor.h:500` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `xcap_connection_timeout` | XCAP HTTP Connection Timeout Value (in milliseconds) |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:684` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `xcap_port` | XCAP Server Port Number |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:680` |
| UT/XCAP/SS | `NVRAM_EF_SSDS_XCAP_PROFILE_LID` | `xcap_retry_times` | XCAP HTTP Connection Retry Times |  | `mcu/interface/service/nvram/ssds_nvram_editor.h:682` |
| UT/XCAP/SS | `NVRAM_EF_XCAP_PROFILE_LID` | `cm_info` | Connection Manager Configuration |  | `mcu/interface/service/nvram/xcap_nvram_editor.h:427` |
| UT/XCAP/SS | `NVRAM_EF_XCAP_PROFILE_LID` | `gba_info` | GBA Configuration |  | `mcu/interface/service/nvram/xcap_nvram_editor.h:399` |
| UT/XCAP/SS | `NVRAM_EF_XCAP_PROFILE_LID` | `http_info` | HTTP Connection Configuration |  | `mcu/interface/service/nvram/xcap_nvram_editor.h:468` |
| UT/XCAP/SS | `NVRAM_EF_XCAP_PROFILE_LID` | `xcap_info` | XCAP Configuration |  | `mcu/interface/service/nvram/xcap_nvram_editor.h:65` |

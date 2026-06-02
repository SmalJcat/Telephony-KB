---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
operator: Telekom Slovenije
mccmnc: "29341"
country: Slovenia
source: F:\Codex\Knowledge\运营商参数\Technical requirements for mobile terminals_10.2.2025.xlsx
status: requirements_backup
last_updated: 2026-06-02
---

# Telekom Slovenije 29341

## 阅读入口

- 本页只作为运营商需求表备份，用于按运营商、MCCMNC、业务域和原表位置回查要求。
- 不直接作为平台配置方案；需要落地配置时，回到 `60_Configuration` 下对应配置方法和目标平台代码/产物确认。
- 表内空值、N/A、默认值和未确认项按原资料保留，不主动推断。


## 基本信息

| 字段 | 值 |
|---|---|
| Operator | Telekom Slovenije |
| Country | Slovenia |
| MCC | 293 |
| MNC | 41 |
| MCCMNC | 29341 |
| 资料来源 | `Technical requirements for mobile terminals_10.2.2025.xlsx` |
| 备注 | APN section includes `MCC: 293` and `MNC:41`; VoLTE/VoWiFi rows explicitly mention Telekom Slovenie |

## 需求参数表

| Requirement | Response / status |
| --- | --- |
| Technical requirements for mobile terminals |  |
| Requirements for device: |  |
| Radio: | Confirmed |
| IMEI of device presents device to be tested (required) | Fully compliant |
| NR frequency bands: n7 FDD (20 or 35), n28 FDD/DSS, n78 TDD (required) | Fully compliant |
| NR frequency bands: n75 SDL, n258 TDD (optional) | Not compliant |
| NR CA band combination: n7/n78, n28/n78, n78/n78 (required) | Part compliant |
| NR CA band combination: n7/n258, n28/n258, n78/n258, n78/n78/n258, n7/n78/n78/n258, n28/n78/n78/n258 and combinations with n75 (optional) | Not compliant |
| NR technology: NSA (required), SA (optional) | Fully compliant |
| ENDC anchor support: B20, B3 for all combinations (required) | Not compliant |
| ENDC anchor support: B7, B8, B1 ( optional ) | Fully compliant |
| ENDC supporting CA as specified in line 20/21 (required CA band combinations - required) | Part compliant |
| DSS support for B28/N28 (required) | Not compliant |
| LTE frequency bands: 1, 3, 7, 8, 20,28 (required), | Fully compliant |
| distinguish between XX1234567 tel. numbers ( required ) | Fully compliant |
| CA band combination: 3/1, 3/7, 3/8, 3/20, 3/28, 3/1/20, 3/7/20, 3/1/7 , 3/1/28, 3/1/20/28, 3/1/8/28, 1/3/7/20/28, 1/3/7/8/20 ( required if CA is supported ) | Part compliant |
| CA band combination: 8/20, 3/38, 7/38, 7/7, 3/7/7, 1/3/7/7, 1/7/38, 1/3/7/38, 3/7/38, 3/7/7/38, 7/8, 7/20, 8/20, 1/3, 1/7, 1/3/7,1/8, 1/20, 1/38 ( optional ) | Part compliant |
| If device supports 4X4 MIMO bands 1,3,7 should be supported (required) | Fully compliant |
| LTE Category 4 or higher ( required ) | Fully compliant |
| VoLTE (mandatory if HW supports it) | Fully compliant |
| VoLTE turned On by default (required, if VoLTE was approved by Telekom Slovenie) | Fully compliant |
| VoLTE switch removed (required, if VoLTE was approved by Telekom Slovenie) | Fully compliant |
| VoLTE 3gpp RAN assisted codec rate adaption (preferred) | Fully compliant |
| VoWiFi (mandatory if HW supports it) | Fully compliant |
| VoWiFi turned On by default (required, if VoWiFi was approved by Telekom Slovenie) | Fully compliant |
| If device supports VoWiFi, LTE preferred must be set as default option (required, if VoWiFi was approved by Telekom Slovenie) | Fully compliant |
| When VoWiFi is switched ON, VoLTE must be switched ON automaticaly (required, if VoWiFi was approved by Telekom Slovenie) | Fully compliant |
| ViLTE (optional if HW supports it) | Fully compliant |
| ViLTE turned On by default (required, if ViLTE was approved by Telekom Slovenie) | Fully compliant |
| EVS (required if HW supports it) | Fully compliant |
| LTE ICIC ( optional ) | Not compliant |
| LTE CoMP ( optional ) | Not compliant |
| Inter-RAT ANR for GERAN periodical measurement, reportStrongestCellsForSON (required) | Fully compliant |
| WB-AMR GSM ( preferred ) | Fully compliant |
| GSMA HD Voice logo (preferred if WB-AMR is supported) | Fully compliant |
| VAMOS ( preferred ) | Fully compliant |
| A5/3 ( required ) | Fully compliant |
| GSM DualTransferMode ( preferred ) | Not compliant |
| GSM EnhancedDTM ( optional ) | Not compliant |
| Network Assisted Cell Change ( NACC ) ( preferred ) | Fully compliant |
| PDP type IPv4/IPv6 ( preferred ) | Fully compliant |
| WiFi 802.11ac ( optional ) | Fully compliant |
| GCF planned (preferred) |  |
| MMS Max Message size must be set at 3 MB ( required for smartphones) | Fully compliant |
| Cell Broadcast EU-ALERT compatible (required) (default setting: On) | Fully compliant |
| Distinguish between XX1234567 tel. numbers ( required ) | Fully compliant |
| IMEI uniquely represents the UE under the test ( required ) | Fully compliant |
| The Device is required to perform (including all the Capabilities and Functionalities) at least on the level as when it was approved for Sale ( required ) | Fully compliant |
| Network mode selection must have only 2 options: Auto ((5G)/4G/3G/2G) and 2G (all other options must be removed) | Fully compliant |
| GPRS and MMS settings: | Confirmed |
| Name: Mobilni Internet | Fully compliant |
| APN: internet | Fully compliant |
| Proxy: [Not set] | Fully compliant |
| Port: [Not set] | Fully compliant |
| Username: mobitel | Fully compliant |
| Password: internet | Fully compliant |
| Server: [Not set] | Fully compliant |
| MMSC: http://mms.telekom.si | Fully compliant |
| MMS proxy: [Not set] | Fully compliant |
| MMS port: [Not set] | Fully compliant |
| MMS protocol: WAP 2.0 | Fully compliant |
| MCC: 293 | Fully compliant |
| MNC:41 | Fully compliant |
| Authentication type: [none] | Fully compliant |
| APN type: default, hipri, dun, supl, mms | Fully compliant |
| APN protocol: IPv4 or IPv4/IPv6 | Fully compliant |
| APN roaming protocol: IPv4 or IPv4/IPv6 | Fully compliant |
| APN enable/disable: APN enabled | Fully compliant |

## 备注

- 原资料以终端技术要求和 APN / VoLTE / VoWiFi 能力项为主，保留运营商要求与响应状态。
- `MNC:41` 与 `MCC:293` 可确认 MCCMNC `29341`。

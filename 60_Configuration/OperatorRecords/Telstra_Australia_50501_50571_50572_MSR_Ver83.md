---
doc_type: reference
domain: Configuration
quality: imported_reference
search_tier: reference_only
operator: Telstra Australia
mccmnc: "50501;50571;50572"
country: Australia
source: F:\Codex\Knowledge\运营商参数
source_files:
  - MSR0241_Device General_Ver83 - External Version (Final).xlsx
  - MSR0585_SIM_Ver83 - External Version (Final).xlsx
  - MSR0726_Device Management_Ver83 - External Version (Final).xlsx
  - MSR0757_Submission_Ver83 - External Version (Final).xlsx
  - MSR0823_LTE_Ver83 - External Version (Final).xlsx
  - MSR0853_IPv6_Ver83 - External Version (Final).xlsx
  - MSR0868_WiFi_Ver83 - External Version (Final).xlsx
  - MSR0920_VoLTE_Ver83 - External Version (Final).xlsx
  - MSR0942_VoWiFi_Ver83 - External Version (Final).xlsx
  - MSR0983_Band Combination_Ver83 - External Version (Final).xlsx
status: requirements_backup; consolidated_msr
last_updated: 2026-06-02
---

# Telstra Australia MSR Ver83

## 阅读入口

- 本页只作为运营商需求表备份，用于按运营商、MCCMNC、业务域和原表位置回查要求。
- 不直接作为平台配置方案；需要落地配置时，回到 `60_Configuration` 下对应配置方法和目标平台代码/产物确认。
- 表内空值、N/A、默认值和未确认项按原资料保留，不主动推断。


## 基本信息

| 字段 | 值 |
|---|---|
| Operator | Telstra Australia |
| MCCMNC | 50501 / 50571 / 50572 |
| MCCMNC 证据 | MSR0920 R1.21 记录 `MNC=01, 71 and 72`；R1.22 记录 Telstra Wholesale IMSI `505 01 56...` / `505 01 55...` |
| Product response | TCL / Dahlia_T450H |
| 资料来源 | Telstra MSR Ver83 外部版本资料合集 |

## 来源文件清单

| File | Sheets | Rows | Columns |
| --- | --- | --- | --- |
| MSR0241_Device General_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 376 | 7 |
| MSR0585_SIM_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 177 | 7 |
| MSR0726_Device Management_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 269 | 7 |
| MSR0757_Submission_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 158 | 7 |
| MSR0823_LTE_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 444 | 7 |
| MSR0853_IPv6_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 115 | 7 |
| MSR0868_WiFi_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 322 | 7 |
| MSR0920_VoLTE_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 290 | 7 |
| MSR0942_VoWiFi_Ver83 - External Version (Final).xlsx | Responses, References, Document_control_sheet | 281 | 7 |
| MSR0983_Band Combination_Ver83 - External Version (Final).xlsx | How To, Reference Sheet, Overview (RESPONSES REQUIRED), CAT->streams LUT, LTE CA_BE, LTE CA, ENDC-n5_BE, ENDC-n5, ENDC-n26_BE, ENDC-n26, ENDC-n7_BE, ENDC-n7, ENDC-n78_BE, ENDC-n78, ENDC-mmW_BE, ENDC-mmW, ENDC-NRCA_BE, ENDC-NRCA, SA-FR1_BE, SA-FR1, SA-FR2_BE, SA-FR2, SA-HPUE_BE, SA-HPUE, Document_control_sheet | 1 | 1 |

## 需求参数表

### MSR0241_Device General_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1.0.2.7 | Device should support a tethered connection to a secondary device for the following operating systems launched within the last 6 years as a minimum: MAC OS, Windows OS, Linux OS. Android OS and iOS as applicable. | This requirement is N/A for form factors that cant support this interface e.g. wearables. |  | HD | Y |  |
| 1.0.5 | Data transfers shall be capable of supporting the peak throughputs that the device is capable of on the cellular interface. (Neither device data port, supplied data cable or internal device architecture shall be a bottle neck for device performance). | For low & mid tier smartphones exceptions to this may be granted at the time of device ranging e.g. cat6 devices supporting USB 3.0. In these cases the Wi-Fi performance needs to be maximised to maintain good user experience. |  | M | Y |  |
| 1.0.5.2 | What is the Customer achievable maximum data throughput? |  |  | Q | Y | LTE: DL:300Mbps, / UL : 150Mbps |
| 1.0.9 | If device is used as a hotspot, it shall still receive email and other services such as SMS, MMS, voice calls (3G, CSFB, VoLTE, VoWiFi and VoNR) | Applicable to Handsets in Hotspot mode. |  | M | Y |  |
| 1.0.21 | Devices shall ensure appropriate handling of future SIB and MIB message content that have not yet been deployed or have been marked as reserved in the appropriate 3GPP specification. As an example if new SIB and MIB messages are introduced that the device does not support, the device shall be able to either take appropriate behaviour or ignore the SIB/MIB message and that there is no adverse impact on network interoperability or customer experience. | This is radio access technology independent i.e. applies to 2G, 3G, 4G & 5G. | 181, 182 | M | Y |  |
| 1.0.22 | The device shall ignore all signalling from the network that is does not understand, this includes but not limited to: / / - Future use of reserved IEs that the device does not support / / - Coding of IEs that the device cannot decode including null fields / / - New messaging that is specified in later 3GPP releases | In these cases the device shall ignore any messaging or signalling it does not understand and continue to function as though they were not received. In these situations these devices shall not move to another RAT based because of this, disconnect connectivity or create any device resets, crashes or customer impacting behaviour | 181, 182 | M | Y |  |
| 1.3.1 | GSM/GPRS | Required for international roaming |  |  |  |  |
| 1.3.1.5 | Please list any other GSM/GPRS bands supported by the device |  |  | Q |  | No other band |
| 1.3.2 | UTRA/UMTS | Required for international roaming |  |  |  |  |
| 1.3.2.1 | Device should support UMTS 2100 (Band I) |  | 4 | HD | Y |  |
| 1.3.2.2 | Device should support UMTS 1900 (Band II) |  | 4 | HD | Y |  |
| 1.3.2.3 | Device should support UMTS 1800 (Band III) |  |  | HD | N |  |
| 1.3.2.4 | Device should support UMTS 1700 (Band IV) |  |  | HD | Y |  |
| 1.3.2.5 | Device should support UMTS 850 (Band V) |  | 4 | HD | Y |  |
| 1.3.2.6 | Device should support UMTS 800 (Band VI) |  | 4 | HD | N |  |
| 1.3.2.7 | Device should support UMTS 900 (Band VIII) |  | 4 | HD | Y |  |
| 1.3.2.8 | Please list any other UMTS bands supported by the device. |  |  | Q | Y | No other band |
| 1.3.2.9 | Enter Maximum HSDPA downlink category supported (if applicable) |  |  | Q | Y | DL cat：24 / UL cat：7 |
| 1.3.2.10 | Enter maximum HSUPA uplink category supported (if applicable) |  |  | Q | Y | category 7 |
| 1.4 | Cell Broadcast |  |  |  |  |  |
| 1.4.3 | Does the device support Cell Broadcast Service / / / as per ETSI TS 123.041? | Note MSR0295 requirement to disable this feature for now as it cannot be tested on the network yet. | 184 | Q | Y |  |
| 1.4.4 | Does the device support Cell Broadcast Service as per TS 102.900? | Note MSR0295 requirement to disable this feature for now as it cannot be tested on the network yet. | 185 | Q | Y |  |
| 1.4.5 | Device shall support Cell Broadcast Services |  | 184,204 | M | Y |  |
| 1.4.5.1.1 | Device shall support decimal Message Identifier 4370 for EU - Alert Level 1 - local language | To be displayed as NMS | 184,204 | M | Y |  |
| 1.4.5.1.3 | Device shall support decimal Message Identifier 4371 for EU - Alert Level 2 - local language | To be displayed as NMS Priority Alert in settings menu | 184,204 | M | Y |  |
| 1.4.5.1.5 | Device shall support decimal Message Identifier 4373 for EU - Alert Level 3 - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.7 | Device shall support decimal Message Identifier 4396 for EU - Alert Level 4 - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.9 | Device shall support decimal Message Identifier 4381 for EU - Amber Alert - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.11 | Device shall support decimal Message Identifier 4381 for EU - Exercise - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.13 | Device shall support decimal Message Identifier 4380 for EU - Monthly Test - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.15 | Device shall support decimal Message Identifier 4382 for EU - Reserved - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.17 | Device shall support decimal Message Identifier 4398 for EU- Test - local language |  | 184,204 | M | Y |  |
| 1.4.5.1.19 | Device shall support decimal Message Identifier 4400 for Geo-fencing Trigger Messages |  | 184,204 | M | NA | The configuration range of the community broadcasting system is up to 4399, so 4400 cannot be added |
| 1.4.5.2 | Device shall support the maintenance of a search list of the cell broadcast Message Identifiers listed in item 1.4.5.1 |  | 184 | M | Y |  |
### MSR0585_SIM_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1 | Physical Attributes |  |  |  |  |  |
| 1.1 | The device shall only support ETSI approved removable smartcard form factors. / / / Specify the removable smartcard form factor(s) supported by the device (2FF, / / / 3FF, 4FF,MFF2, other). |  |  | M | Y | support 2FF |
| 2 | Smart Card Voltage Support |  |  |  |  |  |
| 2.1 | The device shall support either class A (5V), B (3V) or C (1.8V) removable smartcards. Please specify which of these voltages is supplied. |  | 17 | M | Y |  |
| 2.2 | Does the device support Class D (1.2V) removable smartcards? |  |  | Q | NA | Platform default not support |
| 3.1 | Device shall wait until at least Wait Timing (WT) has expired for the card to respond to Answer-to-Reset command. | A "responsive" card must respond between GT and WT. Guard time (GT) is the min delay between the leading edges of 2 consecutive characters. Max delay between leading edge of a character by card and the leading edge of the previous character (transmitted by card or interface device) is named the waiting time (WT), which detects an unresponsive card. | 17 | M | Y |  |
| 3.3 | Device shall support T= 0 UE-SIM Communication |  |  | M | Y |  |
| 3.4 | Device shall support Asynchronous UE/UICC communications |  | 13 | M | Y |  |
| 3.5 | Device shall support a minimum of Four Logical Channels |  | 13 | M | Y |  |
| 3.10 | The device shall be able to identify and interwork successfully with ETSI Release 15 and later Smart Cards / eSIM profiles. | Telstra's latest SIM cards are ETSI release 15, however it is expected that devices support backward combability to release 8 basic cards. | 30 | M | NA | The platform does not support esim |
| 4 | USIM Application Toolkit |  |  |  |  |  |
| 4.1 | Device shall support all terminal-related USIM/Card Application Toolkit commands as specified in reference 3 section 10._x000D_ / Specify any commands which are not supported. | Principal for M2M devices. | 3,4,10 | M | Y |  |
| 4.2 | Device shall support FETCH STK/CAT command |  | 3,4,10 | M | Y |  |
| 4.3 | Device shall support TERMINAL RESPONSE STK/CAT Command/Function |  | 3,4,10 | M | Y |  |
| 4.4 | Device shall support ENVELOPE: MO SHORT MESSAGE CONTROL STK/CAT command- Ref also to 2.1.3.39 | This requirement is not applicable for Nb-IoT devices. | 3,4,10 | M | Y |  |
| 4.7 | Device shall support TERMINAL PROFILE STK/CAT Command/Function |  | 3,4,10 | M | Y |  |
| 4.8 | Devuce shall support MO-SMS (SST service no 37) | This requirement is not applicable for Nb-IoT devices. |  | M | Y |  |
| 4.10 | Devices shall not present a user indication for PoR (Proof of Receipt). |  |  | M | Y |  |
| 5 | Emergency Call Codes |  |  |  |  |  |
| 5.1 | Device shall support SIM ECC elementary field {6FB7} | Please see Telstra Supporting Information to view the ECC file contents / / / Only required if device supports voice capability | 6 | M | Y |  |
| 5.2 | Device shall support USIM ECC elementary field {6FB7} | Please see Telstra Supporting Information to view the ECC file contents / / / Only required if device supports voice capability | 5 | M | Y |  |
| 6.1 | At all times when a Telstra SIM is inserted and the Telstra network is available, the device shall display the network name as defined in the SPN for 5G, LTE and 3G coverage, by supporting the USIM parameters (See Telstra Supporting Information for SPN and SPDI file content). | * A USIM in Australia — the device shall display network name defined in the SPN / / / * A USIM overseas (Roaming) — Should show the foreign carriers name, or the Mobile Country/Network Codes based on the device programming. | 5 | M | Y |  |
| 6.2 | The device shall be able to display a SPN that contains 4 blanks. | In the USIM SPN field this is coded as coded as 0x20 0x20 0x20 0x20. |  | M | Y |  |
| 7.2 | The consumer device with a physical SIM slot shall support 500 x ADN of USIM phonebook. | For M2M devices, or consumer devices without a physical SIM slot, enter N/A. / / / / / / Only needed if device requires interaction with phonebook for e.g. voice or SMS support | 12 | M | Y |  |
| 7.3 | The consumer device with an embedded SIM shall support at least 50 x ADN of USIM phonebook. | For M2M devices, or consumer devices without an embedded SIM, enter N/A. / / / / / / Only needed if device requires interaction with phonebook for e.g. voice or SMS support | 12 | M | Y |  |
| 7.4 | The M2M device shall support 50 x ADN of USIM phonebook. | For consumer devices enter N/A. / / / / / / Only needed if device requires interaction with phonebook for e.g. voice or SMS support | 12 | M | NA | Not M2M device |
| 7.5 | Device shall support USIM Long Number Support of ADNs.(EXT1) | Only needed if device requires interaction with phonebook for e.g. voice or SMS support | 12 | M | Y |  |
| 7.6 | Device shall support EF-ADN SIM Phonebook file under Telecom-DF is linked to the 4F3A ADN-EF | Only needed if device requires interaction with phonebook for e.g. voice or SMS support | 12 | M | Y |  |
| 9.3 | Device shall support GPRS Location Information (LOCIGPRS) elementary field {6F53} |  | 6 | M | Y |  |
| 9.4 | Device shall support User Controlled PLMN Selector with Access Technology (PLMNwACT) elementary field {6F60} |  | 6 | M | Y |  |
| 9.5 | Device shall support Forbidden PLMN (FPLMN) elementary field {6F7B} in both GSM and USIM dedicated files |  | 6 | M | Y |  |
| 9.6 | Device shall support PLMN Selector (PLMNSel) elementary field {6F30} |  | 6 | M | Y |  |
| 9.7 | Device shall support HPLMN elementary field {6F31} |  | 6 | M | Y |  |
| 9.9 | Device shall support Short Message Service Parameter (SMSP) elementary field {6F42} in both TELECOM and USIM dedicated file. | M if SMS is supported | 6 | M | Y |  |
### MSR0726_Device Management_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 0.3 | For any user experience clarifications please contact Telstra Device Customization/ UX lead (Antonio Cobucci at antonio.cobucci@team.telstra.com) |  |  | M | Y |  |
| 1.0 | Device shall have ability to update device firmware (all aspects including baseband) "over the air". This may use proprietary update mechanisms or a standards based solution and must be a service provided by the device manufacturer/OEM |  |  | M | Y |  |
| 1.1.1 | Update via FOTA: The device shall support FOTA (firmware over the air i.e. cellular), including over-the-air software availability checking and updating | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.1.3 | Update via Wi-Fi: The device (if it can act as a Wi-Fi client) shall support firmware update over Wi-Fi | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.1.4 | Irrespective of the manner of the upgrade (i.e. via USB, Cellular OTA, Wi-Fi) user customizations (such as user defined APN connection profile, Wi-Fi settings e.g. SSID/Password etc.) shall not be changed after a FOTA upgrade. | For any settings that will be changed the customer shall be notified on the devices user interface, or controlling WEB GUI prior to the user being prompted to accept the download or not. For devices that don't have a UI the user manual shall inform the user of any devices settings that won't be maintained. / / / / / / Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.1.5 | Irrespective of the manner of firmware upgrade (i.e. via USB, Cellular OTA, Wi-Fi) any user data shall be maintained / / / (including such things but not limited to - user bookmarks, wallpapers, saved files). | If any data is not able to be maintained after a FOTA upgrade the customer shall be notified on the devices user interface, or controlling WEB GUI. For devices that don't have a UI the user manual shall inform the user of any devices settings that won't be maintained. Applies to all device types (Handsets, Tablets, Data Devices). / / / / / / Applies to all user data - stored in a dedicated user partition or otherwise. |  | M | Y |  |
| 1.1.7 | FOTA shall occur via secure connection (using at a minimum the TLS protocol) rather than http connection. | Provide details on protocol used. / / Note: SSL is not a sufficiently secure protocol. / / |  | M | Y |  |
| 1.1.7.1 | For devices that support HTTPS, the device shall use the SHA256 certificates |  |  | M | Y |  |
| 1.1.7.2 | If FOTA is not implemented, describe alternative mechanism that is implemented to upgrade firmware |  |  | Q | Y | FOTA is implemented. |
| 1.1.7.3 | For FOTA updates, the device shall have SSL/TLS certificates with an expiry date of at least 10 years from the date the devices are planned to be available to Telstra customers. | If this requirement cannot be met, detail the length of time until expiry and include an expiration date. |  | M | N | The server does not verify the client's certificate, so the client's certificate is useless. |
| 1.1.7.3.1 | Devices shall have a simple mechanism to update client-side SSL/TLS certificates used for FOTA prior to their expiry. |  |  | M | N | The server does not verify the client's certificate, so the client's certificate is useless. |
| 1.1.10 | FOTA update shall upgrade previously approved firmware to the most current Maintenance Release Firmware directly with no interim firmware versions in between |  |  | M | Y |  |
| 1.2 | FOTA Implementation Details & Checking of Firmware Update (all device types) |  |  |  |  |  |
| 1.2.1 | Provide details of FOTA solution and related technical details |  |  | Q | Y | Use HTTPS to check and download update packages, and update using Android's native A/B update scheme. |
| 1.2.5 | FOTA solution shall ensure that a device that has a RETAIL firmware build receives only retail firmware builds for future maintenance release updates and similarly a device that has a WHOLESALE firmware build shall continue to receive only WHOLESALE firmware builds (even if customer shifts between Telstra RETAIL and WHOLESALE businesses or vice versa). Describe in the comments field how this will be done. | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.2.6 | FOTA solution shall ensure that Telstra Retail sub-brands and Telstra main retail brand sold devices shall only receive their respective firmware update builds. Describe the mechanism used to achieve this separation. | Need to ensure FOTA updates can be differentiated between our Main Retail and Retail sub brands e.g. Telstra Retail vs. Boost (Telstra Retail sub brand). / / / / / / The FOTA update offered shall be device specific and based on the current device firmware and not determined by IMSI or MCC/MNC combination. / / / / / / This requirement is covered in general by requirement 1.2.5 but this specific case has been highlighted separately here to ensure the requirement is not overlooked. / / / / / / Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.2.8 | FOTA solution shall ensure that updates for different customer types (i.e. Retail or different Wholesale customers) with the same MCC & MNC code shall not corrupt that user’s existing branding, customisation and configuration. | The FOTA update offered shall be device specific and based on the current device firmware and not determined by IMSI or MCC/MNC combination. |  | M | Y |  |
| 1.2.9 | Telstra may approve two different firmware variants for the same device model, one for Retail and one for Telstra Wholesale. Subsequent Telstra approved firmware updates for these specific customer groups (i.e. Retail or different Wholesale customers) shall only be available to that group of device. Describe how this is done in comments field | The FOTA update offered shall be device specific and based on the current device firmware and not determined by IMSI or MCC/MNC combination. / / / / / / E.g. if a Retail firmware upgrade is Telstra approved for Telstra Retail devices only, then it shall only be made available to that device group, and a Telstra Wholesale customer with the same device but different firmware version and path shall not have this as their upgrade path. |  | M | Y |  |
| 1.2.13 | Automatic Check: Device shall check automatically for new software updates at a pre-set frequency (1 or 2 weeks). | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.2.13.1 | Automatic Check: Devices shall not check at the same time - randomization is required to prevent all devices accessing network at the same time for FOTA update check. | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.2.17.1 | Provide details on FOTA server: / / - Which country is it hosted in? |  |  | Q | Y | Russia, Ireland, Virginia, Tokyo |
| 1.2.17.2 | Provide details on FOTA server: / / - Is it IPv6 compliant? |  |  | Q | Y |  |
| 1.3 | Notification of Firmware update |  |  |  |  |  |
| 1.3.2 | Update Notifications: If a software update is available for download, a notification shall be presented to the user (preferably in the form of a persistent status bar notification or WEB GUI notification) | Applies to handsets and tablets and WBB devices with WEB GUI or device user interface screens |  | M | Y |  |
| 1.3.4 | Data Device UI / WebGUI shall not display "Software Update available" or similar when the device is out of coverage. | Applies to handsets and tablets and WBB devices with WEB GUI or device user interface screens |  | M | Y |  |
| 1.3.5 | If device is disconnected or not registered, the device shall not display "No update found" or similar for update checks. Rather it shall display "Network not currently available, try again later" or similar (confirm wording with Telstra Devices CoE) | Applies to handsets and tablets and WBB devices with WEB GUI or device user interface screens |  | M | Y |  |
| 1.4.0 | Does the device support automatic firmware downloads? | If supported discuss whether automatic downloads should be enabled for your device as this may occur end user cost if done over metered networks. |  | Q | N | Both WiFi and data connections will not automatically download and require user confirmation. When the user attempts to download using data, a popup will appear stating "Your device is under mobile data connection, downloading the XXXMB new version without a Wi-Fi connection will incur significant data usage." |
| 1.4.1 | For non-IoT devices, software updates shall not be downloaded on cellular networks without user approval (automatic download on unmetered networks is permitted) | Unless Telstra has provided explicit approval for this to occur in the case of automatic firmware download feature. / / / / / / In cases where user may have opted into automatic downloads or is on Wi-Fi network and automatic download occurs the update is not to be installed without users explicit approval (eg. Device UI/WEB GUI asks user to confirm they wish to install or not). / / / / / / Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.4.3 | Data charges warning: User shall be given clear warning that data charges may be incurred if the update is downloaded over cellular network, when roaming, and that these charges will be greater than in home network. | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y |  |
| 1.4.4 | User shall be given the option of downloading via the cellular network or enabling Wi-Fi and connecting to an available Wi-Fi network for download regardless of the total download size of the FOTA package. | Applies to handsets and tablets |  | M | Y | When connected to Wi Fi, Wi Fi will be used first; When there is only a cellular, a pop-up window will appear seeking user approval. |
| 1.4.8 | Update size: User shall be informed of the size of the package to the nearest MB (calculated as 1 MB = 1024 bytes) prior to accepting to download. | Applies to handsets and tablets and WBB devices with WEB GUI or device user interface screens |  | M | Y |  |
| 1.5.2 | Emergency calling: If the device is ordinarily capable of making voice calls and emergency calls (e.g. Volte, VoNR, VoWiFi, etc.) the device shall continue to be able to dial emergency numbers during download. | Applies to all voice capable devices. |  | M | Y |  |
| 1.5.4.1 | There shall be sufficient storage space quarantined in the device memory/storage to allow FOTA package to be downloaded, uncompressed and run irrespective of customers storage usage. | Applies to all devices HH, Tablet and Data devices |  | M | N | The update package will be downloaded to the customers storage, and the download process will determine whether the storage space is sufficient. |
| 1.5.9 | Device shall ensure that there is sufficient battery capacity to download the update (if not plugged into charger) | Applies to all device types (Handsets, Tablets, Data Devices) |  | M | Y | The download phase will not restrict power level, as forcibly cutting off the power will not affect the download. |
### MSR0757_Submission_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 0.03 | Original OEM technical contact details to be provided, including name, email address, and telephone number | Noting here we require the original OEM technical contact not the local representative contact details. This will expedite communication on detailed technical issues. |  | Q |  | CTS Sherry：403004717 |
| 0.04 | Specify product type e.g.telemetry, router, location tracking, metering, laptop | For Microsoft laptops that are using an approved module, there is now a reduced shortcut process, please refer to MSR0989 for this new process. Please note that currently this alternative process are for laptops not supporting voice capabilities such as VoLTE & VoWiFi. |  | Q |  | CTS Sherry：403004717 |
| 1.01.3 | WBB (Wireless Broadband Devices) Devices - minimum 23 samples | 13 to Parramatta Labs, remainder to Melbourne office |  | M | Y |  |
| 1.03 | All additional hardware and software that the customer will receive with their commercial devices shall be supplied (e.g. chargers, adapters, cables, software tools for PC synchronisation, reverse charging cables) for each device sample (of 1.01.x). | Cables refers to those for power, data connectivity and PC sync should they be different. / / / / / / The accessory samples shall be the same as those provided in the commercial units delivered to the customer. / / / / / / / / / This includes software which is downloadable from the vendors or Telstra web site |  | M | Y |  |
| 1.04 | Provide a minimum of 2 devices (from req 1.01.x) with RF adaptors, preferably SMA connector. | For LTE devices all RF ports shall be exposed. / / / This is required to support simulator and model testing. / / / Provide a diagram explaining what each of the ports are used for. / / / These samples are known as "RF units" or "RF samples" / / / Note vendor shall replace RF units that are damaged whilst testing if due to insufficient robustness. / / / Connectors must be robust and robustly mounted. If not available supply 2 samples with RF fly leads attached. Fly leads shall be fixed to the device (with Silica Sealant). Alternatively , RF jigs are to be provided to interface with the RF ports on the board and RF cables provided for conducted testing |  | M | Y |  |
| 1.04.01 | For CA (Carrier Aggregation) capable devices (from 1.01.x) provide a minimum of 3 devices with RF adaptors, preferably SMA connector. | For LTE devices all RF ports shall be exposed. / / / This is required to support simulator and model testing. / / / Provide a diagram explaining what each of the ports are used for. / / / These samples are known as "RF units" or "RF samples" / / / Note vendor shall replace RF units that are damaged whilst testing if due to insufficient robustness. / / / Connectors must be robust and robustly mounted. If not available supply 3 samples with RF fly leads attached. Fly leads shall be fixed to the device (with Silica Sealant). Alternatively, RF jigs are to be provided to interface with the RF ports on the board and RF cables provided for conducted testing. |  | M | Y |  |
| 1.04.02 | Of the 10 Embedded Module devices (from 1.01.4), 2 shall be "RF units" | RF units are defined as having connectivity to enable cabled testing to be conducted. So must have accessible RF ports for each RF path. If external ports are not available, then modified units must be supplied with RF cabling and connectors ['fly leads'] to provide access to RF ports). Fly leads shall be fixed to the device (with Silica Gel). / / / / / / RF diagram must be supplied indicating which ports and cables are for what functionality e.g.. Tx, Rx1, Rx2. / / / For LTE devices both RF ports shall be exposed. / / / This is required to support simulator and model testing. / / / Provide a diagram explaining what each of the ports are used for. / / / These samples are known as "RF units" or "RF samples" / / / Note vendor shall replace RF units that are damaged whilst testing if due to insufficient robustness. / / / Confirm with WDA team (WDI.Software.Submissions@team.telstra.com ) exact hardware submission requirement for particular device type being tested |  | M | Y |  |
| 1.08 | Vendor shall provide Program Service Tools (Software programming jig, cables, software etc.) as well as any accessories for enabling diagnostics (such as Ethernet port adaptor for all windows Tablets) |  |  | M | Y |  |
| 1.09 | Vendor shall provide tools and appropriate cables to be able to reflash firmware on the device. |  |  | M | Y |  |
| 2.12 | Vendor shall submit procedure for cellular band locking | Example: How to lock to LTE B28 only for instance |  | M | Y |  |
| 2.13 | If there is a device specification, provide device specification sheet prior to device submission. |  |  | M | Y |  |
| 2.18.3 | All IMEIs submitted to Telstra as part of device submissions shall be white listed in the FOTA server |  |  | M | Y |  |
| 2.19 | Devices which support HD Voice+ shall be compliant with GSMA Minimum Technical Requirements for use of the HD Voice+ Logo with LTE (Annex H) - Annex H2: Minimum Requirements for LTE Mobile HD Voice+ Devices. | Applicable to devices which support HD Voice+. / / / / / / Note that Telstra is not a licensee of the HD Voice+ logo and does not market network support of this feature. | 10 | M | NA | SWB is not supported.It can satisfy Annex C and Annex F |
| 2.19.1 | Vendor shall provide a copy of the HD Voice license agreement signed by the vendor and GSMA as proof of compliance. |  | 10 | M | NA | SWB is not supported.It can satisfy Annex C and Annex F |
| 2.20 | Vendor shall specify if eSIM is supported. |  |  | M | NA | Not support eSIM |
| 2.20.1 | If eSIM is supported, vendor shall provide the TAC for both pSIM and eSIM |  |  | M | NA | Not support eSIM |
| 2.22 | Vendors to provide the contact details of the tech support team for queries that arise during the certification process. If the teams are located overseas details of the on-shore team shall also be provided. |  |  | M |  | CTS |
| 3.02 | Device shall be compliant to AS/NZS 3112:2017 (Approval and test specification - Plugs and socket-outlets) Australian standard. Vendor to provide certificate of compliance prior to software and hardware submission |  | 17 | M | Y |  |
| 3.03 | Device vendor shall demonstrate compliance to European Regulatory Compliance Radio Equipment Directive (RED) for LTE Bands 1,3,7, 8 and 28 (if supported by device) | Refer AUSTRALIAN STANDARD AS/CA S042.4:2018 Requirements for connection to an air interface of a Telecommunications Network— Part 4: IMT Customer Equipment / / / i.e. Clauses 5.2.4.1, and 5.2.5.1 (but not limited to these clauses) | 16 | M | Y |  |
| 3.04 | Device vendor shall demonstrate compliance to Regulatory Compliance FCC Grant. (Only applies to cellular component of device and only applies to bands that are not covered by EU regulatory requirements in 3.03, so applies for LTE Band 5 | Refer AUSTRALIAN STANDARD AS/CA S042.4:2018 Requirements for connection to an air interface of a Telecommunications Network— Part 4: IMT Customer Equipment / / / Clause 5.2.4.2 (but not limited to this clause) / / / / / / Applies for LTE Band 5 | 16 | M | Y |  |
| 3.05 | Device vendor shall supply RoHS (Restriction of Hazardous Substances) certificate. | This certificate confirms that the vendor has not used a list of hazardous items as defined by the Directive. This requirement will be considered on a case by case basis for each device submission. / / / / RoHS and RoHS 2 compliance reports are acceptable. | 5 | M | Y |  |
| 3.06 | Device vendors shall supply a copy of the Supplier’s declaration of conformity (SDoC) to Australian EME regulatory arrangements: / / / - Radiocommunications (Compliance Labelling - Electromagnetic / / / Radiation) Notice 2014 (the EME LN) made under section 182 of the / / / Radiocommunications Act 1992 and, / / / -Radiocommunications (Electromagnetic Radiation-Human Exposure) / / / Standard 2014 (the Human Exposure Standard). / / / - Telecommunications (Labelling Notice for Customer Equipment and Customer Cabling) Instrument 2015 made under section 407 of the Telecommunications Act 1997. / / / / / / It shall be based on the commercial versions of the device as provided direct to customers or to be sold in the Telstra shops or other retail channels. / / / / / / Note where the device in question is, or includes a wireless charging pad, Telstra requires the Vendor to submit a separate Vendors Declaration stating the Wireless charging pad meets the requirements of ARPANSA RPS 3. / / / / / / | Refer: / / / / https://www.acma.gov.au/follow-our-rules-supply-your-product (as at Sept 2021). / / / / The DoC shall be re-submitted for each / / variation (hardware or otherwise) of the device / / that is produced and approved by Telstra for / / sale or direct provision to customers. / / / / Note where the device in question is, or / / includes a wireless charging pad, Telstra / / requires the Vendor to submit a separate / / Vendors Declaration stating the Wireless / / charging pad meets the requirements of / / ARPANSA RPS 3. Refer / / https://www.arpansa.gov.au/regulation-and-licensing/regulatory-publications/radiation-protection-series/codes-and-standards/rps3 (as at July / / 2019). | 6,7,8 | M | Y |  |
| 3.08 | Device shall be compliant with AUSTRALIAN STANDARD AS/CA S042.4:2018 / / Requirements for connection to an air interface of a Telecommunications Network— Part 4: IMT Customer Equipment |  | 16 | M | Y |  |
| 3.09 | Devices supporting WiFi and/or Bluetooth shall be compliant with the ACMA Radiocommunications (Short Range Devices) Standard 2014 https://www.legislation.gov.au/Details/F2015C00803 / / / / Compliance shall be demonstrated through a prepared description of the device and a signed declaration of conformity. The DoC and description shall be supplied to Telstra prior to software and hardware submission. | Applicable to devices supporting Wi-Fi and/or Bluetooth. / / / / / / Compliance certificate shall be supplied to Telstra prior to software and hardware submission. | 12 | M | Y |  |
| 3.09.1 | Device supporting WiFi and/or Bluetooth shall be compliant with Australian Radiocommunications (Low Interference Potential Devices) Class Licence 2015 https://www.legislation.gov.au/Series/F2015L01438 | Applicable to devices supporting Wi-Fi and/or Bluetooth, where they are an additional function of the device, not provided by the embedded module. | 39 | M | Y |  |
| 3.10 | Device shall be compliant with AUSTRALIAN STANDARD AS/CA S042.1:2022 / / Requirements for connection to an air interface of a Telecommunications Network, Part 1: General | The 2020 standard will be accepted up until October 2023 when the 2022 version becomes mandatory. | 35 | M | Y |  |
| 3.11 | Device shall be compliant with AUSTRALIAN STANDARD AS/CA S042.5:2022 / / / Requirements for connection to an air interface of a Telecommunications Network— Part 5: IMT-2020 Customer Equipment |  | 36 | M | NA | 4G product, not 5G product. So not compliance S042.5 |
| 4.01 | Vendor shall provide SAR compliance testing reports for all frequencies (LTE, 5G and Wi-Fi) below 6 GHz as per ACMA Human Exposure Standard Radiocommunications (Electromagnetic Radiation – Human Exposure) Standard 2014 (or as amended from time to time) testing requirements for each variation or hardware revision of the device concerned_x000D_ / _x000D_ / _x000D_ / _x000D_ / or alternatively_x000D_ / _x000D_ / _x000D_ / _x000D_ / Outline the reason the device is exempt from this requirement_x000D_ / _x000D_ / _x000D_ / _x000D_ / SAR compliance reports shall be supplied to Telstra prior to software and hardware submission | This applies to all devices including data devices and wearables. The SAR limit for all mobile, cordless and satellite phone handsets for sale in Australia is 2 watts per kilogram of tissue (averaged over 10 grams). / / / / / / Note: if devices have changed their hardware after completing their SAR reports, the SAR test reports need to be completed again, the test reports need to be completed again and re-submitted to Telstra. / / / / / / SAR means the maximum Specific Absorption Rate (SAR) for a Model expressed in watts per kilogram, measured in accordance with the testing procedures specified in the Human Exposure Standard and presented in the form specified by Telstra. / / / / / / Confirm with WDA team (WDI.Software.Submissions@team.telstra.com ) on the exact SAR requirement for particular device type being tested. | 6 | M | Y |  |
| 4.01.01 | Devices supporting frequency bands between 6GHz - 100 GHz shall provide power density compliance testing reports for all supported frequencies above 6GHz, using measurement procedure described in IEC/IEEE 63195-1:2022 and IEC/IEEE 63195-2:2022 and compliance limits as per Section 8 of ACMA Human Exposure Standard Radiocommunications (Electromagnetic Radiation – Human Exposure) Standard 2014, for each variation or hardware revision of the device concerned. / / / / / / Power density compliance reports shall be supplied to Telstra prior to software and hardware submission | This applies to all devices including data devices. Power density restrictions are specified in the ARPANSA RPS 3 Standard. / / / / Note: if devices have changed their hardware after completing their power density reports, the power density test reports need to be completed again, the test reports need to be completed again and re-submitted to Telstra. / / / / / / Confirm with WDA team (WDI.Software.Submissions@team.telstra.com ) on the exact power density requirement for particular device type being tested. | 8,37,38 | M | Y |  |
| 4.04 | Does the device have the potential for electromagnetic interference to the normal operation of active biomedical implants or other medical devices in proximity to the Model; | If YES, provide the written detail and any related usage instructions as they will be presented to the end user within model user guide | 2 | Q | N |  |
| 4.05 | Does the device have any condition or circumstance under which a person is not to come into direct contact with the Model | If YES, provide the written detail and any related usage instructions as they will be presented to the end user within model user guide | 2 | Q | N | There was no case where the model could not be touched directly |
| 4.06 | The vendor shall provide the maximum SAR value for / / / head, body (torso) and limbs (e.g. wearable device on the wrist) as per / / / ACMA Human Exposure Standard Radiocommunications / / / (Electromagnetic Radiation – Human Exposure) Standard 2014 (or as / / / amended or as amended from time to time) testing requirements . / / / / / / Provide documented evidence as it will appear in the user manual. | This value must be the same as the value printed in the user guide as provided to customers to ensure consistency of data between Telstra and device vendor. / / / / / / The needs to be provided against commercial versions of the device as provided directly to customers or to be sold in the Telstra shops or other retail channels. / / / / / / This document needs to be re-submitted for each variation (hardware or otherwise) of the device that is produced and approved by Telstra for sale or direct provision to customers. / / / / / / SAR means the maximum Specific Absorption Rate (SAR) for a Model expressed in watts per kilogram, measured in accordance with the testing procedures specified in the Human Exposure Standard and presented in the form specified by Telstra | 6 | M | Y |  |
| 4.10 | The device vendor shall provide a separate written statement confirming that the device meets the requirements of the ACMA Human Exposure Standard Radiocommunications (Electromagnetic Radiation - Human Exposure) Standard 2014 and Radiocommunications (Electromagnetic Radiation — Human Exposure) Amendment Standard 2020 (No. 1)(or as amended from time to time). |  | 6 | M | Y |  |
| 4.11 | The device vendor should provide a separate written statement confirming that the device meets the requirements of the ACMA Radiocommunications Equipment (General) Rules 2021 and the Radiocommunications Equipment (General) Amendment Rules 2021 (No. 1). | ACMA is updating its EME regulations to incorporate the new ARPANSA exposure standard RPS S-1(2021) / / - No change to SAR limits / / - Updated power density limits for frequencies > 6GHz / / The ACMA is looking to incorporate all radio standards and labelling notices into the General Equipment Rules. | 33, 34 | M | Y |  |
### MSR0823_LTE_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1.2 | Device shall support network initiated dedicated EPS bearer | 3GPP 24.301 section 6.4.2.2 & 3GPP 23.401 section 5.4.1 | 1, 10 | M | Y |  |
| 1.3 | Device shall support UE requested bearer resource modification | 3GPP 23.401 section 5.4.5 & / / 3GPP 24.301 section 6.5.4 & 8.3.18 | 1, 10 | M | Y |  |
| 1.12 | Device shall support minimum of 3 default EPS bearers simultaneously |  |  | M | Y |  |
| 1.13 | Device shall support minimum of 3 dedicated EPS bearers simultaneously |  |  | M | Y |  |
| 1.13.2 | Device shall support up to 8 Dedicated bearers |  |  | M | Y |  |
| 1.19 | Device shall support network initiated EPS bearer modification for QoS |  |  | M | Y |  |
| 1.20 | Device shall support network initiated EPS bearer modification for TFT |  |  | M | Y |  |
| 1.21.2 | Devices shall not manage RRC state changes through proprietary mechanisms. |  |  | M | Y |  |
| 1.27 | If the network does not support integrity protection then the device shall not attach to the network, except in emergency cases as detailed in the 3GPP TS (reference 16). | See sections 5.1.4.1, 7.4.1, and 8.1.1. of reference 16 | 16 | M | Y |  |
| 1.28.0.1 | Enter maximum LTE downlink category (e.g. Category 16) |  |  | Q | Y | DL cat7 |
| 1.28.0.2 | Enter maximum LTE uplink category (e.g. Category 16) |  |  | Q | Y | UL cat 13 |
| 1.29 | Device shall support network initiated EPS bearer modification updates without bearer QoS update information in the modify request | see section 5.4.3 of reference | 10 | M | Y |  |
| 1.30.1 | The device shall support measuring down to -140dBm RSRP | For Cat 1 and above devices, this requirement needs to be supported on band 3 and 28 if device supports as a minimum. Test at 20MHz in conducted state. / / / / This is tested in a clean non-CA environment on the model network. / / / / If this cannot be met identify why it can't be met and what the value is. Please enter N/A into the Value/Data column if this value can be met. | 12 | M | Y |  |
| 1.30.2 | The device shall be able to acquire the LTE network at -130dBm RSRP | For Cat 1 and above devices, this requirement needs to be supported on band 3 and 28 if device supports as a minimum. Test at 20MHz in conducted state. / / / / This is tested in a clean non-CA environment on the model network. / / / / If this cannot be met identify why it can't be met and what the value is. Please enter N/A into the Value/Data column if this value can be met. |  | M | Y |  |
| 1.30.3 | In connected mode the device shall be able to remain in Connected State to -132dBm RSRP | For Cat 1 and above devices, this requirement needs to be supported on band 3 and 28 if device supports as a minimum. Test at 20MHz in conducted state. / / / / This is tested in a clean non-CA environment on the model network. / / / / If this cannot be met identify why it can't be met and what the value is. Please enter N/A into the Value/Data column if this value can be met. |  | M | Y |  |
| 1.30.4 | After acquiring LTE, device shall be able to move to the Connected state at -130dBm RSRP | For Cat 1 and above devices, this requirement needs to be supported on band 3 and 28 if device supports as a minimum. Test at 20MHz in conducted state. / / / / This is tested in a clean non-CA environment on the model network. / / / / If this cannot be met identify why it can't be met and what the value is. Please enter N/A into the Value/Data column if this value can be met. |  | M | Y |  |
| 1.34.6 | Device shall support TM 9. | For rel 10 devices, exceptions may be granted especially for rel 8 & 9 devices. / / P for Cat 16 devices and above / / M for Cat 9 and above |  | M | NA | The platform does not support |
| 1.34.6.1 | If device supports TM9, indicate if it supports CSI-RS ports 4 (FGI 105 and 107) | M for devices that TM9 |  | Q | NA | The platform does not support |
| 1.34.6.2 | If device supports TM9, indicate if it supports CSI-RS ports 8 (FGI 106 and 108) | HD for devices that TM9 |  | Q | NA | The platform does not support |
| 1.34.7 | Device shall support TM 10 | For rel 10 devices, exceptions may be granted especially for rel 8 & 9 devices. / / P for Cat 16 devices and above / / M for Cat 9 and above |  | M | NA | The platform does not support |
| 1.40 | Device shall support EHPLMN functionality. | This functionality will be required for devices that are being LANES certified. |  | M | Y |  |
| 1.41 | Device shall support reception of EPLMNs in the attach accept message. | This functionality will be required for devices that are being LANES certified. |  | M | Y |  |
| 1.43 | Device shall maintain FPLMN list. | This functionality will be required for devices that are being LANES certified. | 27 | M | Y |  |
| 1.44 | A device shall not attempt to automatically attach to a network in the forbidden list, other than for emergency attaches. | This functionality will be required for devices that are being LANES certified. | 27 | M | Y |  |
| 1.54 | Device should support APN Based Session Management congestion control |  |  | HD | Y |  |
| 1.55 | Device should support APN Based Mobility Management congestion control |  |  | HD | Y |  |
| 1.56 | UE should support a separate Session management back-off timer for every APN that the UE requests. |  |  | HD | Y |  |
| 1.59.1 | Device shall support signalling control based on Low Access Priority Indication (LAPI). | Please refer to MSR0295 for device Pre-configuration of this feature. / / For specific applications, exceptions can be made on a case by case basis. | 28 | M | N | LAPI is disabled |
| 1.59.2 | If LAPI is supported, indicate if UE supports the ability to configure for LAPI in the NAS Management Object | Please refer to MSR0295 for device Pre-configuration of this feature. | 28 | HD | N | LAPI is disabled |
| 1.59.3 | If LAPI is supported, indicate if UE supports SIM based LAPI | Please refer to MSR0295 for device Pre-configuration of this feature. | 28 | HD | N | LAPI is disabled |
| 1.60 | If LAPI is supported, the UE should support the ability to Override the NAS signalling Low Priority indicator. | Please refer to MSR0295 for device Pre-configuration of this feature. |  | HD | N | LAPI is disabled |
| 1.60.3 | If EAB is supported, indicate if UE supports the ability to configure for EAB in the NAS Management Object |  |  | HD | NA | The platform does not support |
| 1.60.4 | If EAB is supported, the device should support SIM based EAB |  |  | HD | NA | The platform does not support |
| 1.61.2 | Time to complete initial scan of 4G bands in order of highest preference (700, 1800, 2600, 2100 & 900). / / / / Provide achieved results. |  |  | Q | Y |  |
### MSR0853_IPv6_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1 | Dual Stack Capability | Applicable to LTE and 5G capable devices_x000D_ / Note in this document the term PDP type shall be read interchangeably as PDN type._x000D_ / Similarly PDP context as PDN bearer and so on. |  |  |  |  |
| 1.2 | Device shall support IPv4 and IPv6 on a single PDP (for IPV4V6) dual stack |  | 5, 6 | M | Y |  |
| 1.3 | If network rejects IPv4v6 request the UE shall fall back to support IPv4 or IPv6 depending on network responses per the following: |  |  |  |  |  |
| 1.3.1 | If UE requests a IPv4v6 PDP and network sets the PDP type to IPv4 (for example: due to IPv4v6 subscription not allowed) with cause code #50 (PDP type IPv4 only allowed), UE shall use the allocated IPv4 address from the network; / / / / UE shall not subsequently request IPv6 PDP context activation |  | 7,8,9 | M | Y |  |
| 1.3.2 | If UE requests a IPv4v6 PDP and network sets the PDP type to IPv6 (for example: due to IPv4v6 subscription not allowed) with cause code #51 (PDP type IPv6 only allowed), UE shall use the allocated IPv6 address from the network; / / / / / / UE shall not subsequently request IPv4 PDP context activation |  | 7,8,9 | M | Y |  |
| 1.3.3 | IPv4v6 devices shall support following cause code: SM cause to #52, (single address bearers only allowed) and use the allocated IP address from the network. / / / / / / The Dual Stack UE shall then request another PDP context activate for the other PDP type other than the one already activated. | Refer 3GPP 24.008 V9.11.0 Section 6.2.2 | 7,8,9, 43 | M | Y |  |
| 1.3.4 | If UE requests a IPv4v6 PDP and the network responds with the PDP type IPv4 (or IPv6) with no SM cause included, UE shall use the allocated IP address from the network._x000D_ / UE shall request another PDP context activate for the other PDP type which was not allocated by the network. |  | 10,11 | M | Y |  |
| 1.3.5 | If UE requests a IPv4v6 PDP and the network rejects with cause code #28 (unknown PDP address or PDP type). / / / / / / UE shall then request both IPv4 and IPv6 PDP context activation |  | 10,11 | M | Y |  |
| 1.3.6 | If UE requests a IPv4v6 PDP and the network rejects with cause code #32 (service option not supported) UE should then request both IPv4 and IPv6 PDP context activation. | Not defined by any release of 3GPP specification but pre R8 Ericsson SGSN might respond with such cause code when UE are roaming overseas. |  | HD | Y |  |
| 1.4 | If device sends IPv4v6 PDP activate request to network and network rejects the request with a SM cause code, what is the device behaviour if it receives the following codes: |  |  |  |  |  |
| 1.4.1 | #27 (missing or unknown APN) |  |  | Q | Y | Turn on the 3396 timer if it receives the following codes:27，start_backoff_timer_t3396_in_2G_3G_mode_flag=1 |
| 1.4.5 | List other cause codes that trigger the UE to fall back to IPv4 or IPv6 |  |  | Q | Y | Code default support |
| 1.5 | WBB (Wireless Broadband) Devices shall support dual stack (IPv4v6) on telstra.internet APN | Includes USB dongles, Wi-Fi routers, Gateways. / / / / / / Note telstra.internet APN on Telstra production network now supports IPv4v6 dual stack (as of October 2016). This feature has been launched. / / / / / / Existing in market devices shall maintain their launched configuration (unless otherwise agreed for MR). / / / / / / New devices shall be configured per latest version of MSR0295. For telstra.internet this will be IPv4v6 for home, IPv4 for roaming networks. / / / / / / Confirm IP configuration with Telstra prior to device submission |  | M | Y |  |
| 1.6 | All devices supporting tethering shall support dual stack on tethering APN. | Applicable to LTE and 5G capable devices / / / / / / / / Note in this document the term PDP type shall be read interchangeably as PDN type. / / / / / / / / Similarly, PDP context as PDN bearer and so on. |  | M | Y |  |
| 2 | IPv6 Single Stack (SS) Capability | Applicable to LTE and 5G capable devices / / / / / / / / Note in this document the term PDP type shall be read interchangeably as PDN type. / / / / / / / / Similarly, PDP context as PDN bearer and so on. |  |  |  |  |
| 2.1 | Device shall support IPv6 single stack connectivity |  |  | M | Y |  |
| 2.02 | All handsets and tablets shall support IPv6 SS with XLAT | New devices shall be configured per latest version of MSR0295. / / / / Telstra has launched (as at October 2018) single stack IPv6 (IPv6 SS) on Telstra.wap. / / / / Telstra.wap APN now supports IPv4 and IPv4v6 (dual stack) and IPv6 (single stack) operation. / / / / The IPv6 single stack operation utilises network DNS64/NAT64 (PLAT) and device 464XLAT functionality (CLAT). / / / / [CLAT=Client side Address Translator, PLAT = Provider side Address Translator]. / / / / DNS64/NAT64 are available in live network on Telstra.wap APN to facilitate vendor testing prior to Lab entry. / / / / Customer subscriptions for Telstra.internet & Telstra.wap APNs have all been migrated to IPv6 capability. / / / / All handset and tablet devices ranged from 1 January 2019 are required to support IPv6 SS for the Telstra.wap APN / / / / For existing devices in market, no change is required to APN IP configuration, unless vendor wishes to update (via a future firmware update). |  | M | Y |  |
| 2.2 | All IPv6 capable devices, including dual stack IPv4v6 capable devices and non-dual stack IPv4v6 capable devices, shall support IPv6 single PDN Connection for 4G/5G as applicable. |  |  | M | Y |  |
| 2.3 | All Tablets and Handsets shall support IPv6 Single Stack Tethering using XLAT464 (CLAT function required for the tethering interface) | Exemptions permitted / / However until further notice continue to configure tethering on Telstra.internet APN as dual stack (IPv4v6) |  | M | Y |  |
| 2.4 | WBB (Wireless Broadband) devices such as Wireless Hotspots, dongles and similar should support single stack / using XLAT464 (CLAT on device, PLAT in network) | If device supports this functionality then to be discussed with Telstra at ranging whether to be configured as such / / for IOT testing. APN to be used in this scenario to be advised |  | HD | NA | Not WBB devices |
| 2.5 | If device sends IPv6 PDP activate request to network and network rejects the request with the following SM cause codes, what is the device behaviour if it receives the following codes: |  |  |  |  |  |
| 2.5.1 | #27 (missing or unknown APN) |  |  | Q | Y | Code default support |
| 2.5.8 | #51 (PDP type IPv6 only allowed) |  |  | Q | Y | Code default support |
| 3.1 | Device shall support IPv6 address allocation via SLAAC (Stateless Address Auto Configuration). | E.g. Constructs its full IPv6 address by concatenating the interface identifier received in the PDP activate response from network, or a locally generated interface identifier, and the prefix received in the Router Advertisement sent from network to the UE. | 7,12,13, 14 | M | Y |  |
| 3.2 | The interface identifier shall be used for building a unique link-local IPv6 address. |  | 15,9 | M | Y |  |
| 3.4 | If the MME or the Rel-8 SGSN forwards the whole IPv6 address or only the Interface Identifier to the UE, even if the UE receives the IPv6 prefix in the Attach Accept message or PDP activate response message, it shall ignore it. |  | 12 | M | Y |  |
| 4.1 | Device shall support IPv6 address prefix delegation via DHCPv6. | M for R10 devices. | 18,19,20,13, 22, 23 | M | Y |  |
| 4.3 | Wireless Broadband routers should support RFC6603 DHCPv6 Prefix Exclude option | HD For R10 and beyond devices, Optional for earlier release devices | 48 | HD | Y |  |
| 5 | DHCPv4 - deferred IPv4 address allocation |  |  |  |  |  |
| 5.1 | If UE wants to use DHCPv4 for IPv4 address assignment, it shall indicate that to the network within the Protocol Configuration Options IE in the ACTIVATE PDP CONTEXT REQUEST. |  | 24,15,20,25,26,27 | M | N | Not Support |
| 5.2 | Upon request as per 5.1, if the network does not provide the IPv4 address for the MS as part of the PDP context activation procedures but sets the PDP address as 0.0.0.0. After the PDP Context establishment procedure is completed, the MS shall initiate the IPv4 address allocation by using DHCPv4 (see details in TS 29.061 and RFC 2131). |  | 24,15,20,25,26,27 | M | N | Not Support |
| 6.1 | Device shall support the discovery of the IPv6 address of the DNS server, using PCO (Protocol Configuration Options) additional parameter 003H (DNS Server IPv6 address request) at PDP set up. |  | 28, 29 | M | Y |  |
| 6.2 | Device shall request both IPv4 DNS address and IPv6 DNS address when requesting IPv4v6 dual stack PDP activation. |  |  | M | Y |  |
| 8.1 | What is the default MTU size used for the IPv6 link? |  |  | Q | Y | sip_mtu[0]=1300 |
### MSR0868_WiFi_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1.01 | Device should be certified by WiFi Alliance "WiFi Certified (TM)" program. | For each WiFi standard supported, the device shall be certified for each one i.e. 802.11a, b, g, n, ac, WiGig. / / / / / / For some WiFi centric products such as MBB devices and routers there may be a requirement that WiFi Alliance certification is mandatory, this shall be confirmed with the vendor when the device is being ranged. |  | HD | Y |  |
| 1.01.1 | If the device vendor has not undertaken WiFi Alliance certification they shall provide test results and documentation demonstrating their device is compliant to WiFi standards and interworking with other WiFi devices. |  |  | M | Y |  |
| 1.06.5 | Device shall support 802.11n / Wi-Fi 4 2.4GHz band |  |  | M | Y |  |
| 1.06.6 | Device shall support 802.11n / Wi-Fi 4 5GHz band |  |  | M | N | 2.4g wifi only |
| 1.06.12 | Device should support Wi-Fi 6E | ACMA has released spectrum for Wi-Fi 6E. ACMA has registered an update to the Low Interference Potential Devices class licence supporting RLANs in the lower part of the 6GHz band. The modified LIPD now means that Wi-Fi 6E and New Radio Unlicensed can be deployed in the 5925-6425MHz range. | 7 | HD | N |  |
| 1.14 | Device should support use as a WiFi hotspot over IPv6. If supported specify the protocol used. |  |  | HD | Y |  |
| 2 | CLIENT MODE / / (Used to access a wireless router e.g. Home Gateway) | Applicable for Handsets and Tablets / / If not supported enter N/A for this section |  |  |  |  |
| 2.01 | The device shall still comply with Australian standards. | The WiFi power shall be calibrated to its maximum possible output and not limited to European standards. |  | M | Y |  |
| 2.1 | CLIENT MODE - IEEE802.11n Requirements | REQUIREMENTS ONLY APPLICABLE IF DEVICE SUPPORTS 802.11n CLIENT MODE |  |  |  |  |
| 2.1.01 | What antenna configuration is supported for Transmit (Tx) and Receive (Rx) | E.g. specify SISO, MIMO2x2, MIMO 2x3 etc where in this case 2 = transmit, 3 = receive |  | Q |  | SISO, 3 = transmit, 3 = receive |
| 2.1.02 | How many spatial streams are supported @2.4GHz band. And specify BW | E.g. 1, 2, 3 or 4 streams. If number of spatial streams is different between transmit and receive detail what is supported in each direction. |  | Q |  | 1 |
| 2.1.03 | How many spatial streams are supported @5GHz band . And specify BW | E.g. 1, 2, 3 or 4 streams. If number of spatial streams is different between transmit and receive detail what is supported in each direction. |  | Q |  | Not support 5GHz |
| 2.1.18 | The device shall comply with the ACMA specification regarding the maximum EIRP values permitted in each part of the band. | See spec for the details as this varies depending on the frequency and where DFS/TPC is used. | 3 | M | Y |  |
| 2.2 | CLIENT MODE - IEEE802.11ac Requirements | REQUIREMENTS ONLY APPLICABLE IF DEVICE SUPPORTS 802.11ac CLIENT MODE |  |  |  |  |
| 2.2.01 | What antenna configuration is supported for Transmit (Tx) and Receive (Rx) | E.g. specify SISO, MIMO2x2, MU-MIMO, MIMO 2x3 etc where in this case 2 = transmit, 3 = receive |  | Q |  | Platform not support 802.11ac |
| 2.2.02 | 20MHz channel shall be supported on 5GHz band |  |  | M | N |  |
| 2.2.03 | 40MHz channel shall be supported on 5GHz band |  |  | M | N |  |
| 2.2.04 | 80MHz channel shall be supported on 5GHz band |  |  | M | N |  |
| 2.2.05 | Contiguous 160MHz channel should be supported on 5GHz band |  |  | HD | N |  |
| 2.2.06 | Non-Contigious160MHz (80+80) channel should be supported on 5GHz band |  |  | HD | N |  |
| 2.2.12 | How many spatial streams are supported @5GHz band and specify BW | E.g. 1, 2, 3 or 4. Provide info for Tx + Rx / / It is assumed that the number of spatial streams will be the same supported for Tx and Rx, if this is not the case indicate clearly the configuration |  | Q | N | Platform not support |
| 2.2.16 | Dynamic Bandwidth Management Mode should be supported to adjust channel bandwidth |  |  | HD | N | Platform not support |
| 2.2.20 | If device supports the 5GHz band it shall support the full bandwidth. | If the device does not support the full bandwidth indicate what parts of the band are not supported. / / / / In summary the Australian 5GHz band covers: 5150Mz - 5850MHz (see reference for full ACMA details). | 3 | M | N | Not supported 802.11ac |
| 2.2.21 | The device shall comply with the ACMA specification regarding the maximum EIRP values permitted in each part of the band. | See spec for the details as this varies depending on the frequency and where DFS/TPC is used. | 3 | M | N |  |
| 2.2.25 | Device should support DL MU-MIMO in client mode | Applicable for devices supporting 802.11ac wave 2 |  | HD | N | Not supported 802.11ac |
| 2.4 | CLIENT MODE - IEEE802.11ax Requirements | REQUIREMENTS ONLY APPLICABLE IF DEVICE SUPPORTS 802.11ax CLIENT MODE |  |  |  |  |
| 2.4.1 | What antenna configuration is supported for Transmit (Tx) and Receive (Rx) | E.g. specify SISO, MIMO2x2, MU-MIMO, MIMO 2x3 etc where in this case 2 = transmit, 3 = receive |  | Q | N | Not support 802.11ax |
| 2.4.2 | 20MHz channel shall be supported on 2.4GHz band |  |  | M | N | Not support 802.11ax |
| 2.4.3 | 40MHz channel shall be supported on 2.4GHz band |  |  | HD | N | Not support 802.11ax |
| 2.4.4 | 20MHz channel shall be supported on 5GHz band |  |  | M | N | Not support 802.11ax |
| 2.4.5 | 40MHz channel shall be supported on 5GHz band |  |  | M | N | Not support 802.11ax |
| 2.4.6 | 80MHz channel shall be supported on 5GHz band |  |  | M | N | Not support 802.11ax |
| 2.4.7 | Contiguous 160MHz channel should be supported on 5GHz band |  |  | HD | N | Not support 802.11ax |
| 2.4.8 | Non-Contigious160MHz (80+80) channel should be supported on 5GHz band |  |  | HD | N | Not support 802.11ax |
### MSR0920_VoLTE_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1 | VoLTE General & UX (User Experience) |  | - |  |  |  |
| 1.2 | 4G Device shall support VoLTE as specified in GSMA IR.92 version 17 or later | Detail which version of GSMA IR.92 the device is compliant with and detail any non compliances to that version of the specification | 142 | M | Y |  |
| 1.2.1 | 5G Capable devices supporting VoLTE shall support VoLTE as specified in GSM IR.92 version 17 or later | Note in particular Section 4.2.5 | 142 | M | NA | Not support 5G |
| 1.2.2 | 5GSA devices supporting VoNR shall also comply with latest version of MSR0990 5GSA Voice Device Requirements |  |  | M | NA | Not support 5G |
| 1.3 | Device shall support MMTel capability as per 3GPP R9 or later | if later please specify version supported | 3 | M | Y |  |
| 1.6 | Device should have a VoLTE indicator (text or graphic obviously indicating VoLTE) that shall be displayed when device can make a VoLTE call (it shall not be displayed when not IMS registered). | For VoWiFi devices, VoWiFi and VoLTE indicators must be different._x000D_ / If VoLTE indicator supported it shall be displayed whilst on a VoLTE call_x000D_ / | - | HD | Y |  |
| 1.7 | Device shall not have a menu option for the user to enable / disable VoLTE |  | - | M | Y |  |
| 1.9 | Describe what IMS stack is used for the device (e.g. is it that provided by the chipset manufacturer, or otherwise and what version of the stack is it?) |  | - | Q | Y |  |
| 1.10 | Disabling Packet data on device shall not disable VoLTE voice calling. | Expected behaviour is that device shall still allow VoLTE voice calling. | - | M | Y |  |
| 1.11 | Device shall include all VoLTE related chipset vendor patches available in device firmware submitted. |  | - | M | Y |  |
| 1.12 | Device shall include all VoLTE related chipset vendor patches released in next available maintenance release (MR) firmware. | Timing to be agreed with Telstra. | - | M | Y |  |
| 1.16 | Does the device support VoWifi? |  | - | Q | Y |  |
| 1.16.1 | If device supports VoWiFi it shall comply with MSR0942 latest available version and MSR0942 must be fully completed and included with or prior to device submission |  | - | M | Y |  |
| 1.18 | Device shall not register with IMS network if it does not indicate support of "IMS voice over PS" |  |  | M | Y |  |
| 1.19 | All 4G devices supporting voice shall support VoLTE | 3G CS shall be supported for roaming scenarios (if device supports 3G) |  | M | Y |  |
| 1.21 | Devices shall support VoLTE/IMS for all valid Mobile Network Codes for Telstra (currently MNC= 01, 71 and 72) |  |  | M | Y |  |
| 1.22 | Devices shall support VoLTE/IMS for Telstra Wholesale devices / / / | Telstra Wholesale IMSI Ranges: 505 01 56 XXXX XXXX and 505 01 55 XXXX XXXX |  | M | Y |  |
| 2.2 | Device shall support ROHC (Robust Header Compression) for RTP traffic | Minimum of profile (0x0001) shall be supported (RTP/UDP/IP). / / / Shall be supported for both IPv4 and IPv6 | 1, 2,6 | M | Y |  |
| 2.3 | Device shall support ROHC (Robust Header Compression) for RTCP (control signalling) traffic | Minimum of profile (0x0002) shall be supported (UDP/IP) / / / Shall be supported for both IPv4 and IPv6 | 1, 2,6 | M | Y |  |
| 2.5 | Device shall support Short and Long cycle CDRX | FGI Bit 4 for short DRX, Bit 5 for Long DRX / / / Mandatory requirement from LTE Radio MSR but repeated here to emphasize importance for VoLTE / / / Refer MSR0853 LTE Radio for additional detail on CDRX (and eDRX for IOT devices) | 5, 7 | M | Y |  |
| 2.7 | Device shall support sufficient simultaneous radio bearers (SRB, DRB AM and DRB UM as necessary) to allow the following to be supported simultaneously: / / / / / / - Internet browsing session / / / - IMS Signalling, Voice and Video Session / / / - MMS on a dedicated APN (noting this APN will not require always on connectivity, it will be on demand) / / / - Ut traffic on a dedicated APN (noting this APN will not require always on connectivity, it will be on demand) / / / - Tethering (on separate APN to internet browsing) | Detail any limitations to supporting the above requirement in vendor comments column / / / / / / / / / Provide details on maximum supported simultaneous radio bearers (no of DRB AM, DRB UM, SRB) in vendor comments column | 1, 9 | M | Y |  |
| 2.12 | Device shall support VoLTE on all LTE bands that it supports. | 3GPP Bands 28, 3 and 7 are mandatory LTE bands for Telstra. | - | M | Y |  |
| 2.13 | Device shall support Access Class Barring skipping for MMTEL voice | This means the device shall support and comply with the LTE SIB2 message ac-BarringSkipForMMTELVoice. The SIB2 message is defined in 3GPP Release 12. However it is release independent, i.e. can be conformed to on earlier 3GPP release devices. / / / / Refer 3GPP 36.331 Release 12 or later, Section 5.3.3.2. / / / / This SIB2 message is used to support a 3GPP feature that is known as VoLTE Access Class Barring skipping. / / / / It is aimed to ensure VoLTE voice services are still permitted, when network is barring certain access classes on LTE due to congestion. | 120 | M | Y |  |
| 2.14 | Does device support any proprietary feature similar in functionality to Access Class Barring skipping? If so provide details in the vendor comments column. |  | - | Q | Y |  |
| 3 | IMS Signalling and Features |  | - |  |  |  |
| 3.1 | Device shall follow the Session Initiated Protocol (SIP) registration procedures | SIP Call Establishment and Termination for VoLTE calls shall follow 3GPP 24.229 (ref #15) | 15,105 | M | Y |  |
| 3.2 | Device shall include IMS Communication Service Identifier (ICSI) value used to indicate the IMS Multimedia Telephony service |  | 1, 5, 28 | M | Y |  |
| 3.5 | Device shall follow the periodic registration timer info returned from IMS network. |  | 15, 60 | M | Y |  |
| 3.6 | In case IMS network doesn't return the re-register timer, device shall use own setting which should be configurable by operators. | Provide details of the applicable device setting and how it can be modified in the vendor comments section. | 15 | M | Y |  |
| 3.7 | Device should not send keep alive (NAT keep-alive) message to the IMS network during calls. | Network will perform this task | - | HD | Y |  |
| 3.7.2 | What is the device behaviour if device doesn’t receive IMS network keep alive message? Preferred behaviour is for the call to drop |  | - | Q | Y |  |
| 3.8 | Device shall perform IMS registration for VoLTE when power on in LTE coverage if VoLTE is supported on the HPLMN network |  | 15 | M | Y |  |
| 3.9 | Device shall not perform IMS registration for VoLTE outside LTE coverage |  | 15 | M | Y |  |
| 3.13 | Device shall support P-Access-Network-Info (PANI) header field with Cell ID information inserted (this shall be the current serving cell) | Shall support for originating and terminating calls as well as in Register requests sent over IPSec. | 15,61 | M | Y |  |
### MSR0942_VoWiFi_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
| 0.0.1 | Telstra Device ID | Telstra issued unique device Id for device referencing throughout the certification process. |  | Q |  |  |
| 1 | VoWiFi High Level Functional Requirements - General |  | - |  |  |  |
| 1.0 | IMS Voice capable devices, with WiFi, shall support VoWiFi | Note this requirement includes watches - exceptions may be made on a case by case basis | - | M | Y |  |
| 1.1 | Device shall support VoLTE |  | 1 | M | Y |  |
| 1.2 | Device shall support Telstra VoLTE requirements per latest version of MSR0920 |  | 4 | M | Y |  |
| 1.3 | Device shall support GSMA IR.51 IMS Profile for Voice, Video and SMS over Wi-Fi minimum Version 9. |  | 74 | M | Y |  |
| 1.3.1 | Detail which version of GSMA IR.51 is supported by the device in the Vendor Comment field. | Noting that before enabling R13 or later Emergency Calling features other than CNI please discuss with Telstra and ensure IOT testing is performed with Telstra prior to enabling. |  | Q | Y | IMS support IR.51 version is v12.0 |
| 1.4.1 | Vendor to provide details in vendor comments column of any Wi-Fi calling features in addition to those specified in IR.51 Version supported. |  | 42 | Q | Y | Support IR.51 |
| 1.4.2 | Device shall support VoWiFi Calling based on IMS voice over an untrusted network per 3GPP TS 23.402 Sections 4, 7 and 8 |  |  | M | Y |  |
| 1.5 | Device shall be configured to only allow VoWiFi calls (both MO and MT) when cellular signal strength and/or quality is not sufficient to support a good quality* cellular call and VoWiFi is capable of supporting a good quality call* | *Where good quality call is defined as MOS > 3.5._x000D_ / _x000D_ / Note the use of VoWiFi in flight mode is permitted. | - | M | Y |  |
| 1.5.1 | Vendor shall provide details on device LTE and WiFi signal and quality threshold settings and algorithms used to achieve requirement 1.5 | Specify all Wi-Fi and LTE signal strength, quality metric thresholds that are used by the device and values that they are set to. | - | Q | Y | WiFi idle / hnadover_in rssi= -75, / handover_out rssi = -82 / WiFi call / hnadover_in rssi= -70, / handover_out rssi = -75 / LTE handover_out rsrp = -118 dbm / LTE handover_in RSRP= -110 dBm |
| 1.6 | Device shall support seamless voice call handover from VoWifi to VoLTE when LTE can support voice call. | This refers to normal voice call, refer Section 13 for Emergency Call handover requirement. This applies to both MO (mobile originated) and MT (mobile terminated) cases. | 5 | M | Y |  |
| 1.6.1 | Device shall have a minimum WiFi signal strength threshold to handover from VoWiFi to LTE that meets requirement 1.5 |  |  | M | Y |  |
| 1.6.2 | Device shall have an WiFi signal quality threshold to move from VoWiFi to LTE that meets requirement 1.5 | This is to ensure that whilst WiFi signal strength may be sufficient for a good quality call that WiFi signal quality is also sufficient to support a good quality call (so if WiFi signal is subject to interference for instance there will be a trigger to move off WiFi if good call quality per requirement 1.5 cannot be maintained). Where a good quality call is defined as having a MOS > 3.5 |  | M | Y |  |
| 1.6.3 | Detail algorithm and signal strength & quality metric thresholds used to achieve this (including the values that they are set to). | It is mandatory to provide these answers | - | Q | Y | UE has a timer to avoid frequent ping pong for handover from W to L & L to W: / Idle state: / 30 se / wlan_rove_in_trtl_time = 15; / cell_rove_in_trtl_time = 15; / / In connected mode: / ipol_ims_rtp_wlan_qos_bkoff_t = 7sec / ipol_ims_rtp_cell_qos_bkoff_t = 7 sec / / Cell/LTE Quality metrics: / ipol_lte_rsrp_poor_th = -118; / ipol_lte_rsrp_fair_th = -110; / / Wifi Quality metrics: / Idle: / ipol_wlan_rssi_rove_poor_th = -82 / ipol_wlan_rssi_rove_fair_th = -75 / / Call: Hysterisis / ipol_wlan_rssi_ho_poor_th = -75 / ipol_wlan_rssi_ho_fair_th = -70 |
| 1.7 | Device shall support seamless voice call handover from VoLTE to VoWiFi when cellular signal strength and/or quality becomes sufficiently poor such that good quality* call cannot be supported on cellular. | This refers to normal voice call, refer Section 13 for Emergency Call handover requirement. This applies to both MO (mobile originated) and MT (mobile terminated) cases. *Where a good quality call is defined as having a MOS > 3.5 | 5 | M | Y |  |
| 1.7.1 | Device shall have a minimum LTE signal strength threshold to move from LTE to VoWifi that meets requirement 1.5 |  |  | M | Y |  |
| 1.7.2 | Device may have an LTE signal quality threshold to move from LTE to VoWiFi that meets requirement 1.5 | This is to ensure that whilst signal strength may be sufficient for a good quality call that quality is also sufficient to support a good quality call (so if LTE signal is subject to interference for instance there will be a trigger to move off LTE if good call quality per requirement 1.5 cannot be maintained). Where a good quality call is defined as having a MOS > 3.5 |  | O | Y |  |
| 1.7.3 | Detail algorithm and signal strength / quality metrics used to achieve this (including the values that they are set to). | It is mandatory to provide these answers | - | Q | Y | Call Priority Reselection/Handover from Cellular to WiFi Reselection/Handover from WiFi to Cellular / / / / WiFi_Preferred / / wifi_rssi_average >= WIFI_THRESHOLD_HIGH / / cellular_dbm_average >= CELLULAR_THRESHOLD_HIGH && wifi_rssi_average < WIFI_THRESHOLD_LOW / / / / Cellular_Preferred / / cellular_dbm_average <= CELLULAR_THRESHOLD_LOW && wifi_rssi_average >= WIFI_THRESHOLD_HIGH / / cellular_dbm_average >= CELLULAR_THRESHOLD_HIGH |
| 1.8 | Device shall have a means to assess quality of call when on WiFi and trigger handover off WiFi to cellular when good quality call cannot be maintained on WiFi (where good quality call is defined as MOS > 3.5) | Device need not measure MOS directly but have an internal mapping between chosen quality metric and MOS for instance. | - | M | Y |  |
| 1.8.1 | Device shall avoid unnecessary handovers between access types to ensure robust reliable calling. Describe algorithm to achieve this. |  | - | M | Y |  |
| 1.8.2 | Device shall ensure there is sufficient signal strength margin above adequate acceptable signal strength on the handover target technology to avoid a call dropout or poor voice quality when handing over in each direction (Wi-Fi to Cellular and Cellular to Wi-Fi) | Where adequate means that device can support a voice call of good quality (MOS > 3.5). It shall not be the lowest level that the device can support a voice call, but the lowest level at which device can reliably support a voice call |  | M | Y |  |
| 1.9 | Device shall support user interface option for user to switch VoWiFi capability on or off. |  | - | M | Y |  |
| 1.9.1 | Device VoWiFi calling switch shall be ON by default. | This shall also include the roaming case. | - | M | Y |  |
| 1.9.3.1 | Device shall follow SIP 503 message with network supplied retry interval rather than its own retry algorithm whilst on VoWiFi as per VoLTE |  | 49 | M | Y |  |
| 1.9.4 | Device shall not maintain IPSec tunnel to ePDG if it is not registered on VoWiFi. | Per R.2.2.1 , Item D of 3GPP TS24.229 "the IKEv2 security association and the IPsec ESP security association (tunnel) shall remain active throughout the period the UE is connected to the IM CN subsystem, i.e. from the initial registration and at least until the deregistration" and thus shall not be active when not registered. | 35 | M | Y |  |
| 1.9.5 | Device shall alert user of need to turn on Wi-Fi after switching Wi-Fi calling on, if Wi-Fi is not turned on. |  | - | M | Y |  |
| 1.10 | Device shall have a user interface indication when a voice call on Wi-Fi is possible. | User indication should be an icon. | - | M | Y |  |
| 1.10.1 | Device user interface shall indicate when a call is on Wi-Fi. |  | - | M | Y |  |
| 1.10.2 | Device VoWiFi icon shall not be the same as the device's VoLTE/VoNR indicator (if it has one) |  | - | M | Y |  |
| 1.11 | Device shall use same IMS stack for VoWiFi and VoLTE/VoNR calling |  | - | M | Y |  |
| 1.12 | Both Voice (VoWiFi) and Data shall be supported over Wi-Fi simultaneously. |  | - | M | Y |  |
| 1.13 | Device shall support the same SIP User Agent as specified in VoLTE MSR0920 |  | 4 | M | Y |  |
| 1.14 | VoWiFi calling shall support same codecs per VoLTE per MSR0920 |  | 4 | M | Y |  |
| 1.14.1 | If device supports EVS codec for VoLTE then it shall also support EVS codec for VoWiFi (per detailed EVS codec requirements in latest version of MSR0920) |  |  | M | Y |  |
### MSR0983_Band Combination_Ver83 - External Version (Final).xlsx

| Item | Description | Comments | Other Ref | Priority | Complies | Vendor Comments |
| --- | --- | --- | --- | --- | --- | --- |
|  | MSR0983 - Band Combinations |  |  |  |  |  |
|  | Note: band and feature enablement should refer to the latest version of MSR0295 pre-configuration requirements |  |  |  |  |  |
|  | LTE CA | Y |  |  |  |  |
|  | EN-DC with NR CA | N |  |  |  |  |
|  | SA CA | N |  |  |  |  |
|  | SA CA with mmW | N |  |  |  |  |
|  | LTE Carrier Aggregation Band Combinations |  |  |  |  |  |
|  | LTE CC | Vendor Response |  |  |  |  |
|  | Max LTE#CC | 2 |  |  |  |  |
|  | LTE DL Cat | 7 |  |  |  |  |
|  | LTE UL Cat | 13 |  |  |  |  |
|  | Max LTE#SS | 4 |  |  |  |  |
|  | LTE Uplink Support |  |  |  |  |  |
|  | Uplink Combo | Vendor Response | Vendor Comments (Exception Cases eg Max carriers limit) |  |  |  |
|  | CA_3C | Y |  |  |  |  |
|  | CA_7C | N |  |  |  |  |
|  | CA_1A-3A | N |  |  |  |  |
|  | CA_1A-7A | N |  |  |  |  |
|  | CA_1A-26A | N |  |  |  |  |
|  | CA_1A-28A | N |  |  |  |  |
|  | CA_3A-7A | N |  |  |  |  |
|  | CA_3A-26A | N |  |  |  |  |
|  | CA_3A-28A | N |  |  |  |  |
|  | CA_7A-26A | N |  |  |  |  |
|  | CA_7A-28A | N |  |  |  |  |
|  | EN-DC Band Combinations |  |  |  |  |  |
|  | NR Bands | Priority | Supported | Vendor Response | Max LTE Layers (in EN-DC) | Pcell For All LTE Bands |
|  | EN-DC with NR CA Band Combinations |  |  |  |  |  |
|  | NR CA | Priority | Supported | Vendor Response | Max LTE Layers (in EN-DC) | Pcell For All LTE Bands |
|  | Standalone Band Combinations |  |  |  |  |  |
|  | NR CA | Priority | Enabled | Band Support | Is Band Disabled? | Max DL #CC |
|  | NR-CA FR1+FR2 | O | N | N |  |  |
|  | FR1 Bandwidths |  |  |  |  |  |
|  | NR Bands | Bandwdiths (MHz) |  | Support (Y/N) | Vendor Comments |  |
|  | Other Band Combinations Supported |  |  |  |  |  |

## 备注

- MSR 资料覆盖 Telstra 通用终端、SIM、设备管理、LTE、IPv6、Wi-Fi、VoLTE、VoWiFi 和 Band Combination 要求。
- 本页保留需求表响应结果，后续配置落地仍需回到对应平台配置方法和目标分支产物确认。

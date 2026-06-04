---
doc_type: flow
domain: IMS
status: active
quality: imported_reference
search_tier: supplemental
---

# VoLTE-Call-AP日志流程

## 阅读入口

- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

## 阅读重点

- 这篇只保留 VoLTE 呼叫 AP 侧 log / framework / vendor IMS 调用链。
- 基础流程看 [[VoLTE-Call基础流程]]，modem 侧证据看 [[VoLTE-Call-Modem日志流程]]。

## **ZR VOLTE AP log**

**//打开volte**

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsServiceImpl.java
if (mDeviceVolteCapabilities.isCapable(MmTelCapabilities.CAPABILITY_TYPE_VOICE)) {
                logd("changeEnabledCapabilities-> setImsVoiceCallAvailability on");
                newVoLTESetting = ImsConfig.FeatureValueConstants.ON;
            } else {
                newVoLTESetting = ImsConfig.FeatureValueConstants.OFF;
            }
```

06-24 13:10:38.796  1830  1861 D ImsServiceImpl: \[1\] changeEnabledCapabilities-> setImsVoiceCallAvailability on

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsServiceImpl.java
private void setVoLTECallAvailablity() {
        if(currentVoLTESetting != IMS_INVALID_VOLTE_SETTING) {
            VoLTECallAvailSync = VoLTECallAvailSyncStatus.VOLTE_CALL_AVAIL_SYNC_ONGOING;

            logi("setVoLTECallAvailablity, currentVoLTESetting = " + currentVoLTESetting);
            mImsRadioInterface.setImsVoiceCallAvailability(currentVoLTESetting , mImsHandler.obtainMessage(EVENT_SET_VOICE_CALL_AVAILABILITY_DONE, currentVoLTESetting));
        }
    }
```

06-24 13:10:38.796  1830  1861 I ImsServiceImpl: \[1\] setVoLTECallAvailablity, currentVoLTESetting = 1

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsRadioInterface.java
public void
    setImsVoiceCallAvailability(int state, Message response) {
        ImsRadioServiceProxy radioProxy = getRadioServiceProxy(IMS_AIDL_SERVICE, response);
        if (!canMakeRequest("setImsVoiceCallAvailability", radioProxy, response, IMS_RADIO_HAL_VERSION_1_0)) {
            return;
        }
        RILRequest rr = obtainRequest(RIL_IMS_REQUEST_SET_VOICE_CALL_AVAILABILITY, response,
                                        mRILDefaultWorkSource);

        if (LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));

        radioServiceInvokeHelper(IMS_AIDL_SERVICE, rr, "setImsVoiceCallAvailability", () -> {
            radioProxy.setImsVoiceCallAvailability(rr.mSerial, state);
        });
    }
```

06-24 13:10:38.827  1830  1861 D ImsRIL  : \[0021\]> RIL_IMS_REQUEST_SET_VOICE_CALL_AVAILABILITY \[SUB0\]

**//下发"AT+CAVIMS=1"，配置ims通话是否可用**

```cpp
路径：system\A15\alps\vendor\sprd\tools\modem_simulator\unisoc_ims_service.cpp
/**
 * AT+CAVIMS=<state>
 * state: integer type.The UEs IMS voice call availability status
 * 0, Voice calls with the IMS are not available.
 * 1, Voice calls with the IMS are available.
 */
void ImsService::HandleSetVoiceCallAvailability(const Client& client, std::string& command) {
  std::vector<std::string> responses;
  std::stringstream ss;

  CommandParser cmd(command);
  cmd.SkipPrefix();

  if (*cmd == "AT+CAVIMS?") {
    ss << "+CAVIMS: " << ims_availability_status_;
    responses.push_back(ss.str());
  } else {
    int n = cmd.GetNextInt();
    switch (n) {
      case 0:
        ims_availability_status_ = 0;
        break;
      case 1:
        ims_availability_status_ = 1;
        break;
      default:
        client.SendCommandResponse(kCmeErrorInCorrectParameters);
        return;
    }
  }
  responses.push_back("OK");
  client.SendCommandResponse(responses);
}
```

06-24 13:10:38.833   737   767 D RIL-AT  : Channel1: AT> AT+CAVIMS?

06-24 13:10:38.834   737   882 D RIL-AT  : Channel1: AT< +CAVIMS:1

**//设置完成，发起回调**

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsServiceImpl.java
private void handleSetCallAbilityDone(AsyncResult ar) {
        /* UNISOC: modify for bug968317 @{ */
        if (ar.exception != null) {
            logi("EVENT_SET_VOICE_CALL_AVAILABILITY_DONE: exception "+ar.exception);
            logd("Set VoLTE Call Availability failure, currentVoLTESetting = " + currentVoLTESetting);
        }

        if (pendingVoLTESetting != IMS_INVALID_VOLTE_SETTING) {
            logi("set new VoLTESetting = " + pendingVoLTESetting);
            currentVoLTESetting = pendingVoLTESetting;
            setVoLTECallAvailablity();
            pendingVoLTESetting = IMS_INVALID_VOLTE_SETTING;
            return;
        }

        if (ar.exception != null) {
            VoLTECallAvailSync = VoLTECallAvailSyncStatus.VOLTE_CALL_AVAIL_SYNC_FAIL;
        } else {
            logi("EVENT_SET_VOICE_CALL_AVAILABILITY_DONE, currentVoLTESetting: " + currentVoLTESetting +
                " mImsRegister.mSimChanged: "+mImsRegister.mSimChanged);
            if (currentVoLTESetting == ImsConfig.FeatureValueConstants.ON
                    && mImsRegister.mSimChanged) {
                //mImsRegister.enableIms();
            }
            VoLTECallAvailSync  = VoLTECallAvailSyncStatus.VOLTE_CALL_AVAIL_SYNC_IDLE;
            currentVoLTESetting = IMS_INVALID_VOLTE_SETTING;
        }
        /*@}*/
    }
```

06-24 13:10:38.848  1830  1873 D ImsRIL  : \[0021\]< RIL_IMS_REQUEST_SET_VOICE_CALL_AVAILABILITY  \[SUB0\]

06-24 13:10:38.849  1830  1830 I ImsServiceImpl: \[1\] EVENT_SET_VOICE_CALL_AVAILABILITY_DONE, currentVoLTESetting: 1 mImsRegister.mSimChanged: false

**//收到 sim ready 广播后发起 initisim 并读取 CP NV**

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsServiceImpl.java
if (TelephonyIntents.ACTION_SIM_STATE_CHANGED.equals(action)) {
                        int phoneId = intent.getIntExtra(PhoneConstants.PHONE_KEY,
                                SubscriptionManager.DEFAULT_PHONE_INDEX);
                        String simState = intent.getStringExtra(IccCardConstants.INTENT_KEY_ICC_STATE);
                        logi("ImsServiceImpl iccReceiver->phoneId:"+phoneId +" simState:"+simState);
                        if (!SubscriptionManager.isValidPhoneId(phoneId) || phoneId != mPhoneId){
                            return;
                        }
```

06-24 13:10:43.496  1830  1830 I ImsServiceImpl: \[1\] ImsServiceImpl iccReceiver->phoneId:0 simState:READY

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsRegister.java
public void sendRecordsReadyEvent() {
        logi("sendRecordsReadyEvent > sim is ready");
        mCi.getVoLTEAllowedPLMN(mHandler.obtainMessage(EVENT_GET_VOLTE_ALLOWED_PLMN));
        mCi.getRTTAllowedPLMN(mHandler.obtainMessage(EVENT_GET_RTT_ALLOWED));
        mSIMReady = true;
        initISIM();
    }
```

06-24 13:10:43.598  1830  1830 I ImsRegister: \[0\] sendRecordsReadyEvent > sim is ready

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsRegister.java
private void initISIM() {
        boolean isRadioOn = isRadioOn();
        boolean isLteEnable = ImsService.getLTECapability(mServiceId, mContext);
        int simState = (mTelephonyManager != null) ?
                mTelephonyManager.getSimState(mPhoneId) : TelephonyManager.SIM_STATE_UNKNOWN;
        logi("initISIM() : mSIMReady = " + mSIMReady
                + " | mPhone.isRadioOn() = " + isRadioOn
                + " | simState = " + simState
                + " | mPhoneId = " + mPhoneId
                + " | isLteEnable = " + isLteEnable);
        if (mSIMReady && isRadioOn && !mInitISIMDone
                && simState == TelephonyManager.SIM_STATE_READY
                && isLteEnable) {
            mCi.initISIM(mHandler.obtainMessage(EVENT_INIT_ISIM_DONE));
        }
    }
```

06-24 13:10:43.637  1830  1830 I ImsRegister: \[0\] initISIM() : mSIMReady = true | mPhone.isRadioOn() = true | simState = 5 | mPhoneId = 0 | isLteEnable = true

```cpp
路径：vendor\sprd\modules\rild\libril\libril_uni\uni_ims_service.cpp
ScopedAStatus ImsRadio::getVoLTEAllowedPLMN(int32_t serial) {
#if VDBG
    RLOGD("getVoLTEAllowedPLMN: serial %d", serial);
#endif
    dispatchVoid(serial, mSlotId, RIL_IMS_REQUEST_GET_VOLTE_ALLOWED_PLMN);
    return ok();
}
```

06-24 13:10:43.625   737   737 D RILC_AIMS: getVoLTEAllowedPLMN: serial 33

```javascript
路径：vendor\sprd\modules\rild\impl-ril\impl_ril.c
int preProcessRequest(int request, void *data, size_t datalen, RIL_Token t,
                    RIL_SOCKET_ID socket_id) {
   ......

    RLOGD("onRequest: %s radioState = %s", requestToString(request),
            radioStateToString(s_radioState[socket_id]));

    if (s_isRadioUnavailable == true) {
        RLOGE("Radio unavailable");
        RIL_onRequestComplete(t, RIL_E_RADIO_NOT_AVAILABLE, NULL, 0);
        return -1;
    }
```

06-24 13:10:43.626   737   770 D RIL   : onRequest: GET_VOLTE_ALLOWED_PLMN radioState = RADIO_ON

**//获取volte plmn**

```cpp
路径：vendor\sprd\tools\modem_simulator\unisoc_ims_service.cpp
void ImsService::HandleGetVolteAllowedPlmn(const Client& client) {
  std::vector<std::string> responses;
  std::stringstream ss;

  ss << "+SPDLTNV: 1,1,1";
  responses.push_back(ss.str());
  responses.push_back("OK");
  client.SendCommandResponse(responses);
}
```

06-24 13:10:43.626   737   770 D RIL-AT  : Channel1: AT> AT+SPDLTNV?

06-24 13:10:43.628   737   882 D RIL-AT  : Channel1: AT< +SPDLTNV:0,1,1

**//拨打电话**

```java
路径：system\A15\alps\vendor\sprd\modules\imsservice\src\com\spreadtrum\ims\ImsRadioInterface.java
public void
    dial(String address, int clirMode, UUSInfo uusInfo, Message result) {
        ImsRadioServiceProxy radioProxy = getRadioServiceProxy(IMS_AIDL_SERVICE, result);
        if (!canMakeRequest("dial", radioProxy, result, IMS_RADIO_HAL_VERSION_1_0)) {
            return;
        }

        RILRequest rr = obtainRequest(RIL_IMS_REQUEST_DIAL, result,
                mRILDefaultWorkSource);

        if (LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));

        radioServiceInvokeHelper(IMS_AIDL_SERVICE, rr, "dial", () -> {
            radioProxy.dial(rr.mSerial, address, clirMode, uusInfo);
        });
    }
```

06-24 13:10:56.486  1830  7140 D ImsRIL  : \[0048\]> RIL_IMS_REQUEST_DIAL \[SUB0\]

```javascript
RLOGD("onRequest: %s radioState = %s", requestToString(request),
            radioStateToString(s_radioState[socket_id]));
```

06-24 13:10:56.489   737   767 D RIL   : onRequest: IMS_REQUEST_DIAL radioState = RADIO_ON

06-24 13:10:56.489   737   767 D RIL_REQ_THDS: get Channel1

06-24 13:10:56.489   737   767 D RIL-AT  : Channel1: AT> ATD18062077083;

06-24 13:10:56.496   737   882 D RIL-AT  : Channel1: AT< +CDU:1

06-24 13:10:56.496   737   882 E RIL   : Unsupported unsolicited response : +CDU:1

06-24 13:10:56.496   737   882 D RIL-AT  : Channel1: AT< OK

06-24 13:10:56.496   737   767 D RIL_REQ_THDS: put Channel1

06-24 13:10:56.501  1830  3215 D ImsRIL  : \[0048\]< RIL_IMS_REQUEST_DIAL  \[SUB0\]

**//呼叫中 ims voice**

06-24 13:10:56.790   737   882 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,2,1,0,18062077083,129,,,,0

06-24 13:10:56.798   737   882 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,2,1,0,18062077083,129

06-24 13:10:56.800   737   882 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,2,1,0,18062077083,129

**//收到lte驻网**

```java
private void handleServiceStateChange(ServiceState state) {
        if (state != null) {
            logi("handleSSChange -> DataRadioType:" + state.getRilDataRadioTechnology()
                    + ", DataRegState:" + state.getDataRegState());
            logd("handleSSChange -> mImsRegistered:" + mImsServiceState.mImsRegistered
                    + ", isVoLteEnabled:" + isVoLteEnabled()
                    + ", isVoLTERegistered:"
                    + ImsManagerEx.isVoLTERegisteredForPhone(mServiceId - 1));
```

06-24 13:10:58.437  1830  1830 I ImsServiceImpl: \[2\] handleSSChange -> DataRadioType:14, DataRegState:0

**//通话中**

06-24 13:11:02.847   737   882 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,0,1,0,18062077083,129

06-24 13:11:02.849   737   882 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,0,1,0,18062077083,129

**//挂断**

06-24 13:11:21.857   737   882 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,6,1,0,18062077083,129,,1200

## 来源记录

- [IMS Call流程](http://192.168.3.94:8888/doc/ims-call-b5HSCaTFMm) (`b5HSCaTFMm`)
- [视频通话流程](http://192.168.3.94:8888/doc/6keg6akr6yca6kd5rwb56il-hKcxT0jmnh) (`hKcxT0jmnh`)

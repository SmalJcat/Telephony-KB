---
doc_type: flow
domain: IMS
status: active
quality: imported_reference
search_tier: supplemental
---

# 视频通话界面与Log

## 阅读入口

- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

## 阅读重点

- 这篇保留视频通话界面状态、AP log 和 modem log 证据。
- MO/MT 入口分别看 [[视频通话拨号流程]]、[[视频通话来电流程]]。
- 若 modem 侧 SIP/RTP 正常但 UI 卡死，优先参考 [[Imported_Call_11_DUT视频通话卡死]] 的补证口径。
- 若 ViLTE 闪退且缺 QCI2 bearer，优先参考 [[Imported_Call_10_DUT视频通话闪退]]。

## 通话界面

//绑定通话界面

```java
路径：system\A15\alps\packages\services\Telecomm\src\com\android\server\telecom\InCallController.java
 protected void onConnected(IBinder service) {
      boolean shouldRemainConnected =
             InCallController.this.onConnected(mInCallServiceInfo, service,
                     getUserFromCall(mCall));
    if (!shouldRemainConnected) {
       // Sometimes we can opt to disconnect for certain reasons, like if the
       // InCallService rejected our initialization step, or the calls went away
       // in the time it took us to bind to the InCallService. In such cases, we go
       // ahead and disconnect ourselves.
       disconnect();
    }
 }
```

//将Call信息放入ParcelableCall中

```java
路径：system\A15\alps\packages\services\Telecomm\src\com\android\server\telecom\ParcelableCallUtils.java
    public static ParcelableCall toParcelableCall(
            Call call,
            boolean includeVideoProvider,
            PhoneAccountRegistrar phoneAccountRegistrar,
            boolean supportsExternalCalls,
            int overrideState,
            boolean includeRttCall,
            boolean isForSystemInCallService) {
        int state;
        if (overrideState == CALL_STATE_OVERRIDE_NONE) {
            state = getParcelableState(call, supportsExternalCalls);
        } else {
            state = overrideState;
        }
        int capabilities = convertConnectionToCallCapabilities(call.getConnectionCapabilities());
        int properties = convertConnectionToCallProperties(call.getConnectionProperties());
        int supportedAudioRoutes = call.getSupportedAudioRoutes();

        if (call.isConference()) {
            properties |= android.telecom.Call.Details.PROPERTY_CONFERENCE;
        }
        ...
```

```java

public void addCall(ParcelableCall call) {
     mHandler.obtainMessage(MSG_ADD_CALL, call).sendToTarget();
 }
```

//通过ParcelableCall更新telecom/call

```java
路径：system\A15\alps\frameworks\base\telecomm\java\android\telecom\Call.java
final void internalUpdate(ParcelableCall parcelableCall, Map<String, Call> callIdMap) {

        // First, we update the internal state as far as possible before firing any updates.
        Details details = Details.createFromParcelableCall(parcelableCall);
        boolean detailsChanged = !Objects.equals(mDetails, details);
        if (detailsChanged) {
            mDetails = details;
        }
        ...
```

//更新Videocall中得video state

```java
路径：system\A15\alps\frameworks\base\telecomm\java\android\telecom\VideoCallImpl.java
public void setVideoState(int videoState) {
        mVideoState = videoState;
    }
```

```java
 private void updateFromTelecomCall() {
    Trace.beginSection("DialerCall.updateFromTelecomCall");
    LogUtil.v("DialerCall.updateFromTelecomCall", telecomCall.toString());

    videoTechManager.dispatchCallStateChanged(telecomCall.getState(), getAccountHandle());

    final int translatedState = translateState(telecomCall.getState());
    if (state != DialerCallState.BLOCKED) {
      setState(translatedState);
      setDisconnectCause(telecomCall.getDetails().getDisconnectCause());
    }
```

//管理视频通话界面的显示和模式切换

```java
路径：system\A15\alps\packages\apps\Dialer\java\com\android\incallui\VideoCallPresenter.java
  private void onPrimaryCallChanged(DialerCall newPrimaryCall) {
    final boolean shouldShowVideoUi = shouldShowVideoUiForCall(newPrimaryCall);
    final boolean isVideoMode = isVideoMode();

    LogUtil.v(
        "VideoCallPresenter.onPrimaryCallChanged",
        "shouldShowVideoUi: %b, isVideoMode: %b",
        shouldShowVideoUi,
        isVideoMode);

    if (!shouldShowVideoUi && isVideoMode) {
      // Terminate video mode if new primary call is not a video call
      // and we are currently in video mode.
      LogUtil.i("VideoCallPresenter.onPrimaryCallChanged", "exiting video mode...");
      exitVideoMode();
    } else if (shouldShowVideoUi) {
      LogUtil.i("VideoCallPresenter.onPrimaryCallChanged", "entering video mode...");

      updateCameraSelection(newPrimaryCall);
      adjustVideoMode(newPrimaryCall);
    }
    checkForOrientationAllowedChange(newPrimaryCall);
  }
```


## ZR AP LOG

//发起视频通话请求

06-30 11:14:28.951 26146 26146 I Dialer  : InCallActivity.getShouldShowVideoUi - upgrading to video

06-30 11:14:28.952  1130  1130 I Telecom : Call: maybeEnableSpeakerForVideoCall; callId=%s, auto-enable speaker for call upgraded to video.

06-30 11:14:28.977   702   729 D RIL-AT  : Channel1: AT> AT+CCMMD=1,2,"m=video"

06-30 11:14:28.978   702   933 D RIL-AT  : Channel1: AT< OK06-30 11:14:28.977   702   729 D RIL-AT  : Channel1: AT> AT+CCMMD=1,2,"m=video"

06-30 11:14:28.978   702   933 D RIL-AT  : Channel1: AT< OK


## ZR MODEM LOG

\-> \[0\]INVITE 11:14:16.769 **发起volte通话**

<- \[0\]100 11:14:16.848

<- ACTIVATE_DEDICATED_EPS_BEARER_CONTEXT_REQUEST 11:14:16.957 **建立第一个承载**

\-> ACTIVATE_DEDICATED_EPS_BEARER_CONTEXT_ACCEPT 11:14:16.958

<- \[0\]183 11:14:17.840

<- \[0\]180 11:14:18.607

<- \[0\]200 11:14:22.767

\-> \[0\]ACK 11:14:22.772

\-> \[0\]INVITE 11:14:29.148 **发起vilte通话**

<- \[0\]100 11:14:29.214

<- \[0\]200 11:14:33.125

Time: 16391402 prd SIP codec codex\[0\],pt=104,codecName:H264  11:14:33.128 **video codec**

\-> \[0\]ACK 11:14:33.131

<- ACTIVATE_DEDICATED_EPS_BEARER_CONTEXT_REQUEST  11:14:33.170 **建立第二个承载**

\-> ACTIVATE_DEDICATED_EPS_BEARER_CONTEXT_ACCEPT 11:14:33.171

\-> \[0\]BYE 11:14:47.909

<- \[0\]200 11:14:48.088

## 来源记录

- [IMS Call流程](http://192.168.3.94:8888/doc/ims-call-b5HSCaTFMm) (`b5HSCaTFMm`)
- [视频通话流程](http://192.168.3.94:8888/doc/6keg6akr6yca6kd5rwb56il-hKcxT0jmnh) (`hKcxT0jmnh`)

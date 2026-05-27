---
doc_type: flow
domain: Call
status: active
quality: imported_reference
---

# CS-Call流程补充资料

## 阅读顺序

- 先看入口触发，再看 AP 到 modem 的消息链路，再看协议层关键消息，最后看状态同步和异常分支。
- 厂商客制化需要记录开关来源、默认值、配置路径、log 关键字和回退条件。
- 本文作为流程补充，主线结论仍优先沉淀到对应业务流程文档。

迁入 CS Call / ECC Call 代码和流程补充。

> 图片已保存为本地附件；非图片附件仍保留原 Outline 链接作为资料索引。

## CS Call流程

### 前言

//跟踪和管理 GSM/CDMA 网络的呼叫状态

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaCallTracker.java
public GsmCdmaCallTracker(GsmCdmaPhone phone, FeatureFlags featureFlags) {
        super(featureFlags);

        if (TelephonyCapabilities.minimalTelephonyCdmCheck(mFeatureFlags)
                && !phone.getContext().getPackageManager().hasSystemFeature(
                    PackageManager.FEATURE_TELEPHONY_CALLING)) {
            throw new UnsupportedOperationException("GsmCdmaCallTracker requires calling");
        }

        this.mPhone = phone;
        mCi = phone.mCi;
        mCi.registerForCallStateChanged(this, EVENT_CALL_STATE_CHANGE, null);
        mCi.registerForOn(this, EVENT_RADIO_AVAILABLE, null);
        mCi.registerForNotAvailable(this, EVENT_RADIO_NOT_AVAILABLE, null);

        // Register receiver for ECM exit
        IntentFilter filter = new IntentFilter();
        filter.addAction(TelephonyIntents.ACTION_EMERGENCY_CALLBACK_MODE_CHANGED);
        mPhone.getContext().registerReceiver(mEcmExitReceiver, filter);

        updatePhoneType(true);
    }
```

//电话状态变化的回调

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\RadioIndication.java
public void callStateChanged(int indicationType) {
        mRil.processIndication(HAL_SERVICE_RADIO, indicationType);

        if (mRil.isLogOrTrace()) mRil.unsljLog(RIL_UNSOL_RESPONSE_CALL_STATE_CHANGED);

        mRil.mCallStateRegistrants.notifyRegistrants();
    }
```

//处理相关电话事件

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaCallTracker.java
public void handleMessage(Message msg)
```

//处理无线通信（如GSM/CDMA）中呼叫状态轮询结果的同步方法，主要负责同步本地连接状态与网络侧（RIL）的呼叫状态，处理连接的新增、断开、切换等事件，并通知上层组件状态变化

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaCallTracker.java
protected synchronized void handlePollCalls(AsyncResult ar)
```

//调用 `mCi.getCurrentCalls(mLastRelevantPoll)` 向 RIL 发起当前呼叫状态查询请求

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaCallTracker.java
private void operationComplete() {
        mPendingOperations--;

        if (DBG_POLL) log("operationComplete: pendingOperations=" +
                mPendingOperations + ", needsPoll=" + mNeedsPoll);

        if (mPendingOperations == 0 && mNeedsPoll) {
            mLastRelevantPoll = obtainMessage(EVENT_POLL_CALLS_RESULT);
            mCi.getCurrentCalls(mLastRelevantPoll);
        } else if (mPendingOperations < 0) {
            // this should never happen
            Rlog.e(LOG_TAG,"GsmCdmaCallTracker.pendingOperations < 0");
            mPendingOperations = 0;
        }
    }
```

//更新 `GsmCdmaCall`（GSM/CDMA 呼叫）的状态信息（号码、音频质量等）

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaConnection.java
public boolean
    update (DriverCall dc) {}
```

//根据DriverCall状态获取对应GsmCdmaCall

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaConnection.java
private GsmCdmaCall
    parentFromDCState (DriverCall.State state) {
        switch (state) {
            case ACTIVE:
            case DIALING:
            case ALERTING:
                return mOwner.mForegroundCall;
            //break;

            case HOLDING:
                return mOwner.mBackgroundCall;
            //break;

            case INCOMING:
            case WAITING:
                return mOwner.mRingingCall;
            //break;

            default:
                throw new RuntimeException("illegal call state: " + state);
        }
    }
```

//更新GsmCdmaCall状态

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaCall.java
public void detach(GsmCdmaConnection conn) {
        removeConnection(conn);

        if (getConnectionsCount() == 0) {
            mState = State.IDLE;
        }
    }
public void attach(Connection conn, DriverCall dc) {
        addConnection(conn);

        mState = stateFromDCState (dc.state);
    }
```

### ZR AP LOG

**//cs call**

```java
路径：system\A15\alps\frameworks\opt\telephony\src\java\com\android\internal\telephony\GsmCdmaPhone.java
// Check for service before placing non emergency CS voice call.
// Allow dial only if either CS is camped on any RAT (or) PS is in LTE/NR service.
        if (mSST != null
                && mSST.mSS.getState() == ServiceState.STATE_OUT_OF_SERVICE /* CS out of service */
                && !(mSST.mSS.getDataRegistrationState() == ServiceState.STATE_IN_SERVICE
                && ServiceState.isPsOnlyTech(
                        mSST.mSS.getRilDataRadioTechnology())) /* PS not in LTE/NR */
                && !VideoProfile.isVideo(dialArgs.videoState) /* voice call */
                && !isEmergency /* non-emergency call */
                /* If config_allow_ussd_over_ims is false, USSD is sent over the CS pipe instead */
                && !isPotentialUssdCode
                /* in 5g UNISOC: add for bug1622896 */
                && !(mSST.mSS.getDataNetworkType() == TelephonyManager.NETWORK_TYPE_NR)) {
            throw new CallStateException(
                CallStateException.ERROR_OUT_OF_SERVICE,
                "cannot dial voice call in out of service");
        }
        if (DBG) logd("Trying (non-IMS) CS call");
```

07-11 15:16:41.657  1459  1459 D GsmCdmaPhone: \[0\] Trying (non-IMS) CS call

07-11 15:16:41.705  1459  1459 D RILJ   : \[2859\]> DIAL \[PHONE0\]

07-11 15:16:41.706   761   876 D RIL-AT  : Channel1: AT< OK

07-11 15:16:41.774  1459  1459 D GsmCdmaCallTracker: \[0\] update phone state, old=IDLE new=OFFHOOK

07-11 15:16:41.776   761   774 D RIL   : onRequest: DIAL radioState = RADIO_ON

**//下发拨号命令**

07-11 15:16:41.776   761   774 D RIL-AT  : Channel1: AT> ATD18062077083;

**//call info**

07-11 15:16:41.783   761   876 D RIL-AT  : Channel0: AT< ^DSCI: 1,0,2,0,0,18062077083,129,,,,0

### ZR MODEM LOG

**//下发拨号命令**

Time: 1598925 ATC: ATC_RecNewLineSig,link_id:2,sim:0,len:16,line:ATD18062077083;	15:16:50.418

\-> CM_SERVICE_REQUEST	15:16:50.419	cm_service_type = 0x1:Normal call establishment

\-> SETUP	15:16:52.074	MO call setup

**//接收到请求的呼叫建立信息**

<- CALL_PROCEEDING	15:16:53.015

**//响铃**

<- ALERTING	 15:16:57.924

**//接受呼叫**

<- CONNECT	15:17:02.324

**//电话完全接通**

\-> CONNECT_ACKNOWLEDGE	15:17:02.324

**//MO 挂断**

\-> DISCONNECT	15:17:21.642

<- RELEASE	15:17:21.847

**//电话完全挂断**

\-> RELEASE_COMPLETE	 15:17:21.847

## 来源记录

- [CS Call流程](http://192.168.3.94:8888/doc/cs-call-fxNUW7PlGM) (`fxNUW7PlGM`)

---
doc_type: flow
domain: IMS
status: active
quality: imported_reference
search_tier: supplemental
---

# VoLTE-Call基础流程

## 阅读入口

- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

## 阅读重点

- 这篇保留 VoLTE Call 的基础调用链和关键类。
- AP log 证据看 [[VoLTE-Call-AP日志流程]]，modem log 证据看 [[VoLTE-Call-Modem日志流程]]。

## **VOLTE CALL**

PhoneApp进程是在系统开机时启动的，Phone进程初始化，在创建GSMPhone或者CDMAPhone之后，会执行监控IMS Service的流程，在PhoneFactory.Java的makeDefaultPhone()方法中：

路径：system\\A15\\alps\\frameworks\\opt\\telephony\\src\\java\\com\\android\\internal\\telephony\\PhoneFactory.java

//获取当前设备支持的sim卡数量
`int numPhones = TelephonyManager.getDefault().getActiveModemCount();`

//为每个sim卡创建RIL实例

```java
for (int i = 0; i < numPhones; i++) {
 // reads the system properties and makes commandsinterface
 // Get preferred network type.
 networkModes[i] = RILConstants.PREFERRED_NETWORK_MODE;
 Rlog.i(LOG_TAG, "Network Mode set to " + Integer.toString(networkModes[i]));
 sCommandsInterfaces[i] = new RIL(context,
 RadioAccessFamily.getRafFromNetworkType(networkModes[i]),
 cdmaSubscription, i, featureFlags);
 }
```

//管理sim卡相关操作
`sUiccController = UiccController.make(context);`

//初始化sim卡订阅服务

```java
sSubscriptionManagerService = new SubscriptionManagerService(context,
  Looper.myLooper(), featureFlags);
```

//为每个sim卡创建一个phone对象

```java
for (int i = 0; i < numPhones; i++) {
    sPhones[i] = createPhone(context, i);
}
```

//若支持ims，则创建ims phone对象。必须要在已有default phone对象才能开始监控ims服务

```java
if (context.getPackageManager().hasSystemFeature(
      PackageManager.FEATURE_TELEPHONY_IMS)) {
    // Start monitoring after defaults have been made.
    // Default phone must be ready before ImsPhone is created because ImsService
    // might need it when it is being opened.
    for (int i = 0; i < numPhones; i++) {
        sPhones[i].createImsPhone();
    }
  } else {
       Rlog.i(LOG_TAG, "IMS is not supported on this device, skipping ImsResolver.");
}
```

//处理数据连接

```java
for (int i = 0; i < numPhones; i++) {
   sTelephonyNetworkFactories[i] = new TelephonyNetworkFactory(
   Looper.myLooper(), sPhones[i], featureFlags);
}
```

路径：system\\A15\\alps\\frameworks\\opt\\telephony\\src\\java\\com\\android\\internal\\telephony\\Phone.java

//若当前通话为sip，则直接返回，因为sip基于IP，不需要创建ims通话；检查是否存在ims phone实例，若无则创建，并注册到CallManager；设置静默重拨事件处理，增强呼叫可靠性

```java
public void createImsPhone() {
        if (getPhoneType() == PhoneConstants.PHONE_TYPE_SIP) {
            return;
        }

        synchronized(Phone.lockForRadioTechnologyChange) {
            if (mImsPhone == null) {
                mImsPhone = PhoneFactory.makeImsPhone(mNotifier, this);
                CallManager.getInstance().registerPhone(mImsPhone);
                mImsPhone.registerForSilentRedial(
                        this, EVENT_INITIATE_SILENT_REDIAL, null);
            }
        }
    }
```

//当基于IMS的呼叫失败时，系统会自动尝试通过传统的GSM/CDMA网络重新拨号

```java
case EVENT_INITIATE_SILENT_REDIAL:
       // This is an ImsPhone -> GsmCdmaPhone redial
       // See ImsPhone#initiateSilentRedial
      Rlog.d(mLogTag, "Event EVENT_INITIATE_SILENT_REDIAL Received");
      ar = (AsyncResult) msg.obj;
      if ((ar.exception == null) && (ar.result != null)) {
      SilentRedialParam result = (SilentRedialParam) ar.result;
      String dialString = result.dialString;
      int causeCode = result.causeCode;
      DialArgs dialArgs = result.dialArgs;
      if (TextUtils.isEmpty(dialString)) return;
        try {
             Connection cn = dialInternal(dialString, dialArgs);
             // The ImsPhoneConnection that is owned by the ImsPhone is currently the
             // one with a callback registered to TelephonyConnection. Notify the
             // redial happened over that Phone so that it can be replaced with the
             // new GSM/CDMA Connection.
             Rlog.d(mLogTag, "Notify redial connection changed cn: " + cn);
             if (mImsPhone != null) {
               // Don't care it is null or not.
                  mImsPhone.notifyRedialConnectionChanged(cn);
                 }
             } catch (CallStateException e) {
                  Rlog.e(mLogTag, "silent redial failed: " + e);
                  if (mImsPhone != null) {
                      mImsPhone.notifyRedialConnectionChanged(null);
                  }
             }
        }
        break;
```

路径：system\\A15\\alps\\frameworks\\opt\
et\\ims\\src\\java\\com\\android\\ims\\ImsManager.java

//ImsManager 向 UI 层提供 setEnhanced4gLteModeSetting()用以实现用户开启或者关闭 VoLTE 功能。如 支持则按照传入参数设置 VoLTE 开关功能，否则按照默认状态设置 VoLTE 开关功能

```java
public void setEnhanced4gLteModeSetting(boolean enabled) {
        if (enabled && !isVolteProvisionedOnDevice()) {
            log("setEnhanced4gLteModeSetting: Not possible to enable VoLTE due to provisioning.");
            return;
        }
```

//原生 ImsManager 提供了设置 VoLTE 开关的接口方法 setEnhanced4gLteModeSetting()，该方法中读取 CarrierConfigManager.KEY_EDITABLE_ENHANCED_4G_LTE_BOOL 和CarrierConfigManager.KEY_HIDE_ENHANCED_4G_LTE_BOOL 配置进行判断。如当前

KEY_EDITABLE_ENHANCED_4G_LTE_BOOL 为 false，或者

KEY_HIDE_ENHANCED_4G_LTE_BOOL 为 true，则VoLTE开关功能不可用，该接口直接将 VoLTE 开关状态设置CarrierConfigManager.KEY_ENHANCED_4G_LTE_ON_BY_DEFAULT_BOOL保存的默认值。

```java
boolean isUiUnEditable =
    !getBooleanCarrierConfig(CarrierConfigManager.KEY_EDITABLE_ENHANCED_4G_LTE_BOOL) ||
    getBooleanCarrierConfig(CarrierConfigManager.KEY_HIDE_ENHANCED_4G_LTE_BOOL);
```

//启用时，更新voice和vedio值，打开ims功能；禁用时，重新评估所有能力

```java
try {
      if (enabled) {
        CapabilityChangeRequest request = new CapabilityChangeRequest();
        boolean isNonTty = isNonTtyOrTtyOnVolteEnabled();
        // This affects voice and video enablement
        updateVoiceCellFeatureValue(request, isNonTty);
        updateVideoCallFeatureValue(request, isNonTty);
        changeMmTelCapability(request);
         // Ensure IMS is on if this setting is enabled.
         turnOnIms();
       } else {
            // This may trigger entire IMS interface to be disabled, so recalculate full state.
            reevaluateCapabilities();
         }
    } catch (ImsException e) {
       loge("setEnhanced4gLteModeSetting couldn't set config: " + e);
  }
```

## 来源记录

- [IMS Call流程](http://192.168.3.94:8888/doc/ims-call-b5HSCaTFMm) (`b5HSCaTFMm`)
- [视频通话流程](http://192.168.3.94:8888/doc/6keg6akr6yca6kd5rwb56il-hKcxT0jmnh) (`hKcxT0jmnh`)

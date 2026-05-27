---
doc_type: code_reference
domain: Platform-Code
status: active
quality: imported_reference
---

# Android国内卡模拟运营商

## 阅读入口

- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

## 定位入口

- 先切清模块边界：Android Framework、RIL、厂商服务、modem、配置资源。
- 再补齐代码路径、开关来源、log 关键字、编译产物和运行时验证方式。
- 本文图片已转成本地附件；非图片附件仍保留原 Outline 链接作为资料索引。

通过 Android 侧模拟运营商 MCC/MNC/CarrierConfig/APN 的实现思路。

> 图片已保存为本地附件；非图片附件仍保留原 Outline 链接作为资料索引。

## **问题背景**

在Android项目的开发过程中，我们常常遇到一些运营商的需求，例如运营商的CarrierConfig需求、APN需求等，我们通常需要使用写卡工具对白卡写参数来验证这些需求，但写卡工具和白卡比较稀缺，可能资源经常被占用，但普通的国内卡或者无效卡我们基本上都有，若可以通过国内卡模拟国外的一些运营商，那此问题就得到迎刃而解。


## **问题实现**

其实在Android源码中，已有这种操作，可实现将国内卡模拟成其他运营商卡，不过此模拟效果仅在AP侧生效，若需要验证CP侧的需求，则仍然需要白卡才可以实现。此处需要使用userdebug软件才可以实现模拟卡的操作。


### **操作步骤**

#### **1、新建carrier_test_conf.xml文件**

A14后需要使用这个文件名：`carrier_test_conf_sim0.xml`

```java
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<carrierTestOverrides>
       <carrierTestOverride key="isInTestMode" value="true"/>
       <carrierTestOverride key="mccmnc" value="64502" />
       <carrierTestOverride key="gid1" value="ffffffffffffffff"/>
       <carrierTestOverride key="gid2" value="ffffffffffffffff"/>
       <carrierTestOverride key="imsi" value="6450212345678901"/>
       <carrierTestOverride key="spn" value=""/>
       <carrierTestOverride key="pnn" value=""/>
       <carrierTestOverride key="iccid" value="103456789012345678901"/>
</carrierTestOverrides>
```

其中isInTestMode表示当前是否为测试模式，需配置为true才能实现模拟。

其他的如mccmnc，imsi，iccid等均可以按照个人的要求进行配置。


> **信息**
> 有文件快捷操作步骤如下：
>
> ```java
> adb root && adb push carrier_test_conf_sim0.xml data/user_de/0/com.android.phone/files/ && adb shell pkill -f com.android.phone
> ```
>


**2、将carrier_test_conf.xml文件push到指定路径**

```java
adb push carrier_test_conf.xml data/user_de/0/com.android.phone/files/
adb push carrier_test_conf_sim0.xml data/user_de/0/com.android.phone/files/
```

#### **3、对设备进行root**

```java
adb root
```

#### **4、重启设备phone进程**

使用adb shell ps | grep phone获取到phone进程的pid

```java
adb shell ps | grep phone
radio         1274   473 1123372 107944 do_epoll_wait       0 S com.android.phone
```

此处获取到com.android.phone进程的pid为1274，使用adb shell kill 1274

```java
adb shell kill 1274
```

#### **5、carrier的配置生效**

此时我们会发现我们的SIM卡会重新读取，通过查看CarrierConfig配置可以发现生成对应模拟运营商的CarrierConfig配置文件。

```java
xjx@xjx-ThinkStation-P340:~$ adb shell
NVA:/ # cd data/user_de/0/com.android.phone/files/
NVA:/data/user_de/0/com.android.phone/files # ls
carrier_test_conf.xml
carrierconfig-com.android.carrierconfig-123456789012345678901-1338.xml
carrierconfig-com.android.carrierconfig-89860121801668091974-1436.xml
carrierconfig-com.android.carrierconfig-sub-89860121801668091974-1338.xml
carrierconfig-com.android.carrierconfig-sub-89860121801668091974-1436.xml
carrierconfig-com.android.carrierconfig-vendor---1.xml
persist_atoms.pb
NVA:/data/user_de/0/com.android.phone/files #
```

```java
adb pull /data/user_de/0/com.android.phone/files
```

同时查看其APN，也是对应运营商的APN参数，此时我们已经模拟成功。

#### **6、还原模拟卡的配置**

若我们不需要模拟卡，需将原始的联通卡还原，则我们需删除push的文件和新生成的CarrierConfig文件并重启phone进程即可。

```java
xjx@xjx-ThinkStation-P340:~$ adb shell
NVA:/ # cd data/user_de/0/com.android.phone/files
NVA:/data/user_de/0/com.android.phone/files # ls
carrier_test_conf.xml                                                      carrierconfig-com.android.carrierconfig-sub-89860121801668091974-1436.xml
carrierconfig-com.android.carrierconfig-123456789012345678901-1338.xml     carrierconfig-com.android.carrierconfig-vendor---1.xml
carrierconfig-com.android.carrierconfig-89860121801668091974-1436.xml      persist_atoms.pb
carrierconfig-com.android.carrierconfig-sub-89860121801668091974-1338.xml
NVA:/data/user_de/0/com.android.phone/files # rm -rf carrier_test_conf.xml
NVA:/data/user_de/0/com.android.phone/files # rm -rf carrierconfig-com.android.carrierconfig-123456789012345678901-1338.xml
NVA:/data/user_de/0/com.android.phone/files # rm -rf carrierconfig-com.android.carrierconfig-sub-89860121801668091974-1338.xml
NVA:/data/user_de/0/com.android.phone/files # ls
carrierconfig-com.android.carrierconfig-89860121801668091974-1436.xml      carrierconfig-com.android.carrierconfig-vendor---1.xml
carrierconfig-com.android.carrierconfig-sub-89860121801668091974-1436.xml  persist_atoms.pb
NVA:/data/user_de/0/com.android.phone/files #
```

## **实现原理**

alps/frameworks/opt/telephony/src/java/com/android/internal/telephony/uicc/CarrierTestOverride.java
在Android源码中CarrierTestOverride的类可以针对运营商进行模拟，具体代码如下。

```java
/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony.uicc;

import android.os.Environment;
import android.util.Xml;

import com.android.internal.telephony.util.XmlUtils;
import com.android.telephony.Rlog;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

/**
 * Provide a machanism to override MVNO paramteres under CarrierConfig through a config file.
 */
public class CarrierTestOverride {
    static final String LOG_TAG = "CarrierTestOverride";

    /**
     * Config file that can be created and adb-pushed by tester/developer
     *
     * Sample xml:
     * <carrierTestOverrides>
       <carrierTestOverride key="isInTestMode" value="true"/>
       <carrierTestOverride key="mccmnc" value="310010" />
       <carrierTestOverride key="gid1" value="bae0000000000000"/>
       <carrierTestOverride key="gid2" value="ffffffffffffffff"/>
       <carrierTestOverride key="imsi" value="310010123456789"/>
       <carrierTestOverride key="spn" value="Verizon"/>
       <carrierTestOverride key="pnn" value="Verizon network"/>
       <carrierTestOverride key="iccid" value="123456789012345678901"/>
       </carrierTestOverrides>
     */
    static final String DATA_CARRIER_TEST_OVERRIDE_PATH =
            "/user_de/0/com.android.phone/files/carrier_test_conf.xml";
    static final String CARRIER_TEST_XML_HEADER = "carrierTestOverrides";
    static final String CARRIER_TEST_XML_SUBHEADER = "carrierTestOverride";
    static final String CARRIER_TEST_XML_ITEM_KEY = "key";
    static final String CARRIER_TEST_XML_ITEM_VALUE = "value";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_ISINTESTMODE = "isInTestMode";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_MCCMNC = "mccmnc";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_GID1 = "gid1";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_GID2 = "gid2";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_IMSI = "imsi";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_SPN = "spn";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_PNN = "pnn";
    static final String CARRIER_TEST_XML_ITEM_KEY_STRING_ICCID = "iccid";

    private HashMap<String, String> mCarrierTestParamMap;

    CarrierTestOverride() {
        mCarrierTestParamMap = new HashMap<String, String>();
        loadCarrierTestOverrides();
    }

    boolean isInTestMode() {
        return mCarrierTestParamMap.containsKey(CARRIER_TEST_XML_ITEM_KEY_STRING_ISINTESTMODE)
                && mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_ISINTESTMODE)
                .equals("true");
    }

    String getFakeSpn() {
        try {
            String spn = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_SPN);
            Rlog.d(LOG_TAG, "reading spn from CarrierTestConfig file: " + spn);
            return spn;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No spn in CarrierTestConfig file ");
            return null;
        }
    }

    String getFakeIMSI() {
        try {
            String imsi = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_IMSI);
            Rlog.d(LOG_TAG, "reading imsi from CarrierTestConfig file: " + imsi);
            return imsi;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No imsi in CarrierTestConfig file ");
            return null;
        }
    }

    String getFakeGid1() {
        try {
            String gid1 = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_GID1);
            Rlog.d(LOG_TAG, "reading gid1 from CarrierTestConfig file: " + gid1);
            return gid1;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No gid1 in CarrierTestConfig file ");
            return null;
        }
    }

    String getFakeGid2() {
        try {
            String gid2 = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_GID2);
            Rlog.d(LOG_TAG, "reading gid2 from CarrierTestConfig file: " + gid2);
            return gid2;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No gid2 in CarrierTestConfig file ");
            return null;
        }
    }

    String getFakePnnHomeName() {
        try {
            String pnn = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_PNN);
            Rlog.d(LOG_TAG, "reading pnn from CarrierTestConfig file: " + pnn);
            return pnn;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No pnn in CarrierTestConfig file ");
            return null;
        }
    }

    String getFakeIccid() {
        try {
            String iccid = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_ICCID);
            Rlog.d(LOG_TAG, "reading iccid from CarrierTestConfig file: " + iccid);
            return iccid;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No iccid in CarrierTestConfig file ");
            return null;
        }
    }

    String getFakeMccMnc() {
        try {
            String mccmnc = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_MCCMNC);
            Rlog.d(LOG_TAG, "reading mccmnc from CarrierTestConfig file: " + mccmnc);
            return mccmnc;
        } catch (NullPointerException e) {
            Rlog.w(LOG_TAG, "No mccmnc in CarrierTestConfig file ");
            return null;
        }
    }

    void override(String mccmnc, String imsi, String iccid, String gid1, String gid2, String pnn,
            String spn) {
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_ISINTESTMODE, "true");
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_MCCMNC, mccmnc);
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_IMSI, imsi);
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_ICCID, iccid);
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_GID1, gid1);
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_GID2, gid2);
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_PNN, pnn);
        mCarrierTestParamMap.put(CARRIER_TEST_XML_ITEM_KEY_STRING_SPN, spn);
    }

    private void loadCarrierTestOverrides() {

        FileReader carrierTestConfigReader;

        File carrierTestConfigFile = new File(Environment.getDataDirectory(),
                DATA_CARRIER_TEST_OVERRIDE_PATH);

        try {
            carrierTestConfigReader = new FileReader(carrierTestConfigFile);
            Rlog.d(LOG_TAG, "CarrierTestConfig file Modified Timestamp: "
                    + carrierTestConfigFile.lastModified());
        } catch (FileNotFoundException e) {
            Rlog.w(LOG_TAG, "Can not open " + carrierTestConfigFile.getAbsolutePath());
            return;
        }

        try {
            XmlPullParser parser = Xml.newPullParser();
            parser.setInput(carrierTestConfigReader);

            XmlUtils.beginDocument(parser, CARRIER_TEST_XML_HEADER);

            while (true) {
                XmlUtils.nextElement(parser);

                String name = parser.getName();
                if (!CARRIER_TEST_XML_SUBHEADER.equals(name)) {
                    break;
                }

                String key = parser.getAttributeValue(null, CARRIER_TEST_XML_ITEM_KEY);
                String value = parser.getAttributeValue(null, CARRIER_TEST_XML_ITEM_VALUE);

                Rlog.d(LOG_TAG,
                        "extracting key-values from CarrierTestConfig file: " + key + "|" + value);
                mCarrierTestParamMap.put(key, value);
            }
            carrierTestConfigReader.close();
        } catch (XmlPullParserException e) {
            Rlog.w(LOG_TAG, "Exception in carrier_test_conf parser " + e);
        } catch (IOException e) {
            Rlog.w(LOG_TAG, "Exception in carrier_test_conf parser " + e);
        }
    }
}
```

其中loadCarrierTestOverrides方法会加载相关的override的文件，即DATA_CARRIER_TEST_OVERRIDE_PATH

```java
static final String DATA_CARRIER_TEST_OVERRIDE_PATH =
        "/user_de/0/com.android.phone/files/carrier_test_conf.xml";
```

在上述的模拟步骤中的文件名来源于此，且其提供了该文件的样例代码。
其中可以看到一些常用的获取gid1以及mccmnc的方法，在系统中会先获取TestMode再决定是否要获取FakeXXX的内容，即我们模拟卡的信息

```java
String getFakeGid1() {
       try {
           String gid1 = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_GID1);
           Rlog.d(LOG_TAG, "reading gid1 from CarrierTestConfig file: " + gid1);
           return gid1;
       } catch (NullPointerException e) {
           Rlog.w(LOG_TAG, "No gid1 in CarrierTestConfig file ");
           return null;
       }
   }

   String getFakeMccMnc() {
       try {
           String mccmnc = mCarrierTestParamMap.get(CARRIER_TEST_XML_ITEM_KEY_STRING_MCCMNC);
           Rlog.d(LOG_TAG, "reading mccmnc from CarrierTestConfig file: " + mccmnc);
           return mccmnc;
       } catch (NullPointerException e) {
           Rlog.w(LOG_TAG, "No mccmnc in CarrierTestConfig file ");
           return null;
       }
   }
```

alps/frameworks/opt/telephony/src/java/com/android/internal/telephony/uicc/IccRecords.java
其中在IccRecords中可以看到在判断isInTestMode后会获取相应的FakeXXX的信息，以此来实现将运营商信息进行Override的需求，我们也是通过系统的此机制来进行模拟卡。

```java
/**
 * Get the Group Identifier Level 1 (GID1) on a SIM for GSM.
 * @return null if SIM is not yet ready
 */
public String getGid1() {
    if (mCarrierTestOverride.isInTestMode()) {
        String fakeGid1 = mCarrierTestOverride.getFakeGid1();
        if (fakeGid1 != null) {
            return fakeGid1;
        }
    }
    return mGid1;
}

/**
 * Get the International Mobile Subscriber ID (IMSI) on a SIM
 * for GSM, UMTS and like networks. Default is null if IMSI is
 * not supported or unavailable.
 *
 * @return null if SIM is not yet ready or unavailable
 */
public String getIMSI() {
    if (mCarrierTestOverride.isInTestMode()) {
        String fakeImsi = mCarrierTestOverride.getFakeIMSI();
        if (fakeImsi != null) {
            return fakeImsi;
        }
    }
    return mImsi;
}
```

## **总结**

在没有白卡进行模拟验证问题时，可使用上述方法进行验证可以提高工作的效率，但针对Modem侧的修改无法验证，是因为此Override只在AP侧进行，适用面较小，但在没有白卡时非常好用，另外不同平台的路径和文件名可能有所不同，具体根据平台进行配置。

## 来源记录

- [Android实现将国内卡模拟成任意卡](http://192.168.3.94:8888/doc/android-mvNbbGdrlu) (`mvNbbGdrlu`)

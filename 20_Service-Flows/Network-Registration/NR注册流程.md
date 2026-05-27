---
doc_type: flow
quality: imported_reference
domain: Registration
rat: NR
layer: AP/Modem/Network
status: draft
---

# NR注册流程


## 阅读入口

- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。
- 可复用结论应沉淀到主流程/配置/排障/case；本文只保留溯源材料和操作细节。

## SA与NSA先分清

| 模式 | 注册核心 | 重点 |
|---|---|---|
| NSA | LTE/EPC为主，NR作为辅载波 | LTE注册、EN-DC添加、NR图标/信号 |
| SA | NR/5GC完整注册 | 5GMM Registration、PDU Session、5GC状态同步 |

## SA正常路径

```mermaid
sequenceDiagram
  participant UE
  participant gNB
  participant AMF
  participant AP
  UE->>gNB: Cell selection / RRC setup
  UE->>AMF: Registration Request
  AMF->>UE: Authentication / Security
  AMF->>UE: Registration Accept
  UE->>AMF: Registration Complete
  UE->>AMF: PDU Session Establishment
  UE->>AP: NR registration state indication
  AP->>AP: ServiceState / DisplayInfo updated
```

## AP侧观察点

- `ServiceState` 中 voice/data RAT 是否为 NR 或 LTE+NR。
- `TelephonyDisplayInfo` 是否显示 5G/5G+。
- NSA下 LTE 主注册是否稳定。
- SA下 data registration 是否为 NR。

## Modem侧观察点

- SA/NSA模式选择是否符合配置。
- NR小区选择、RRC建立、Registration Request。
- 5GMM reject cause。
- PDU Session establishment 是否成功。
- LTE/NR RAT fallback 或移动性回落是否发生。

## 常见异常分叉

| 现象 | 优先方向 |
|---|---|
| 只显示4G不显示5G | EN-DC/NR cell、配置、图标策略 |
| SA注册失败 | 5GMM reject、SIM签约、PLMN/TA限制 |
| NR频繁掉回LTE | 覆盖、测量、RRC release、网络策略 |

> VoNR / EPSFB 属于 IMS 语音域，已归入 [[IMS业务流程#VoNR流程|VoNR流程]]；NR 注册页只保留接入、5GMM、PDU Session 和 AP 状态同步。

## 搜网与驻留补充

NR/LTE 搜网问题先不要直接跳到 NAS reject，前面还有 SIM、PLMN 列表、SIB、随机接入几层门槛。

| 阶段 | 关键证据 | 含义 |
|---|---|---|
| SIM/PLMN 初始化 | `SIM_READY`、HPLMN/EHPLMN/FPLMN/UPLMN/OPLMN、LOCI/PSLOCI/EPSLOCI/5GS3GPPLOCI | 确认卡信息和历史注册位置是否已进入选网 |
| 小区发现 | MIB、SIB1、SSB ARFCN、PCI、band、SCS | 确认 UE 看到目标小区并能读取驻留参数 |
| 小区选择 | Srxlev、Squal、Qrxlevmin、Qqualmin、p-Max | 不满足 S 准则时，不应进入后续注册 |
| 小区重选 | Rs/Rn、Qhyst、Qoffset、邻区 SIB | 邻区或优先级配置异常会导致驻留/切换异常 |
| 随机接入 | RACH start/complete、Msg1~Msg4、RAR result | RAR 失败、Msg3/Msg4 失败通常是 RRC 建立前坏点 |
| RRC 建立 | `RRCSetupRequest`、T300、`RRCSetup`、`RRCSetupComplete` | T300 超时或 setup 失败时 NAS 不应继续推进 |
| NAS 注册 | `5GMM_REGISTRATION_REQUEST`、Authentication/Security、Registration Accept/Reject | 这里才进入 5GMM 层判断 |
| PDU Session | PDU Session Establishment Request/Accept/Reject | 注册成功但数据不可用时重点看 5GSM |

## NR随机接入关键Log

常见 MTK NR 注册日志可以按以下顺序确认：

```text
NRRC_SI: MIB / SIB1
VGMM: 5GMM_REGISTRATION_REQUEST
NRRC_Timer_Status_Event: T300 Started
NRRC_PDU_Event: RRCSetupRequest
NL2_MAC_RACH_Attempt_Start_Event: 4-Step RA
NL2_MAC_RACH_Attempt_Complete_Event: Success / Failed at RAR
NRRC_Timer_Status_Event: T300 Stopped
NRRC: RRCSetup
NRRC: RRCSetupComplete with dedicatedNAS-Message
```

第一坏点判断：

- `Msg2 valid = Invalid` 或 `Rach Result = Failed at RAR`：优先看 RACH/RF/小区接入条件。
- T300 started 后没有 `RRCSetup`：优先看 RRC 建立失败。
- 已有 `RRCSetupComplete` 且携带 NAS：再进入 5GMM 注册层。
- Registration Accept 后仍无数据：继续看 PDU Session，而不是回头判定搜网失败。

## 迁入资料：5G注册流程

> 该段从 PLMN/LTE 小区搜索资料中拆出，按注册主题归入 NR 注册流程。

### 总体流程

## 目录

 ![](../../attachments/outline/b0fff73a-6c61-44bd-a3ed-6a87c0ed7c30.png)

## 5G新特性

## 5G新特性-组网

如何从4G过渡到5G？

最重要的一个因素:考虑成本,选择合理的组网方式

组网方式1 NSA : 是"4G+5G"的组合，更适合过渡期, 3GPP R15的第一个阶段发布的就是 NSA 。

组网方式2 SA   :是真正的5G，但需要更多的基础设施投入, 3GPP R15的第二个阶段发布的是 SA 。

如果从技术理论设计上来说，SA（独立组网）无疑是最佳的选择，但现实是 3GPP 不得不考虑目前各大运营商已存在庞大的 4G 网络，如何能让旧网络设备能继续发挥作用，节省投资，又能享受 5G 的体验，这就是 NSA（非独立组网）


 ![](../../attachments/outline/9f96fc01-e157-45eb-9440-4d0cc54f88ea.png)

NSA和SA主要存在三大区别：

1）Option 3x(ENDC)组网方式下, NSA没有5G核心网，SA有5G核心网，这是一个关键区别。

2）在NSA组网下，5G与4G在接入网级互通，互连复杂；在SA组网下，5G网络独立于4G网络，5G与4G仅在核心网级互通，互连简单。

3）在NSA组网下，终端双连接LTE和NR两种无线接入技术；在SA组网下，终端仅连接NR一种无线接入技术。

## 5G新特性-FR1 FR2

频谱是通信的"高速公路",5G的频谱分成了FR1和FR2.

 ![](../../attachments/outline/652b6cc4-e316-46fd-b7b6-e3e07bb22811.png)

| FR1•450MHZ – 6000MHZ•也被称为sub6G•低频,信号衰减慢,可以覆盖的范围广•5G的主力频段 | FR2•毫米波•高频,带宽大•覆盖范围小•运营商代表,VZW和ATT |
|----|----|

### 5G新特性-RRC inactiveState

| 4G | 5G |
|----|----|
|  ![](../../attachments/outline/4d54bdcb-a19d-43dc-bb18-ed400acccfd2.png) |  ![](../../attachments/outline/8b670ef0-5e84-4b94-bc89-6ea3db621376.png) |

## RRC inactiveState 测试

 ![](../../attachments/outline/46cefc32-d620-4759-bca9-e98c4b4c7847.png)

## 5G新特性-MRDC

5G 网络中支持 不同无线接入技术（RAT） 协同工作的架构，主要用于提升 5G 和 4G 网络的协同能力。在 MRDC 中，用户设备可以同时连接到 4G LTE 网络 和 5G NR 网络，以实现更高的数据吞吐量和更好的网络覆盖。我们就以NSA架构的选项3x、来看看它们都是怎样实现双连接的。选项3x本质上是4G基站和5G基站之间的双连接，也叫做EN-DC。核心网采用4G EPC，4G基站是主节点，也就是控制面锚点,5G基站是辅节点，也是用户面的分流控制点。

 ![](../../attachments/outline/ba206b12-dedd-4924-ac9c-3754762d709b.png)

| MRDC下, 基于 B3, B41和  N77 的载波聚合 | LTE下,手基于B5,B3的载波聚合 |
|----|----|
|  ![](../../attachments/outline/ea5f53cd-3038-4a5f-8b87-9bf8c23b5c4c.png) |  ![](../../attachments/outline/fb91d80d-dacc-40e3-b976-87eb53dde906.png) |

## 5G NSA注册


1. 终端注册到LTE网络锚点频率
2. 终端测量NR频点信息并上报测量结果
3. LTE网络根据测量结果决定是否添加SCG
4. 终端驻留5G网络，完成NSA(EN-DC)注册

 ![](../../attachments/outline/d67cbc5a-56dc-49d3-8067-fd847f0d9058.png)


1. 网络SIB2消息中 : upperLayerIndication-r15 trueupperLayerIndication-r15用来指示 UE 已经进入了一个能够提供 5G 功能的覆盖区域。![](../../attachments/outline/a8ab513d-f9a3-4c85-ae31-a1d6a108c56a.png)
2. 终端支持ENDC双连接 : DCNR = 1![](../../attachments/outline/6bdb5f2c-bdcf-4203-93e3-a16b202df597.png)
3. 网络分两次查询手机能力


   1. 3G 4G能力![](../../attachments/outline/791971fa-0234-4179-800d-d993241f019b.png)
   2. ENDC NR能力![](../../attachments/outline/106a0ed3-12d8-4c15-8e5a-9439dd8584ee.png)
4. 手机上报ENDC能力![](../../attachments/outline/5503bec1-b0eb-4544-a188-3351e5a7e816.png)
5. 网络配置NR测量![](../../attachments/outline/59ec69c0-03e7-469f-bb50-167e8bf76c0d.png)
6. 测量结果上报![](../../attachments/outline/aa62724d-aff7-4888-b4f6-41b0b71e5c76.png)
7. 网络配置添加NSA辅小区,NSA注册完成![](../../attachments/outline/64e678a2-c407-410b-bde1-eedf73066dc8.png)![](../../attachments/outline/1ec9abe4-c867-4b4e-9818-c4fd716e610f.png)

## 5G SA注册

 ![](../../attachments/outline/8fa4ba2d-ab94-4910-9968-7a60dde931de.png)

 ![](../../attachments/outline/0f2774fc-1ddd-405d-bf7f-3c8dd8609dbd.png)


1. SIM Ready![](../../attachments/outline/a1baef80-c8f6-42b8-90d7-f114464695e6.png)
2. 发起注册请求![](../../attachments/outline/c02306e2-fccb-4008-9853-28c2b555ea6b.png)
3. SYSTEM SCAN(直接扫描对应频点，以捕获小区)![](../../attachments/outline/f565f181-034d-411c-a303-56b37c793fb9.png)
4. SA Cell selection![](../../attachments/outline/2b975f91-1b7f-44e2-b0fd-1ba842b9b570.png)
5. 在(627264,190)上收集SIB消息![](../../attachments/outline/ddcfe50e-3216-4419-9580-c6fd69231c84.png)
6. 获取SIB1![](../../attachments/outline/5e334133-6f5c-4883-abae-20ecd198dedd.png)
7. Registration request![](../../attachments/outline/4b541e59-bad1-49bf-aab6-a6d1bf1d94f4.png)
8. RRC connection establishment![](../../attachments/outline/5de9dcb0-4268-4b38-8d6e-7597bd9906a4.png)
9. Registration accept![](../../attachments/outline/c0dc525c-39b5-4fbc-945c-732f7ebe7f12.png)

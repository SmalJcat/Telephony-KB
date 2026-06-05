---
quality: curated
doc_type: case
domain: SIM
rat: LTE/NR
feature: PLMN name / ONS / numeric_operator
platform: UNISOC
layer: Framework/Telephony/RIL/operator XML
symptom: "PLMN 名称获取错误，FWK 和 RIL 分别命中 system/vendor 侧 numeric_operator 名称"
cause: "UniOperatorNameHandler 在 ONS 为空时提前返回空值，后续 XML fallback 被跳过，叠加 vendor numeric_operator 仍被 RIL 读取"
project: "GH65A1_Go"
chipset: "SC9863A1"
source_log: "CQWeb SPCSS01440031"
first_bad_point: "getSimOns() 返回空值后未做 TextUtils.isEmpty 判断，导致高优先级名称链路异常返回"
confidence: high
search_tier: case_summary
status: summarized
tags:
  - cqweb
  - sim
  - operator-name
  - numeric-operator
  - ons
---

# PLMN 名称：ONS 空值与 numeric_operator 双来源

## 用户现象

PLMN 名称显示错误。日志中可以看到 FWK 和 RIL 都参与了名称获取，但来源不同：

- FWK 侧通过 `UniOperatorNameHandler` 读取 system 侧 operator XML。
- RIL 侧仍可能读取 vendor 侧 `numeric_operator.xml`。

当两份 XML 配置不一致时，同一个 PLMN 可能因为高优先级名称链路是否返回空值而显示不同名称。

## 结论

第一坏点是 `UniOperatorNameHandler` 对 ONS 的空值处理。旧逻辑在满足 HPLMN/驻留网条件后直接返回 `iccRecords.getSimOns()`，没有判断返回值是否为空；当 ONS 为空时，后续 XML fallback 没有机会继续执行。

修复方向是把 ONS 获取封装成独立函数，并在返回前做非空判断：

```text
highPriorityPlmn = getOns(phoneId, iccRecords, operatorNumeric)
if (!TextUtils.isEmpty(highPriorityPlmn)) {
    return highPriorityPlmn
}
```

同时，如果项目希望只保留 FWK/system 侧 `numeric_operator.xml`，需要确认 vendor 侧拷贝逻辑是否删除。

## 关键日志

异常路径：

```text
UniOperatorNameHandler: getHighPriorityPlmn ... operatorNumeric 46001
UniOperatorNameHandler: ist is null, return empty pnn
UniOperatorNameHandler: return ons = null
RIL: match plmn: 46001, longName: ...
```

正常 fallback 路径：

```text
UniOperatorNameHandler: getHighPriorityPlmn ... operatorNumeric 46001
UniOperatorNameHandler: ist is null, return empty pnn
UniOperatorNameHandler: get name from xml: ...
```

vendor 侧拷贝入口示例：

```text
vendor/sprd/telephony-res/operatorname_overlay/.../numeric_operator.xml
PRODUCT_COPY_FILES += $(numeric_operator_src_file):vendor/etc/numeric_operator.xml
```

## 排查要点

| 检查项 | 判断 |
|---|---|
| `return ons = null` | 高优先级 ONS 链路提前返回空值，需继续查 fallback 是否被跳过 |
| `RIL: match plmn` | RIL 侧仍可能从 vendor `numeric_operator.xml` 取名 |
| `get name from xml` | FWK 侧 operator XML fallback 生效 |
| system/vendor XML | 两份 `numeric_operator.xml` 是否都存在，且同一 PLMN 是否配置不同 |
| `uni_tele_res_vendor.mk` | 是否仍把 operatorname overlay 拷贝到 `vendor/etc/numeric_operator.xml` |

## 处理建议

- 运营商名称问题不要只改一个 XML；先通过日志确认最终来源是 ONS、PNN/OPL、NITZ、system XML 还是 vendor XML。
- ONS/PNN 返回空值时，应继续走后续 fallback，不能把空值当成有效高优先级名称。
- 如果项目决定删除 vendor 侧名称来源，需要确保对应 makefile 修改已合入目标 vendor 分支。
- 对同一 PLMN 同时存在 system/vendor 配置时，要求两侧值一致，或明确一侧不再参与生效。

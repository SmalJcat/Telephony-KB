param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot),
  [string]$Output = (Join-Path (Split-Path -Parent $PSScriptRoot) '40_Case-Library\Case横向索引.md')
)

$ErrorActionPreference = 'Stop'

function Get-Frontmatter {
  param([string[]]$Lines)
  if ($Lines.Count -lt 3 -or $Lines[0] -ne '---') { return @{} }

  $end = -1
  for ($i = 1; $i -lt $Lines.Count; $i++) {
    if ($Lines[$i] -eq '---') {
      $end = $i
      break
    }
  }
  if ($end -lt 0) { return @{} }

  $map = [ordered]@{}
  $current = $null
  for ($i = 1; $i -lt $end; $i++) {
    $line = $Lines[$i]
    if ($line -match '^([A-Za-z_][A-Za-z0-9_]*):\s*(.*)$') {
      $current = $Matches[1]
      $map[$current] = $Matches[2].Trim().Trim('"')
      continue
    }
    if ($current -and $line -match '^\s+-\s+(.+)$') {
      $item = $Matches[1].Trim().Trim('"')
      if ($map[$current]) {
        $map[$current] = "$($map[$current]), $item"
      } else {
        $map[$current] = $item
      }
    }
  }
  return $map
}

function Get-Title {
  param([string[]]$Lines, [string]$Fallback)
  foreach ($line in $Lines) {
    if ($line -match '^#\s+(.+)$') {
      return $Matches[1].Trim()
    }
  }
  return $Fallback
}

function Escape-Cell {
  param([string]$Value)
  if ([string]::IsNullOrWhiteSpace($Value)) { return '-' }
  $clean = $Value -replace '\r?\n', ' '
  $clean = $clean -replace '\|', '&#124;'
  $clean = $clean -replace '\s+', ' '
  return $clean.Trim()
}

function Get-BadPointClass {
  param([hashtable]$Case)

  $domain = "$($Case.domain)"
  switch -Regex ($domain) {
    '^Call$' { return 'Call / SS / ECC' }
    '^IMS$' { return 'IMS / SIP' }
    '^Data$' { return 'Data / APN / ESM' }
    '^SMS$' { return 'SMS / CB / FDN' }
    '^SIM$' { return 'SIM / EF / Card' }
    '^Stability$' { return 'Stability / NV / Modem' }
    '^Signal$' { return 'RRC / RF / Cell' }
  }

  $text = @(
    $Case.domain,
    $Case.feature,
    $Case.layer,
    $Case.symptom,
    $Case.cause,
    $Case.first_bad_point,
    $Case.tags
  ) -join ' '

  if ($text -match 'SMS|SMSC|Cell Broadcast|小区广播|CB_|SMSCB|FDN|Voicemail') { return 'SMS / CB / FDN' }
  if ($text -match 'ECC|Emergency|Call|USSD|XCAP|SRVCC|CSFB|Q\.850|Supplementary|Call Forwarding|Call Barring|域选|紧急呼叫') { return 'Call / SS / ECC' }
  if ($text -match 'IMS|SIP|P-CSCF|VoLTE|VoWiFi|VoNR|USSI|REGISTER') { return 'IMS / SIP' }
  if ($text -match 'PDN|PDP|ESM|APN|DNS|TCP|MMS|Data|default bearer|默认承载|NetworkMonitor|CGDCONT') { return 'Data / APN / ESM' }
  if ($text -match 'Attach|TAU|EMM|PLMN|Registration|注册|漫游|SIMLock|Forbidden|Reject|驻网|搜网|选网') { return 'EMM / PLMN / Registration' }
  if ($text -match 'RACH|RRC|cell|小区|barred|SFO|RSRP|RSRQ|RSSI|RF|Band|弱场|redirect|重定向|天线|校准') { return 'RRC / RF / Cell' }
  if ($text -match 'SIM|USIM|ISIM|EF_|ATR|ICCID|SPN|PNN|OPL|NITZ|eSIM|卡槽|热插拔') { return 'SIM / EF / Card' }
  if ($text -match 'assert|modem|MODEM_NOT_ALIVE|radio_not_available|NV|fixnv|RFIC|RFFE|崩溃|重启') { return 'Stability / NV / Modem' }
  return 'Other'
}

function Get-RelativePathCompat {
  param(
    [string]$BaseDir,
    [string]$TargetPath
  )

  $baseFull = [System.IO.Path]::GetFullPath($BaseDir)
  if (-not $baseFull.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
    $baseFull += [System.IO.Path]::DirectorySeparatorChar
  }
  $targetFull = [System.IO.Path]::GetFullPath($TargetPath)
  $baseUri = [System.Uri]::new($baseFull)
  $targetUri = [System.Uri]::new($targetFull)
  return [System.Uri]::UnescapeDataString($baseUri.MakeRelativeUri($targetUri).ToString())
}

$rootPath = (Resolve-Path -LiteralPath $Root).Path
$caseRoot = Join-Path $rootPath '40_Case-Library'
if (-not (Test-Path -LiteralPath $caseRoot)) {
  throw "Case root not found: $caseRoot"
}

$outputPath = [System.IO.Path]::GetFullPath($Output)
$cases = New-Object System.Collections.Generic.List[object]
$caseFiles = Get-ChildItem -LiteralPath $caseRoot -Recurse -File -Filter '*.md' |
  Where-Object { $_.Name -ne 'README.md' -and $_.FullName -ne $outputPath }

foreach ($file in $caseFiles) {
  $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
  $fm = Get-Frontmatter $lines
  if ($fm['doc_type'] -ne 'case') {
    continue
  }
  $relativeFromOutput = (Get-RelativePathCompat -BaseDir (Split-Path -Parent $outputPath) -TargetPath $file.FullName) -replace '\\', '/'
  $title = Get-Title -Lines $lines -Fallback ([System.IO.Path]::GetFileNameWithoutExtension($file.Name))
  $record = [ordered]@{
    title = $title
    link = $relativeFromOutput
    domain = $fm['domain']
    platform = $fm['platform']
    rat = $fm['rat']
    layer = $fm['layer']
    status = $fm['status']
    confidence = $fm['confidence']
    source_log = $fm['source_log']
    first_bad_point = $fm['first_bad_point']
    search_tier = $fm['search_tier']
    feature = $fm['feature']
    symptom = $fm['symptom']
    cause = $fm['cause']
    tags = $fm['tags']
  }
  $record['bad_point_class'] = Get-BadPointClass $record
  $cases.Add([pscustomobject]$record)
}

$casesSorted = @($cases | Sort-Object domain, bad_point_class, platform, title)

$linesOut = New-Object System.Collections.Generic.List[string]
$linesOut.Add('---')
$linesOut.Add('doc_type: index')
$linesOut.Add('domain: Meta')
$linesOut.Add('status: active')
$linesOut.Add('quality: generated')
$linesOut.Add('generated: true')
$linesOut.Add('search_tier: main_entry')
$linesOut.Add('---')
$linesOut.Add('')
$linesOut.Add('# Case横向索引')
$linesOut.Add('')
$linesOut.Add('> 由 `70_Tools-Debug/generate-case-index.ps1` 生成。不要手工改表格；新增或修改 case 后重新运行脚本。')
$linesOut.Add('')
$linesOut.Add('## 统计')
$linesOut.Add('')
$linesOut.Add('| 维度 | 值 | 数量 |')
$linesOut.Add('|---|---|---:|')
foreach ($g in ($casesSorted | Group-Object domain | Sort-Object Name)) {
  $linesOut.Add("| Domain | $(Escape-Cell $g.Name) | $($g.Count) |")
}
foreach ($g in ($casesSorted | Group-Object platform | Sort-Object Name)) {
  $linesOut.Add("| Platform | $(Escape-Cell $g.Name) | $($g.Count) |")
}
foreach ($g in ($casesSorted | Group-Object bad_point_class | Sort-Object Name)) {
  $linesOut.Add("| 第一坏点分类 | $(Escape-Cell $g.Name) | $($g.Count) |")
}
foreach ($g in ($casesSorted | Group-Object status | Sort-Object Name)) {
  $linesOut.Add("| Status | $(Escape-Cell $g.Name) | $($g.Count) |")
}
foreach ($g in ($casesSorted | Group-Object search_tier | Sort-Object Name)) {
  $linesOut.Add("| SearchTier | $(Escape-Cell $g.Name) | $($g.Count) |")
}

$linesOut.Add('')
$linesOut.Add('## 全量索引')
$linesOut.Add('')
$linesOut.Add('| Case | Domain | 平台 | 第一坏点分类 | 层级 | 置信度 | 状态 | Source | 第一坏点 |')
$linesOut.Add('|---|---|---|---|---|---|---|---|---|')
foreach ($case in $casesSorted) {
  $caseLink = "[$(Escape-Cell $case.title)]($($case.link))"
  $linesOut.Add("| $caseLink | $(Escape-Cell $case.domain) | $(Escape-Cell $case.platform) | $(Escape-Cell $case.bad_point_class) | $(Escape-Cell $case.layer) | $(Escape-Cell $case.confidence) | $(Escape-Cell $case.status) | $(Escape-Cell $case.source_log) | $(Escape-Cell $case.first_bad_point) |")
}

$linesOut.Add('')
$linesOut.Add('## 使用建议')
$linesOut.Add('')
$linesOut.Add('- 按现象先看 `30_Troubleshooting`，再用本索引按平台、第一坏点分类和 source 反查历史 case。')
$linesOut.Add('- 如果一个 CQ ID 或 log 结论只出现在配置/流程文档中，没有独立 case，说明它更适合做规则沉淀，不一定需要 case 化。')
$linesOut.Add('- 新 case 应补齐 `domain`、`platform`、`layer`、`first_bad_point`、`confidence`、`status`、`search_tier`，否则横向索引和 HTML 搜索价值会下降。')
$linesOut.Add('')

New-Item -ItemType Directory -Force -Path (Split-Path -Parent $outputPath) | Out-Null
[System.IO.File]::WriteAllLines($outputPath, $linesOut, [System.Text.UTF8Encoding]::new($false))
Write-Host "Generated case index: $outputPath"
Write-Host "Cases: $($casesSorted.Count)"





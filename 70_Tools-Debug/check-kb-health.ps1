param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot),
  [int]$LargeDocLineThreshold = 500
)

$ErrorActionPreference = 'Stop'

$failures = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]
$passes = New-Object System.Collections.Generic.List[string]

$readingEntryPattern = '(?m)^##\s*(速查结论|使用入口|使用方法|拆分说明|阅读入口|文档定位|定位口径|快速定位|阅读顺序|定位原则|一页摘要)\s*$'

function Normalize-RelPath {
  param([string]$Path)
  return (($Path -replace '\\', '/') -replace '\.md$', '')
}

function Get-FrontmatterLines {
  param([string[]]$Lines)
  if ($Lines.Count -lt 3 -or $Lines[0] -ne '---') {
    return $null
  }
  for ($i = 1; $i -lt $Lines.Count; $i++) {
    if ($Lines[$i] -eq '---') {
      if ($i -eq 1) { return @() }
      return $Lines[1..($i - 1)]
    }
  }
  return $null
}

function Test-FrontmatterField {
  param(
    [string[]]$Frontmatter,
    [string]$Field
  )

  for ($i = 0; $i -lt $Frontmatter.Count; $i++) {
    if ($Frontmatter[$i] -match "^$([regex]::Escape($Field)):\s*(.*)$") {
      $value = $Matches[1].Trim()
      if ($value.Length -gt 0) { return $true }

      for ($j = $i + 1; $j -lt $Frontmatter.Count; $j++) {
        $line = $Frontmatter[$j]
        if ($line -match '^[A-Za-z_][A-Za-z0-9_]*:') { return $false }
        if ($line -match '^\s+-\s+\S+') { return $true }
      }

      return $false
    }
  }

  return $false
}

function Get-FrontmatterValue {
  param(
    [string[]]$Frontmatter,
    [string]$Field
  )

  foreach ($line in $Frontmatter) {
    if ($line -match "^$([regex]::Escape($Field)):\s*(.*)$") {
      return $Matches[1].Trim().Trim('"')
    }
  }
  return $null
}

function Remove-InlineCode {
  param([string]$Text)
  return [regex]::Replace($Text, '`[^`]*`', '')
}

if (-not (Test-Path -LiteralPath $Root)) {
  throw "Root not found: $Root"
}

$rootPath = (Resolve-Path -LiteralPath $Root).Path
$mdFiles = @(Get-ChildItem -LiteralPath $rootPath -Recurse -File -Filter '*.md')

# Every rendered document should carry lightweight metadata. This keeps manually
# curated pages, imported references and generated indexes visually consistent.
$requiredDocFields = @('doc_type', 'domain', 'status', 'quality')
$allowedQualities = @('curated', 'imported_reference', 'generated', 'template')
$allowedSearchTiers = @('main_entry', 'case_summary', 'supplemental', 'reference_only', 'archived_entry')
foreach ($file in $mdFiles) {
  $relative = $file.FullName.Substring($rootPath.Length + 1)
  $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
  $frontmatter = Get-FrontmatterLines $lines
  if ($null -eq $frontmatter) {
    $failures.Add("document missing top frontmatter: $relative")
    continue
  }
  foreach ($field in $requiredDocFields) {
    if (-not (Test-FrontmatterField -Frontmatter $frontmatter -Field $field)) {
      $failures.Add("document missing frontmatter field ${field}: $relative")
    }
  }
  $quality = Get-FrontmatterValue -Frontmatter $frontmatter -Field 'quality'
  if ($quality -and $allowedQualities -notcontains $quality) {
    $failures.Add("invalid document quality ${quality}: $relative")
  }
  $searchTier = Get-FrontmatterValue -Frontmatter $frontmatter -Field 'search_tier'
  if ($searchTier -and $allowedSearchTiers -notcontains $searchTier) {
    $failures.Add("invalid search_tier ${searchTier}: $relative")
  }
}

if (-not ($failures | Where-Object { $_ -like 'document missing*' -or $_ -like 'invalid document quality*' -or $_ -like 'invalid search_tier*' })) {
  $passes.Add("document frontmatter quality checked: $($mdFiles.Count)")
}

# Imported/reference material must explain how to read it. Otherwise it tends to
# look lower-quality than curated pages and becomes a dumping ground.
$importedEntryMissing = New-Object System.Collections.Generic.List[string]
foreach ($file in $mdFiles) {
  $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
  $frontmatter = Get-FrontmatterLines $lines
  $quality = Get-FrontmatterValue -Frontmatter $frontmatter -Field 'quality'
  if ($quality -ne 'imported_reference') { continue }
  $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
  $head = (($text -split '\r?\n') | Select-Object -First 80) -join "`n"
  if ($head -notmatch $readingEntryPattern) {
    $importedEntryMissing.Add($file.FullName.Substring($rootPath.Length + 1))
  }
}

if ($importedEntryMissing.Count -eq 0) {
  $passes.Add("imported document reading entries checked")
} else {
  foreach ($item in $importedEntryMissing) { $failures.Add("imported document missing reading entry: $item") }
}

# Markdown tables are rendered by both Obsidian and the HTML exporter. A wiki link
# with a display label uses a pipe and breaks table cell parsing in plain Markdown.
$tableWikiPipeLinks = New-Object System.Collections.Generic.List[string]
foreach ($file in $mdFiles) {
  $relative = $file.FullName.Substring($rootPath.Length + 1)
  $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
  for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    if ($line -match '^\s*\|' -and $line -match '\[\[[^\]]+\|[^\]]+\]\]') {
      $tableWikiPipeLinks.Add("${relative}:$($i + 1): $($line.Trim())")
    }
  }
}

if ($tableWikiPipeLinks.Count -eq 0) {
  $passes.Add("table wiki pipe links checked")
} else {
  $warnings.Add("table wiki pipe links present: $($tableWikiPipeLinks.Count); HTML exporter supports them, prefer markdown links in new tables")
}

# Wiki link target index.
$targetSet = @{}
foreach ($file in $mdFiles) {
  $relative = $file.FullName.Substring($rootPath.Length + 1)
  $relNoExt = Normalize-RelPath $relative
  $baseNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
  $targetSet[$relNoExt] = $true
  $targetSet[$baseNoExt] = $true
}

$missingLinks = New-Object System.Collections.Generic.List[string]
foreach ($file in $mdFiles) {
  $text = Remove-InlineCode ([System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8))
  $relative = $file.FullName.Substring($rootPath.Length + 1)
  foreach ($match in [regex]::Matches($text, '\[\[([^\]|#]+)(?:#[^\]|]+)?(?:\|[^\]]+)?\]\]')) {
    $target = $match.Groups[1].Value.Trim()
    $norm = Normalize-RelPath $target
    $base = [System.IO.Path]::GetFileName($norm)
    if (-not $targetSet.ContainsKey($norm) -and -not $targetSet.ContainsKey($base)) {
      $missingLinks.Add("$relative -> $target")
    }
  }
}

if ($missingLinks.Count -eq 0) {
  $passes.Add("wiki links resolved")
} else {
  foreach ($item in $missingLinks) { $failures.Add("missing wiki link: $item") }
}

# Local markdown links such as [label](../foo.md#bar).
$missingMarkdownLinks = New-Object System.Collections.Generic.List[string]
foreach ($file in $mdFiles) {
  $text = Remove-InlineCode ([System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8))
  $relative = $file.FullName.Substring($rootPath.Length + 1)
  foreach ($match in [regex]::Matches($text, '(?<!\!)\[[^\]]+\]\(([^)]+)\)')) {
    $url = $match.Groups[1].Value.Trim().Trim('<', '>')
    if ($url -match '^[a-zA-Z][a-zA-Z0-9+.-]*:' -or $url.StartsWith('#')) { continue }
    $clean = ($url -split '[#?]', 2)[0].Replace('/', '\')
    if (-not $clean.ToLowerInvariant().EndsWith('.md')) { continue }
    $targetPath = [System.IO.Path]::GetFullPath((Join-Path $file.DirectoryName $clean))
    if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
      $missingMarkdownLinks.Add("$relative -> $url")
    }
  }
}

if ($missingMarkdownLinks.Count -eq 0) {
  $passes.Add("local markdown links resolved")
} else {
  foreach ($item in $missingMarkdownLinks) { $failures.Add("missing local markdown link: $item") }
}

# Case frontmatter.
$requiredCaseFields = @(
  'doc_type',
  'domain',
  'rat',
  'platform',
  'layer',
  'symptom',
  'cause',
  'source_log',
  'first_bad_point',
  'confidence',
  'status'
)
$allowedCaseStatuses = @(
  'raw_import',
  'draft',
  'active',
  'needs_review',
  'partial',
  'summarized',
  'summarized_from_search',
  'summarized_with_log_gap',
  'closed',
  'open',
  'imported',
  'reference',
  'evidence_requirement'
)
$caseRoot = Join-Path $rootPath '40_Case-Library'
$caseFiles = New-Object System.Collections.Generic.List[object]
if (Test-Path -LiteralPath $caseRoot) {
  $candidateCaseFiles = @(Get-ChildItem -LiteralPath $caseRoot -Recurse -File -Filter '*.md' | Where-Object { $_.Name -ne 'README.md' -and $_.Name -ne 'Case横向索引.md' })
  foreach ($candidate in $candidateCaseFiles) {
    $candidateLines = @(Get-Content -LiteralPath $candidate.FullName -Encoding UTF8)
    $candidateFrontmatter = Get-FrontmatterLines $candidateLines
    if ((Get-FrontmatterValue -Frontmatter $candidateFrontmatter -Field 'doc_type') -eq 'case') {
      $caseFiles.Add($candidate)
    }
  }
}

foreach ($caseFile in $caseFiles) {
  $relative = $caseFile.FullName.Substring($rootPath.Length + 1)
  $lines = @(Get-Content -LiteralPath $caseFile.FullName -Encoding UTF8)
  $frontmatter = Get-FrontmatterLines $lines
  if ($null -eq $frontmatter) {
    $failures.Add("case missing top frontmatter: $relative")
    continue
  }

  foreach ($field in $requiredCaseFields) {
    if (-not (Test-FrontmatterField -Frontmatter $frontmatter -Field $field)) {
      $failures.Add("case missing required field '$field': $relative")
    }
  }

  $statusLine = $frontmatter | Where-Object { $_ -match '^status:\s*(.+)$' } | Select-Object -First 1
  if ($statusLine -and $statusLine -match '^status:\s*(.+)$') {
    $status = $Matches[1].Trim().Trim('"')
    if ($allowedCaseStatuses -notcontains $status) {
      $failures.Add("case has undefined status '$status': $relative")
    }
  }
}

if ($caseFiles.Count -gt 0) {
  $passes.Add("case frontmatter checked: $($caseFiles.Count)")
  $passes.Add("case status values checked")
}

# Duplicate CQ IDs across independent case files are usually a sign that material
# should be merged or one file should be downgraded to a config/rule reference.
$cqCaseRefs = @{}
foreach ($caseFile in $caseFiles) {
  $relative = $caseFile.FullName.Substring($rootPath.Length + 1)
  $text = [System.IO.File]::ReadAllText($caseFile.FullName, [System.Text.Encoding]::UTF8)
  foreach ($match in [regex]::Matches($text, 'SPCSS\d+')) {
    $id = $match.Value
    if (-not $cqCaseRefs.ContainsKey($id)) {
      $cqCaseRefs[$id] = New-Object System.Collections.Generic.HashSet[string]
    }
    [void]$cqCaseRefs[$id].Add($relative)
  }
}
foreach ($id in ($cqCaseRefs.Keys | Sort-Object)) {
  if ($cqCaseRefs[$id].Count -gt 1) {
    $warnings.Add("CQ ID appears in multiple case files: $id -> $([string]::Join('; ', ($cqCaseRefs[$id] | Sort-Object)))")
  }
}

# Privacy guard for CQ detail imports.
$privacyHits = New-Object System.Collections.Generic.List[string]
$privacyPattern = '\bTel\s*:|\bEmail\s*:|@[A-Za-z0-9._%+-]*(unisoc|sagereal)\.com|紧急联系人\s*[:：]'
foreach ($file in $mdFiles) {
  $hits = @(Select-String -LiteralPath $file.FullName -Pattern $privacyPattern -Encoding UTF8 -CaseSensitive)
  foreach ($hit in $hits) {
    $relative = $hit.Path.Substring($rootPath.Length + 1)
    $privacyHits.Add("${relative}:$($hit.LineNumber): $($hit.Line.Trim())")
  }
}
if ($privacyHits.Count -eq 0) {
  $passes.Add("CQ privacy fields checked")
} else {
  foreach ($item in $privacyHits) { $failures.Add("CQ privacy/contact field found: $item") }
}

# Case README index coverage.
$registrationDir = Join-Path $caseRoot 'Registration'
$registrationReadme = Join-Path $registrationDir 'README.md'
if (Test-Path -LiteralPath $registrationReadme) {
  $readmeText = [System.IO.File]::ReadAllText($registrationReadme, [System.Text.Encoding]::UTF8)
  $registrationCases = New-Object System.Collections.Generic.List[object]
  $registrationCandidates = @(Get-ChildItem -LiteralPath $registrationDir -File -Filter '*.md' | Where-Object { $_.Name -ne 'README.md' })
  foreach ($candidate in $registrationCandidates) {
    $candidateLines = @(Get-Content -LiteralPath $candidate.FullName -Encoding UTF8)
    $candidateFrontmatter = Get-FrontmatterLines $candidateLines
    if ((Get-FrontmatterValue -Frontmatter $candidateFrontmatter -Field 'doc_type') -eq 'case') {
      $registrationCases.Add($candidate)
    }
  }
  foreach ($caseFile in $registrationCases) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($caseFile.Name)
    if (-not $readmeText.Contains($base)) {
      $failures.Add("Registration README missing case: $base")
    }
  }
  $passes.Add("Registration README coverage checked: $($registrationCases.Count)")
}

# Large documents are allowed when they are either generated or have an explicit
# reading entry. Otherwise they are hard to use in the HTML view.
$largeDocsChecked = 0
foreach ($file in $mdFiles) {
  $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
  $lineCount = ($text -split '\r?\n').Count
  if ($lineCount -gt $LargeDocLineThreshold) {
    $relative = $file.FullName.Substring($rootPath.Length + 1)
    $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
    $frontmatter = Get-FrontmatterLines $lines
    $quality = Get-FrontmatterValue -Frontmatter $frontmatter -Field 'quality'
    $head = (($text -split '\r?\n') | Select-Object -First 80) -join "`n"
    if ($quality -ne 'generated' -and $head -notmatch $readingEntryPattern) {
      $failures.Add("large document missing reading entry ($lineCount lines): $relative")
    }
    $largeDocsChecked++
  }
}
if ($largeDocsChecked -gt 0) {
  $passes.Add("large document reading entries checked: $largeDocsChecked")
}

# LTE docs should not contain IMS/SIP/VoLTE topic content.
$lteScanFiles = @(
  (Join-Path $rootPath '20_Service-Flows\Network-Registration\LTE注册流程.md'),
  (Join-Path $rootPath '50_Platform-Code\Cross-Platform\平台代码与产物速查.md'),
  (Join-Path $rootPath '70_Tools-Debug\Log-Analysis\LTE注册-平台Log速查.md')
)
if (Test-Path -LiteralPath $registrationDir) {
  $lteScanFiles += @(Get-ChildItem -LiteralPath $registrationDir -File -Filter '*.md' | ForEach-Object { $_.FullName })
}

$forbiddenPattern = '\bIMS\b|P-CSCF|\bREGISTER\b|\b401\b|ims_voice|VoLTE|IMS注册|IMS恢复|SIP'
foreach ($path in $lteScanFiles) {
  if (-not (Test-Path -LiteralPath $path)) { continue }
  $hits = @(Select-String -LiteralPath $path -Pattern $forbiddenPattern -Encoding UTF8)
  foreach ($hit in $hits) {
    $relative = $hit.Path.Substring($rootPath.Length + 1)
    $failures.Add("LTE/Registration mixed IMS topic: ${relative}:$($hit.LineNumber): $($hit.Line.Trim())")
  }
}

$passes.Add("LTE/Registration IMS-topic boundary checked")

# Optional HTML sanity check after export.
$htmlRoot = Join-Path (Split-Path -Parent $rootPath) 'Telephony-HMTL'
if (Test-Path -LiteralPath $htmlRoot) {
  $htmlWikiLeftovers = @(Get-ChildItem -LiteralPath $htmlRoot -Recurse -File -Filter '*.html' | Select-String -Pattern '\[\[' -Encoding UTF8 -ErrorAction SilentlyContinue)
  if ($htmlWikiLeftovers.Count -eq 0) {
    $passes.Add("HTML wiki leftovers checked")
  } else {
    $warnings.Add("HTML contains literal wiki markup snippets: $($htmlWikiLeftovers.Count); verify these are examples or rerun export")
  }
}

Write-Host "Telephony-KB health check"
Write-Host "Root: $rootPath"
Write-Host ""

foreach ($pass in $passes) {
  Write-Host "[PASS] $pass"
}

foreach ($warning in $warnings) {
  Write-Host "[WARN] $warning"
}

if ($failures.Count -gt 0) {
  Write-Host ""
  foreach ($failure in $failures) {
    Write-Host "[FAIL] $failure"
  }
  exit 1
}

Write-Host ""
Write-Host "Result: PASS"





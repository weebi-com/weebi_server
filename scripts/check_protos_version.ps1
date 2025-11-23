# Check if weebi_server and weebi_express use the same proto version
# This helps ensure consistency across projects

$ErrorActionPreference = "Stop"

$WeebiServerRoot = Split-Path -Parent $PSScriptRoot
$WeebiExpressRoot = Join-Path (Split-Path -Parent $WeebiServerRoot) "weebi_express"

$ServerVersionFile = Join-Path $WeebiServerRoot ".protos-version"
$ExpressVersionFile = Join-Path $WeebiExpressRoot ".protos-version"

$ServerVersion = $null
$ServerCommit = $null
$ExpressVersion = $null
$ExpressCommit = $null

# Read weebi_server version
if (Test-Path $ServerVersionFile) {
    $content = Get-Content $ServerVersionFile -Raw
    if ($content -match 'PROTOS_VERSION=([^\s]+)') {
        $ServerVersion = $matches[1]
    }
    if ($content -match 'PROTOS_COMMIT=([^\s]+)') {
        $ServerCommit = $matches[1]
    }
}

# Read weebi_express version
if (Test-Path $ExpressVersionFile) {
    $content = Get-Content $ExpressVersionFile -Raw
    if ($content -match 'PROTOS_VERSION=([^\s]+)') {
        $ExpressVersion = $matches[1]
    }
    if ($content -match 'PROTOS_COMMIT=([^\s]+)') {
        $ExpressCommit = $matches[1]
    }
}

Write-Host "=== Proto Version Check ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "weebi_server:" -ForegroundColor Yellow
Write-Host "  Version: $ServerVersion" -ForegroundColor $(if ($ServerVersion) { "Green" } else { "Red" })
Write-Host "  Commit:  $ServerCommit" -ForegroundColor $(if ($ServerCommit) { "Green" } else { "Red" })
Write-Host ""
Write-Host "weebi_express:" -ForegroundColor Yellow
Write-Host "  Version: $ExpressVersion" -ForegroundColor $(if ($ExpressVersion) { "Green" } else { "Red" })
Write-Host "  Commit:  $ExpressCommit" -ForegroundColor $(if ($ExpressCommit) { "Green" } else { "Red" })
Write-Host ""

# Compare versions
$versionsMatch = ($ServerVersion -eq $ExpressVersion)
$commitsMatch = ($ServerCommit -eq $ExpressCommit)

if ($versionsMatch -and $commitsMatch) {
    Write-Host "✓ Versions match!" -ForegroundColor Green
    exit 0
} else {
    Write-Host "✗ Versions do NOT match!" -ForegroundColor Red
    if (-not $versionsMatch) {
        Write-Host "  Version mismatch: $ServerVersion vs $ExpressVersion" -ForegroundColor Red
    }
    if (-not $commitsMatch) {
        Write-Host "  Commit mismatch: $ServerCommit vs $ExpressCommit" -ForegroundColor Red
    }
    exit 1
}


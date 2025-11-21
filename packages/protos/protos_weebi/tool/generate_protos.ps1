# Generate Dart code from proto files
# Fetches proto files from https://github.com/weebi-com/protos
# Requires: protoc installed and in PATH

$ErrorActionPreference = "Stop"

# Configuration
$ProtosRepo = "https://github.com/weebi-com/protos.git"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProtosWeebiDir = Split-Path -Parent $ScriptDir
$ProtosDir = Join-Path (Split-Path -Parent $ProtosWeebiDir) "proto"
$GeneratedDir = Join-Path $ProtosWeebiDir "lib\src\generated"

# Read version from project root (shared with weebi_express)
$ProjectRoot = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $ProtosWeebiDir))
$VersionFile = Join-Path $ProjectRoot ".protos-version"
if (Test-Path $VersionFile) {
    $versionContent = Get-Content $VersionFile -Raw
    if ($versionContent -match 'PROTOS_VERSION=([^\s]+)') {
        $ProtosVersion = $matches[1]
    }
    if ($versionContent -match 'PROTOS_COMMIT=([^\s]+)') {
        $ProtosCommit = $matches[1]
    }
}
# Defaults if version file not found
if (-not $ProtosVersion) { $ProtosVersion = "main" }
if (-not $ProtosCommit) { $ProtosCommit = "main" }

Write-Host "Generating Dart code from proto files..." -ForegroundColor Green
Write-Host "Proto source: $ProtosRepo" -ForegroundColor Cyan
Write-Host "Proto version/commit: $ProtosCommit" -ForegroundColor Cyan
Write-Host "Output directory: $GeneratedDir" -ForegroundColor Cyan

# Check if protoc is installed
try {
    $protocVersion = protoc --version
    Write-Host "Found: $protocVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: protoc not found in PATH" -ForegroundColor Red
    Write-Host "Please install protoc: https://grpc.io/docs/protoc-installation/" -ForegroundColor Yellow
    exit 1
}

# Clone or update proto repository
if (Test-Path $ProtosDir) {
    Write-Host "Updating proto repository..." -ForegroundColor Yellow
    Push-Location $ProtosDir
    try {
        git fetch origin --tags
        # Checkout specific version/commit/tag
        if ($ProtosCommit -match '^v?\d+\.\d+\.\d+') {
            # It's a version tag
            $tag = if ($ProtosCommit.StartsWith('v')) { $ProtosCommit } else { "v$ProtosCommit" }
            Write-Host "Checking out tag: $tag" -ForegroundColor Cyan
            git checkout $tag 2>&1 | Out-Null
            if ($LASTEXITCODE -ne 0) {
                Write-Host "WARNING: Tag $tag not found, trying commit/branch $ProtosCommit" -ForegroundColor Yellow
                git checkout $ProtosCommit 2>&1 | Out-Null
            }
        } else {
            # It's a branch or commit hash
            Write-Host "Checking out: $ProtosCommit" -ForegroundColor Cyan
            $currentBranch = git rev-parse --abbrev-ref HEAD 2>&1 | Out-String
            if ($currentBranch.Trim() -ne $ProtosCommit) {
                $checkoutOutput = git checkout $ProtosCommit 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Host "ERROR: Failed to checkout $ProtosCommit" -ForegroundColor Red
                    Write-Host $checkoutOutput
                    exit 1
                }
            } else {
                Write-Host "Already on $ProtosCommit" -ForegroundColor Green
            }
        }
    } finally {
        Pop-Location
    }
} else {
    Write-Host "Cloning proto repository..." -ForegroundColor Yellow
    git clone $ProtosRepo $ProtosDir
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to clone proto repository" -ForegroundColor Red
        exit 1
    }
    Push-Location $ProtosDir
    try {
        git fetch origin --tags
        if ($ProtosCommit -match '^v?\d+\.\d+\.\d+') {
            $tag = if ($ProtosCommit.StartsWith('v')) { $ProtosCommit } else { "v$ProtosCommit" }
            git checkout $tag 2>&1 | Out-Null
        } else {
            git checkout $ProtosCommit 2>&1 | Out-Null
        }
    } finally {
        Pop-Location
    }
}

# Verify version
Push-Location $ProtosDir
try {
    $currentCommit = git rev-parse HEAD
    $currentTag = $null
    try {
        $tagOutput = git describe --tags --exact-match HEAD 2>&1
        if ($LASTEXITCODE -eq 0) {
            $currentTag = $tagOutput | Out-String
            $currentTag = $currentTag.Trim()
        }
    } catch {
        # No tags found, that's okay
    }
    if ($currentTag) {
        Write-Host "Using proto version: $currentTag (commit: $($currentCommit.Substring(0,7)))" -ForegroundColor Green
    } else {
        Write-Host "Using proto commit: $($currentCommit.Substring(0,7))" -ForegroundColor Green
    }
} finally {
    Pop-Location
}

# Ensure output directory exists
New-Item -ItemType Directory -Force -Path $GeneratedDir | Out-Null

# Build list of proto files
$ProtoFiles = @(
    "common\address.proto",
    "common\country.proto",
    "common\empty.proto",
    "common\chained_ids.proto",
    "common\g_common.proto",
    "common\g_timestamp.proto",
    "common\phone.proto",
    "article\article.proto",
    "article\photo.proto",
    "article\category.proto",
    "article\article_service.proto",
    "boutique.proto",
    "btq_chain.proto",
    "contact\contact.proto",
    "contact\contact_service.proto",
    "device.proto",
    "firm.proto",
    "user.proto",
    "user_permissions.proto",
    "fence_service.proto",
    "ticket\ticket.proto",
    "ticket\ticket_type.proto",
    "ticket\ticket_service.proto",
    "weebi_app_service.proto"
)

# Build full paths to proto files
$ProtoPaths = @()
foreach ($proto in $ProtoFiles) {
    $protoPath = Join-Path $ProtosDir $proto
    if (Test-Path $protoPath) {
        $ProtoPaths += $protoPath
        Write-Host "  Including $proto..." -ForegroundColor Cyan
    } else {
        Write-Host "  WARNING: $proto not found at $protoPath" -ForegroundColor Yellow
    }
}

if ($ProtoPaths.Count -eq 0) {
    Write-Host "ERROR: No proto files found!" -ForegroundColor Red
    exit 1
}

# Generate Dart code from proto files
Write-Host ""
Write-Host "Generating Dart code..." -ForegroundColor Yellow

# Build protoc command arguments
# protoc handles Windows paths, but we'll quote them to be safe
$protocArgs = @(
    "--dart_out=grpc:$GeneratedDir",
    "-I$ProtosDir"
) + $ProtoPaths

Write-Host "Running protoc..." -ForegroundColor Yellow
& protoc $protocArgs

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: protoc failed with exit code $LASTEXITCODE" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Done! Generated Dart code in $GeneratedDir" -ForegroundColor Green


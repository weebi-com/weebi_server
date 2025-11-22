# Generate Dart code from proto files
# Fetches proto files from https://github.com/weebi-com/protos/
# Requires: protoc, dart, git

$ErrorActionPreference = "Stop"

# Paths
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProtosWeebiDir = Split-Path -Parent $ScriptDir
$ProtosDir = Join-Path (Split-Path -Parent $ProtosWeebiDir) "proto"
$ProtosRepoUrl = "https://github.com/weebi-com/protos.git"
$OutputDir = Join-Path $ProtosWeebiDir "lib\src\generated"

# Read version from .protos-version file in weebi_server root
$WeebiServerRoot = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $ProtosWeebiDir))
$VersionFile = Join-Path $WeebiServerRoot ".protos-version"

$ProtosVersion = "main"
$ProtosCommit = "main"

if (Test-Path $VersionFile) {
    Write-Host "Reading version from $VersionFile" -ForegroundColor Cyan
    $versionContent = Get-Content $VersionFile -Raw
    if ($versionContent -match 'PROTOS_VERSION=([^\s]+)') {
        $ProtosVersion = $matches[1]
    }
    if ($versionContent -match 'PROTOS_COMMIT=([^\s]+)') {
        $ProtosCommit = $matches[1]
    }
}

Write-Host "Generating Dart code from proto files..." -ForegroundColor Green
Write-Host "Proto version: $ProtosVersion" -ForegroundColor Cyan
Write-Host "Proto commit: $ProtosCommit" -ForegroundColor Cyan
Write-Host "Output directory: $OutputDir" -ForegroundColor Cyan

# Check if protoc is installed
try {
    $protocVersion = protoc --version
    Write-Host "Found: $protocVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: protoc not found in PATH" -ForegroundColor Red
    Write-Host "Please install protoc: https://grpc.io/docs/protoc-installation/" -ForegroundColor Yellow
    exit 1
}

# Check if dart is installed
try {
    $dartVersion = dart --version
    Write-Host "Found: $dartVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: dart not found in PATH" -ForegroundColor Red
    Write-Host "Please install Dart SDK" -ForegroundColor Yellow
    exit 1
}

# Fetch proto files from GitHub
Write-Host "Fetching proto files from GitHub..." -ForegroundColor Yellow

if (Test-Path (Join-Path $ProtosDir ".git")) {
    Write-Host "Proto repository exists, updating..." -ForegroundColor Cyan
    Push-Location $ProtosDir
    
    # Fetch latest changes
    git fetch origin 2>&1 | Out-Null
    
    # Checkout specific version/commit/tag
    if ($ProtosCommit -match '^v?\d+\.\d+\.\d+') {
        # It's a version tag
        Write-Host "Checking out tag: $ProtosCommit" -ForegroundColor Cyan
        try {
            git checkout "tags/$ProtosCommit" 2>&1 | Out-Null
        } catch {
            git checkout $ProtosCommit 2>&1 | Out-Null
        }
    } else {
        # It's a branch or commit hash
        Write-Host "Checking out: $ProtosCommit" -ForegroundColor Cyan
        try {
            git checkout $ProtosCommit 2>&1 | Out-Null
        } catch {
            Write-Host "ERROR: Failed to checkout $ProtosCommit" -ForegroundColor Red
            Pop-Location
            exit 1
        }
    }
    
    git pull origin $ProtosCommit 2>&1 | Out-Null
    Pop-Location
} else {
    Write-Host "Cloning proto repository directly into proto directory..." -ForegroundColor Cyan
    # Remove proto directory if it exists but is not a git repo
    if (Test-Path $ProtosDir) {
        Write-Host "Removing existing proto directory..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $ProtosDir
    }
    
    $ParentDir = Split-Path -Parent $ProtosDir
    Push-Location $ParentDir
    git clone $ProtosRepoUrl (Split-Path -Leaf $ProtosDir)
    Pop-Location
    
    Push-Location $ProtosDir
    
    # Checkout specific version/commit/tag
    if ($ProtosCommit -match '^v?\d+\.\d+\.\d+') {
        try {
            git checkout "tags/$ProtosCommit" 2>&1 | Out-Null
        } catch {
            git checkout $ProtosCommit 2>&1 | Out-Null
        }
    } else {
        git checkout $ProtosCommit 2>&1 | Out-Null
    }
    Pop-Location
}

# Verify version
Push-Location $ProtosDir
try {
    $currentCommit = git rev-parse HEAD
    $currentTag = try { git describe --tags --exact-match HEAD 2>&1 | Out-String } catch { "" }
    Write-Host "Current commit: $currentCommit" -ForegroundColor Cyan
    if ($currentTag) {
        Write-Host "Current tag: $currentTag" -ForegroundColor Cyan
    }
} finally {
    Pop-Location
}

# Create output directory
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

# Generate Dart code
Write-Host "Generating Dart code..." -ForegroundColor Yellow
Push-Location $ProtosDir

$protoFiles = @(
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

$protoFilesString = ($protoFiles | ForEach-Object { 
    $fullPath = Join-Path $ProtosDir $_
    if (Test-Path $fullPath) {
        $fullPath
    }
}) -join " "

if ([string]::IsNullOrEmpty($protoFilesString)) {
    Write-Host "ERROR: No proto files found!" -ForegroundColor Red
    Pop-Location
    exit 1
}

$command = "protoc --dart_out=grpc:`"$OutputDir`" -I. $protoFilesString"
Invoke-Expression $command

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: protoc failed with exit code $LASTEXITCODE" -ForegroundColor Red
    Pop-Location
    exit 1
}

Pop-Location

Write-Host "Done! Generated Dart code in $OutputDir" -ForegroundColor Green
Write-Host "Proto version used: $ProtosVersion ($currentCommit)" -ForegroundColor Cyan


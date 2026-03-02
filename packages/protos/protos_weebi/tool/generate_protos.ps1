# Generate Dart code from proto files
# Fetches proto files from https://github.com/weebi-com/protos

$ErrorActionPreference = "Stop"

# Helper function to run git commands without PowerShell treating stderr as error
function Invoke-GitCommand {
    param(
        [string[]]$Arguments
    )
    $oldErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $output = & git $Arguments 2>&1
        $exitCode = $LASTEXITCODE
        return @{
            Output = $output
            ExitCode = $exitCode
            Success = ($exitCode -eq 0 -or ($output -match "Already on"))
        }
    } finally {
        $ErrorActionPreference = $oldErrorAction
    }
}

$PROTOS_REPO = "https://github.com/weebi-com/protos.git"
# Script runs from tool/ directory, so go up to protos_weebi root
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROTOS_WEEBI_DIR = Split-Path -Parent $SCRIPT_DIR
$PROTOS_DIR = Join-Path (Split-Path -Parent $PROTOS_WEEBI_DIR) "proto"
$GENERATED_DIR = Join-Path $PROTOS_WEEBI_DIR "lib\src\generated"

# Read version from project root (shared with weebi_express)
$PROJECT_ROOT = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $PROTOS_WEEBI_DIR))
$VERSION_FILE = Join-Path $PROJECT_ROOT ".protos-version"

# Check for local protos repo (sibling of weebi_server, e.g. git_weebi/protos)
$LOCAL_PROTOS = Join-Path (Split-Path -Parent $PROJECT_ROOT) "protos"
if ((Test-Path $LOCAL_PROTOS) -and (Test-Path (Join-Path $LOCAL_PROTOS ".git"))) {
    Write-Host "Using local protos repo: $LOCAL_PROTOS" -ForegroundColor Cyan
    $PROTOS_DIR = $LOCAL_PROTOS
}

$PROTOS_VERSION = "main"
$PROTOS_COMMIT = "main"

if (Test-Path $VERSION_FILE) {
    $versionContent = Get-Content $VERSION_FILE
    foreach ($line in $versionContent) {
        if ($line -match "^PROTOS_VERSION=(.+)$") {
            $PROTOS_VERSION = $matches[1].Trim()
        }
        if ($line -match "^PROTOS_COMMIT=(.+)$") {
            $PROTOS_COMMIT = $matches[1].Trim()
        }
    }
}

Write-Host "Generating Dart code from proto files..."
Write-Host "Proto source: $PROTOS_REPO"
Write-Host "Proto version/commit: $PROTOS_COMMIT"
Write-Host "Output directory: $GENERATED_DIR"

# Check if protoc (Protocol Buffers compiler) is installed
try {
    $protocVersion = & protoc --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "protoc not found"
    }
    Write-Host "Found: protoc ($protocVersion)"
} catch {
    Write-Host "ERROR: protoc (Protocol Buffers compiler) not found in PATH" -ForegroundColor Red
    Write-Host "Please install protoc: https://grpc.io/docs/protoc-installation/"
    Write-Host "  On Windows: choco install protoc"
    Write-Host "  Or download from: https://github.com/protocolbuffers/protobuf/releases"
    exit 1
}

# Check if protoc-gen-dart (Dart plugin for protoc) is available
# protoc-gen-dart is a plugin that protoc uses to generate Dart code
# It should be installed via: dart pub global activate protoc_plugin
$protocGenDartPath = $null
$pubCacheBin = Join-Path $env:USERPROFILE ".pub-cache\bin"
$possiblePaths = @(
    (Join-Path $pubCacheBin "protoc-gen-dart.bat"),
    (Join-Path $pubCacheBin "protoc-gen-dart"),
    "protoc-gen-dart"
)

foreach ($path in $possiblePaths) {
    if (Get-Command $path -ErrorAction SilentlyContinue) {
        $protocGenDartPath = $path
        break
    }
}

if (-not $protocGenDartPath) {
    Write-Host "ERROR: protoc-gen-dart (Dart plugin) not found in PATH" -ForegroundColor Red
    Write-Host "Current PATH: $env:PATH"
    Write-Host "protoc-gen-dart is different from protoc - it's a plugin that protoc uses"
    Write-Host "Please ensure protoc-gen-dart is installed and in PATH:"
    Write-Host "  dart pub global activate protoc_plugin"
    Write-Host "  Add to PATH: $pubCacheBin"
    exit 1
}

Write-Host "Found: protoc-gen-dart ($protocGenDartPath)"

# Use same protoc_plugin version as Dockerfile (compatible with protobuf ^4.0.0)
$PROTOC_PLUGIN_VERSION = "21.1.0"
Write-Host "Ensuring protoc_plugin $PROTOC_PLUGIN_VERSION (matches Dockerfile)..."
& dart pub global activate protoc_plugin $PROTOC_PLUGIN_VERSION 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "WARNING: Could not activate protoc_plugin $PROTOC_PLUGIN_VERSION" -ForegroundColor Yellow
}

$useLocalProtos = ($PROTOS_DIR -eq $LOCAL_PROTOS)

# Clone or update proto repository (skip if using local protos)
if (-not $useLocalProtos) {
if (Test-Path $PROTOS_DIR) {
    Write-Host "Updating proto repository..."
    Push-Location $PROTOS_DIR
    try {
        $null = Invoke-GitCommand -Arguments @("fetch", "origin", "--tags")
        # Pull latest from remote to sync with GitHub
        $pullResult = Invoke-GitCommand -Arguments @("pull", "origin", $PROTOS_COMMIT)
        if (-not $pullResult.Success) {
            Write-Host "WARNING: git pull failed, trying reset to origin/$PROTOS_COMMIT..." -ForegroundColor Yellow
            $null = Invoke-GitCommand -Arguments @("reset", "--hard", "origin/$PROTOS_COMMIT")
        }
        
        # Checkout specific version/commit/tag
        if ($PROTOS_COMMIT -match '^v?\d+\.\d+\.\d+') {
            # It's a version tag
            $TAG = if ($PROTOS_COMMIT -match '^v') { $PROTOS_COMMIT } else { "v$PROTOS_COMMIT" }
            Write-Host "Checking out tag: $TAG"
            $gitResult = Invoke-GitCommand -Arguments @("checkout", $TAG)
            if (-not $gitResult.Success) {
                Write-Host "WARNING: Tag $TAG not found, trying commit/branch $PROTOS_COMMIT" -ForegroundColor Yellow
                $gitResult2 = Invoke-GitCommand -Arguments @("checkout", $PROTOS_COMMIT)
                if (-not $gitResult2.Success) {
                    throw "Failed to checkout $PROTOS_COMMIT"
                }
            }
        } else {
            # It's a branch or commit hash
            Write-Host "Checking out: $PROTOS_COMMIT"
            $gitResult = Invoke-GitCommand -Arguments @("checkout", $PROTOS_COMMIT)
            if (-not $gitResult.Success) {
                throw "Failed to checkout $PROTOS_COMMIT"
            }
        }
        
        # Ensure we have all files (force checkout)
        $null = Invoke-GitCommand -Arguments @("checkout", ".")
    } finally {
        Pop-Location
    }
} else {
    Write-Host "Cloning proto repository..."
    $gitResult = Invoke-GitCommand -Arguments @("clone", $PROTOS_REPO, $PROTOS_DIR)
    if (-not $gitResult.Success) {
        throw "Failed to clone repository"
    }
    
    Push-Location $PROTOS_DIR
    try {
        $null = Invoke-GitCommand -Arguments @("fetch", "origin", "--tags")
        
        if ($PROTOS_COMMIT -match '^v?\d+\.\d+\.\d+') {
            $TAG = if ($PROTOS_COMMIT -match '^v') { $PROTOS_COMMIT } else { "v$PROTOS_COMMIT" }
            $gitResult = Invoke-GitCommand -Arguments @("checkout", $TAG)
            if (-not $gitResult.Success) {
                $gitResult2 = Invoke-GitCommand -Arguments @("checkout", $PROTOS_COMMIT)
                if (-not $gitResult2.Success) {
                    throw "Failed to checkout $PROTOS_COMMIT"
                }
            }
        } else {
            $gitResult = Invoke-GitCommand -Arguments @("checkout", $PROTOS_COMMIT)
            if (-not $gitResult.Success) {
                throw "Failed to checkout $PROTOS_COMMIT"
            }
        }
    } finally {
        Pop-Location
    }
}
} else {
    # Using local protos repo - ensure we're on the branch and pull latest from origin
    Write-Host "Updating local protos repo (checkout $PROTOS_COMMIT, pull latest)..."
    Push-Location $PROTOS_DIR
    try {
        $null = Invoke-GitCommand -Arguments @("fetch", "origin", "--tags")
        $checkoutResult = Invoke-GitCommand -Arguments @("checkout", $PROTOS_COMMIT)
        if (-not $checkoutResult.Success) {
            Write-Host "WARNING: git checkout $PROTOS_COMMIT failed (e.g. detached HEAD); trying to create/switch to branch" -ForegroundColor Yellow
            $null = Invoke-GitCommand -Arguments @("checkout", "-B", $PROTOS_COMMIT, "origin/$PROTOS_COMMIT")
        }
        $pullResult = Invoke-GitCommand -Arguments @("pull", "origin", $PROTOS_COMMIT)
        if (-not $pullResult.Success) {
            Write-Host "WARNING: git pull failed" -ForegroundColor Yellow
        }
        # Show VERSION file so user sees which proto version is used
        $versionPath = Join-Path $PROTOS_DIR "VERSION"
        if (Test-Path $versionPath) {
            $ver = (Get-Content $versionPath -Raw).Trim()
            Write-Host "Proto VERSION file: $ver" -ForegroundColor Cyan
        }
    } finally {
        Pop-Location
    }
}

# Verify version and show VERSION file
Push-Location $PROTOS_DIR
try {
    $gitResult = Invoke-GitCommand -Arguments @("rev-parse", "HEAD")
    if (-not $gitResult.Success) {
        throw "Failed to get current commit"
    }
    $CURRENT_COMMIT = ($gitResult.Output -join "").Trim()
    
    $gitResult2 = Invoke-GitCommand -Arguments @("describe", "--tags", "--exact-match", "HEAD")
    $CURRENT_TAG = if ($gitResult2.Success) { 
        ($gitResult2.Output -join "").Trim()
    } else { 
        $null 
    }
    
    if ($CURRENT_TAG) {
        Write-Host "Using proto version: $CURRENT_TAG (commit: $($CURRENT_COMMIT.Substring(0, 7)))"
    } else {
        Write-Host "Using proto commit: $($CURRENT_COMMIT.Substring(0, 7))"
    }
    $versionPath = Join-Path $PROTOS_DIR "VERSION"
    if (Test-Path $versionPath) {
        $ver = (Get-Content $versionPath -Raw).Trim()
        Write-Host "Proto VERSION file: $ver" -ForegroundColor Cyan
    }
} finally {
    Pop-Location
}

# Clean existing generated files to force regeneration
if (Test-Path $GENERATED_DIR) {
    Write-Host "Cleaning existing generated files..."
    Remove-Item -Path (Join-Path $GENERATED_DIR "*") -Recurse -Force -ErrorAction SilentlyContinue
}

# Ensure output directory exists
New-Item -ItemType Directory -Force -Path $GENERATED_DIR | Out-Null

# Generate Dart code from proto files
Write-Host ""
Write-Host "Generating Dart code..."

# Build list of proto files, checking that each exists
$PROTO_FILES_TO_CHECK = @(
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
    "license.proto",
    "firm.proto",
    "user.proto",
    "user_permissions.proto",
    "fence_service.proto",
    "billing_service.proto",
    "ticket\ticket.proto",
    "ticket\ticket_type.proto",
    "ticket\ticket_service.proto",
    "weebi_app_service.proto"
)

$PROTO_FILES = @()

Write-Host "Checking proto files exist..."
foreach ($proto_file in $PROTO_FILES_TO_CHECK) {
    $proto_path = Join-Path $PROTOS_DIR $proto_file
    if (Test-Path $proto_path) {
        $PROTO_FILES += $proto_path
        Write-Host "  [OK] $proto_file" -ForegroundColor Green
    } else {
        Write-Host "  [NOT FOUND] $proto_file NOT FOUND at $proto_path" -ForegroundColor Red
        Write-Host "    This file will be skipped"
    }
}

if ($PROTO_FILES.Count -eq 0) {
    Write-Host "ERROR: No proto files found to generate!" -ForegroundColor Red
    Write-Host "Proto directory: $PROTOS_DIR"
    Write-Host "Listing directory contents:"
    if (Test-Path $PROTOS_DIR) {
        Get-ChildItem $PROTOS_DIR | Format-Table
    } else {
        Write-Host "Directory does not exist!" -ForegroundColor Red
    }
    exit 1
}

Write-Host ""
Write-Host "Generating Dart code for $($PROTO_FILES.Count) proto files..."

# Run protoc with better error handling
$protocArgs = @(
    "--dart_out=grpc:$GENERATED_DIR",
    "-I$PROTOS_DIR"
) + $PROTO_FILES

try {
    & protoc $protocArgs 2>&1 | ForEach-Object { Write-Host $_ }
    if ($LASTEXITCODE -ne 0) {
        throw "protoc failed with exit code $LASTEXITCODE"
    }
} catch {
    Write-Host "ERROR: protoc failed" -ForegroundColor Red
    Write-Host "Check that:"
    Write-Host "  1. protoc-gen-dart is installed: dart pub global activate protoc_plugin"
    Write-Host "  2. protoc-gen-dart is in PATH: $pubCacheBin"
    Write-Host "  3. All proto files exist in $PROTOS_DIR"
    exit 1
}

Write-Host ""
Write-Host "Done! Generated Dart code in $GENERATED_DIR" -ForegroundColor Green

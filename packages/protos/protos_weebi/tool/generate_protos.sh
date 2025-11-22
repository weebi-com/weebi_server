#!/bin/bash
# Generate Dart code from proto files
# Fetches proto files from https://github.com/weebi-com/protos

set -e

PROTOS_REPO="https://github.com/weebi-com/protos.git"
# Script runs from tool/ directory, so go up to protos_weebi root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTOS_WEEBI_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROTOS_DIR="$PROTOS_WEEBI_DIR/../proto"
GENERATED_DIR="$PROTOS_WEEBI_DIR/lib/src/generated"

# Read version from project root (shared with weebi_express)
PROJECT_ROOT="$(cd "$PROTOS_WEEBI_DIR/../../.." && pwd)"
VERSION_FILE="$PROJECT_ROOT/.protos-version"
if [ -f "$VERSION_FILE" ]; then
    PROTOS_VERSION=$(grep "^PROTOS_VERSION=" "$VERSION_FILE" | cut -d'=' -f2 | tr -d '\r\n' || echo "")
    PROTOS_COMMIT=$(grep "^PROTOS_COMMIT=" "$VERSION_FILE" | cut -d'=' -f2 | tr -d '\r\n' || echo "")
fi
# Defaults if version file not found
PROTOS_VERSION=${PROTOS_VERSION:-main}
PROTOS_COMMIT=${PROTOS_COMMIT:-main}

echo "Generating Dart code from proto files..."
echo "Proto source: $PROTOS_REPO"
echo "Proto version/commit: $PROTOS_COMMIT"
echo "Output directory: $GENERATED_DIR"

# Check if protoc (Protocol Buffers compiler) is installed
# protoc is the main compiler, installed via: apt-get install protobuf-compiler
if ! command -v protoc &> /dev/null; then
    echo "ERROR: protoc (Protocol Buffers compiler) not found in PATH"
    echo "Please install protoc: https://grpc.io/docs/protoc-installation/"
    echo "  On Debian/Ubuntu: apt-get install protobuf-compiler"
    exit 1
fi

echo "Found: protoc ($(protoc --version))"

# Check if protoc-gen-dart (Dart plugin for protoc) is available
# protoc-gen-dart is a plugin that protoc uses to generate Dart code
# It should be installed via: dart pub global activate protoc_plugin
# And be in PATH: /root/.pub-cache/bin (or $HOME/.pub-cache/bin)
if ! command -v protoc-gen-dart &> /dev/null; then
    echo "ERROR: protoc-gen-dart (Dart plugin) not found in PATH"
    echo "Current PATH: $PATH"
    echo "protoc-gen-dart is different from protoc - it's a plugin that protoc uses"
    echo "Please ensure protoc-gen-dart is installed and in PATH:"
    echo "  dart pub global activate protoc_plugin"
    echo "  export PATH=\"\$PATH:\$HOME/.pub-cache/bin\""
    exit 1
fi

echo "Found: protoc-gen-dart ($(which protoc-gen-dart))"

# Clone or update proto repository
if [ -d "$PROTOS_DIR" ]; then
    echo "Updating proto repository..."
    cd "$PROTOS_DIR"
    git fetch origin --tags
    
    # Reset any local changes first
    git reset --hard HEAD 2>/dev/null || true
    
    # Checkout specific version/commit/tag
    if echo "$PROTOS_COMMIT" | grep -qE '^v?[0-9]+\.[0-9]+\.[0-9]+'; then
        # It's a version tag
        TAG=$(echo "$PROTOS_COMMIT" | sed 's/^v\?/v/')
        echo "Checking out tag: $TAG"
        git checkout "$TAG" 2>/dev/null || {
            echo "WARNING: Tag $TAG not found, trying commit/branch $PROTOS_COMMIT"
            git checkout "$PROTOS_COMMIT" 2>/dev/null || exit 1
        }
    else
        # It's a branch or commit hash
        echo "Checking out: $PROTOS_COMMIT"
        git checkout "$PROTOS_COMMIT" 2>/dev/null || exit 1
    fi
    
    # Ensure we have all files (force checkout)
    git checkout . 2>/dev/null || true
    
    cd - > /dev/null
else
    echo "Cloning proto repository..."
    git clone "$PROTOS_REPO" "$PROTOS_DIR"
    cd "$PROTOS_DIR"
    git fetch origin --tags
    if echo "$PROTOS_COMMIT" | grep -qE '^v?[0-9]+\.[0-9]+\.[0-9]+'; then
        TAG=$(echo "$PROTOS_COMMIT" | sed 's/^v\?/v/')
        git checkout "$TAG" 2>/dev/null || git checkout "$PROTOS_COMMIT" 2>/dev/null || exit 1
    else
        git checkout "$PROTOS_COMMIT" 2>/dev/null || exit 1
    fi
    cd - > /dev/null
fi

# Verify version
cd "$PROTOS_DIR"
CURRENT_COMMIT=$(git rev-parse HEAD)
CURRENT_TAG=$(git describe --tags --exact-match HEAD 2>/dev/null || echo "")
if [ -n "$CURRENT_TAG" ]; then
    echo "Using proto version: $CURRENT_TAG (commit: ${CURRENT_COMMIT:0:7})"
else
    echo "Using proto commit: ${CURRENT_COMMIT:0:7}"
fi
cd - > /dev/null

# Clean existing generated files to force regeneration
if [ -d "$GENERATED_DIR" ]; then
    echo "Cleaning existing generated files..."
    rm -rf "$GENERATED_DIR"/*
fi

# Ensure output directory exists
mkdir -p "$GENERATED_DIR"

# Generate Dart code from proto files
echo ""
echo "Generating Dart code..."

# Build list of proto files, checking that each exists
PROTO_FILES=()
PROTO_FILES_TO_CHECK=(
  "common/address.proto"
  "common/country.proto"
  "common/empty.proto"
  "common/chained_ids.proto"
  "common/g_common.proto"
  "common/g_timestamp.proto"
  "common/phone.proto"
  "article/article.proto"
  "article/photo.proto"
  "article/category.proto"
  "article/article_service.proto"
  "boutique.proto"
  "btq_chain.proto"
  "contact/contact.proto"
  "contact/contact_service.proto"
  "device.proto"
  "firm.proto"
  "user.proto"
  "user_permissions.proto"
  "fence_service.proto"
  "ticket/ticket.proto"
  "ticket/ticket_type.proto"
  "ticket/ticket_service.proto"
  "weebi_app_service.proto"
)

echo "Checking proto files exist..."
for proto_file in "${PROTO_FILES_TO_CHECK[@]}"; do
  proto_path="$PROTOS_DIR/$proto_file"
  if [ -f "$proto_path" ]; then
    PROTO_FILES+=("$proto_path")
    echo "  ✓ $proto_file"
  else
    echo "  ✗ $proto_file NOT FOUND at $proto_path"
    echo "    This file will be skipped"
  fi
done

if [ ${#PROTO_FILES[@]} -eq 0 ]; then
    echo "ERROR: No proto files found to generate!"
    echo "Proto directory: $PROTOS_DIR"
    echo "Listing directory contents:"
    ls -la "$PROTOS_DIR" || echo "Directory does not exist!"
    exit 1
fi

echo ""
echo "Generating Dart code for ${#PROTO_FILES[@]} proto files..."

# Run protoc with better error handling
if ! protoc \
  --dart_out=grpc:"$GENERATED_DIR" \
  -I"$PROTOS_DIR" \
  "${PROTO_FILES[@]}" 2>&1; then
    echo "ERROR: protoc failed"
    echo "Check that:"
    echo "  1. protoc-gen-dart is installed: dart pub global activate protoc_plugin"
    echo "  2. protoc-gen-dart is in PATH: export PATH=\"\$PATH:\$HOME/.pub-cache/bin\""
    echo "  3. All proto files exist in $PROTOS_DIR"
    exit 1
fi

echo ""
echo "Done! Generated Dart code in $GENERATED_DIR"

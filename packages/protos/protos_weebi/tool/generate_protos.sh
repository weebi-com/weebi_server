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

# Check if protoc is installed
if ! command -v protoc &> /dev/null; then
    echo "ERROR: protoc not found in PATH"
    echo "Please install protoc: https://grpc.io/docs/protoc-installation/"
    exit 1
fi

echo "Found: $(protoc --version)"

# Clone or update proto repository
if [ -d "$PROTOS_DIR" ]; then
    echo "Updating proto repository..."
    cd "$PROTOS_DIR"
    git fetch origin --tags
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
protoc \
  --dart_out=grpc:"$GENERATED_DIR" \
  -I"$PROTOS_DIR" \
  "$PROTOS_DIR"/common/address.proto \
  "$PROTOS_DIR"/common/country.proto \
  "$PROTOS_DIR"/common/empty.proto \
  "$PROTOS_DIR"/common/chained_ids.proto \
  "$PROTOS_DIR"/common/g_common.proto \
  "$PROTOS_DIR"/common/g_timestamp.proto \
  "$PROTOS_DIR"/common/phone.proto \
  "$PROTOS_DIR"/article/article.proto \
  "$PROTOS_DIR"/article/photo.proto \
  "$PROTOS_DIR"/article/category.proto \
  "$PROTOS_DIR"/article/article_service.proto \
  "$PROTOS_DIR"/boutique.proto \
  "$PROTOS_DIR"/btq_chain.proto \
  "$PROTOS_DIR"/contact/contact.proto \
  "$PROTOS_DIR"/contact/contact_service.proto \
  "$PROTOS_DIR"/device.proto \
  "$PROTOS_DIR"/firm.proto \
  "$PROTOS_DIR"/user.proto \
  "$PROTOS_DIR"/user_permissions.proto \
  "$PROTOS_DIR"/fence_service.proto \
  "$PROTOS_DIR"/ticket/ticket.proto \
  "$PROTOS_DIR"/ticket/ticket_type.proto \
  "$PROTOS_DIR"/ticket/ticket_service.proto \
  "$PROTOS_DIR"/weebi_app_service.proto

if [ $? -ne 0 ]; then
    echo "ERROR: protoc failed"
    exit 1
fi

echo ""
echo "Done! Generated Dart code in $GENERATED_DIR"
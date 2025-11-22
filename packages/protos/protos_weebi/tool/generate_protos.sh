#!/bin/bash
# Generate Dart code from proto files
# Fetches proto files from https://github.com/weebi-com/protos/
# Requires: protoc, dart, git

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTOS_WEEBI_DIR="$(dirname "$SCRIPT_DIR")"
PROTOS_DIR="$PROTOS_WEEBI_DIR/../proto"
PROTOS_REPO_URL="https://github.com/weebi-com/protos.git"
OUTPUT_DIR="$PROTOS_WEEBI_DIR/lib/src/generated"

# Read version from .protos-version file in weebi_server root
WEEBI_SERVER_ROOT="$(cd "$PROTOS_WEEBI_DIR/../../.." && pwd)"
VERSION_FILE="$WEEBI_SERVER_ROOT/.protos-version"

PROTOS_VERSION="main"
PROTOS_COMMIT="main"

if [ -f "$VERSION_FILE" ]; then
    echo -e "${CYAN}Reading version from $VERSION_FILE${NC}"
    if grep -q "PROTOS_VERSION=" "$VERSION_FILE"; then
        PROTOS_VERSION=$(grep "PROTOS_VERSION=" "$VERSION_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
    fi
    if grep -q "PROTOS_COMMIT=" "$VERSION_FILE"; then
        PROTOS_COMMIT=$(grep "PROTOS_COMMIT=" "$VERSION_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
    fi
fi

echo -e "${GREEN}Generating Dart code from proto files...${NC}"
echo -e "${CYAN}Proto version: $PROTOS_VERSION${NC}"
echo -e "${CYAN}Proto commit: $PROTOS_COMMIT${NC}"
echo -e "${CYAN}Output directory: $OUTPUT_DIR${NC}"

# Check if protoc is installed
if ! command -v protoc &> /dev/null; then
    echo -e "${RED}ERROR: protoc not found in PATH${NC}"
    echo -e "${YELLOW}Please install protoc: https://grpc.io/docs/protoc-installation/${NC}"
    exit 1
fi

PROTOC_VERSION=$(protoc --version)
echo -e "${GREEN}Found: $PROTOC_VERSION${NC}"

# Check if dart is installed
if ! command -v dart &> /dev/null; then
    echo -e "${RED}ERROR: dart not found in PATH${NC}"
    echo -e "${YELLOW}Please install Dart SDK${NC}"
    exit 1
fi

DART_VERSION=$(dart --version 2>&1 | head -n1)
echo -e "${GREEN}Found: $DART_VERSION${NC}"

# Ensure pub cache bin is in PATH
export PATH="$PATH:$HOME/.pub-cache/bin"

# Check if protoc-gen-dart is installed
PROTOC_GEN_DART_PATH="$HOME/.pub-cache/bin/protoc-gen-dart"
if [ -f "$PROTOC_GEN_DART_PATH" ] && [ -x "$PROTOC_GEN_DART_PATH" ]; then
    echo -e "${GREEN}Found: protoc-gen-dart${NC}"
else
    echo -e "${YELLOW}protoc-gen-dart not found, installing...${NC}"
    echo -e "${CYAN}This may take a moment...${NC}"
    if ! dart pub global activate protoc_plugin; then
        echo -e "${RED}ERROR: protoc-gen-dart installation failed${NC}"
        echo -e "${YELLOW}Try manually: dart pub global activate protoc_plugin${NC}"
        echo -e "${YELLOW}Then add to PATH: export PATH=\"\$PATH:\$HOME/.pub-cache/bin\"${NC}"
        exit 1
    fi
    
    # Verify installation
    if [ ! -f "$PROTOC_GEN_DART_PATH" ] || [ ! -x "$PROTOC_GEN_DART_PATH" ]; then
        echo -e "${RED}ERROR: protoc-gen-dart not found after installation${NC}"
        echo -e "${YELLOW}Expected at: $PROTOC_GEN_DART_PATH${NC}"
        echo -e "${YELLOW}Try manually: dart pub global activate protoc_plugin${NC}"
        exit 1
    fi
    echo -e "${GREEN}protoc-gen-dart installed successfully${NC}"
fi

# Fetch proto files from GitHub
echo -e "${YELLOW}Fetching proto files from GitHub...${NC}"

if [ -d "$PROTOS_DIR/.git" ]; then
    echo -e "${CYAN}Proto repository exists, updating...${NC}"
    cd "$PROTOS_DIR"
    
    # Fetch latest changes
    git fetch origin 2>&1 | grep -v "^From " || true
    
    # Checkout specific version/commit/tag
    if [[ "$PROTOS_COMMIT" =~ ^v?[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        # It's a version tag
        echo -e "${CYAN}Checking out tag: $PROTOS_COMMIT${NC}"
        git checkout "tags/$PROTOS_COMMIT" 2>&1 | grep -v "^HEAD is now at" || git checkout "$PROTOS_COMMIT" 2>&1 | grep -v "^HEAD is now at" || true
    else
        # It's a branch or commit hash
        echo -e "${CYAN}Checking out: $PROTOS_COMMIT${NC}"
        git checkout "$PROTOS_COMMIT" 2>&1 | grep -v "^HEAD is now at" || true
    fi
    
    git pull origin "$PROTOS_COMMIT" 2>&1 | grep -v "^Already up to date" || true
else
    echo -e "${CYAN}Cloning proto repository directly into proto directory...${NC}"
    # Remove proto directory if it exists but is not a git repo
    if [ -d "$PROTOS_DIR" ]; then
        echo -e "${YELLOW}Removing existing proto directory...${NC}"
        rm -rf "$PROTOS_DIR"
    fi
    
    cd "$(dirname "$PROTOS_DIR")"
    git clone "$PROTOS_REPO_URL" "$(basename "$PROTOS_DIR")"
    cd "$PROTOS_DIR"
    
    # Checkout specific version/commit/tag
    if [[ "$PROTOS_COMMIT" =~ ^v?[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        git checkout "tags/$PROTOS_COMMIT" 2>&1 | grep -v "^HEAD is now at" || git checkout "$PROTOS_COMMIT" 2>&1 | grep -v "^HEAD is now at" || true
    else
        git checkout "$PROTOS_COMMIT" 2>&1 | grep -v "^HEAD is now at" || true
    fi
fi

# Verify version
cd "$PROTOS_DIR"
CURRENT_COMMIT=$(git rev-parse HEAD)
CURRENT_TAG=$(git describe --tags --exact-match HEAD 2>/dev/null || echo "")
echo -e "${CYAN}Current commit: $CURRENT_COMMIT${NC}"
if [ -n "$CURRENT_TAG" ]; then
    echo -e "${CYAN}Current tag: $CURRENT_TAG${NC}"
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Generate Dart code
echo -e "${YELLOW}Generating Dart code...${NC}"
cd "$PROTOS_DIR"

# Verify protoc-gen-dart is available (should already be checked above)
if [ ! -f "$PROTOC_GEN_DART_PATH" ] || [ ! -x "$PROTOC_GEN_DART_PATH" ]; then
    echo -e "${RED}ERROR: protoc-gen-dart not found at $PROTOC_GEN_DART_PATH${NC}"
    echo -e "${YELLOW}Please run: dart pub global activate protoc_plugin${NC}"
    exit 1
fi

# Use explicit plugin path to avoid PATH issues
echo -e "${CYAN}Using protoc-gen-dart from: $PROTOC_GEN_DART_PATH${NC}"
protoc \
  --plugin=protoc-gen-dart="$PROTOC_GEN_DART_PATH" \
  --dart_out=grpc:"$OUTPUT_DIR" \
  -I. \
  common/address.proto \
  common/country.proto \
  common/empty.proto \
  common/chained_ids.proto \
  common/g_common.proto \
  common/g_timestamp.proto \
  common/phone.proto \
  article/article.proto \
  article/photo.proto \
  article/category.proto \
  article/article_service.proto \
  boutique.proto \
  btq_chain.proto \
  contact/contact.proto \
  contact/contact_service.proto \
  device.proto \
  firm.proto \
  user.proto \
  user_permissions.proto \
  fence_service.proto \
  ticket/ticket.proto \
  ticket/ticket_type.proto \
  ticket/ticket_service.proto \
  weebi_app_service.proto

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Done! Generated Dart code in $OUTPUT_DIR${NC}"
    echo -e "${CYAN}Proto version used: $PROTOS_VERSION ($CURRENT_COMMIT)${NC}"
else
    echo -e "${RED}ERROR: protoc failed${NC}"
    exit 1
fi

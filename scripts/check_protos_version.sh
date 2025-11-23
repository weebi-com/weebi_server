#!/bin/bash
# Check if weebi_server and weebi_express use the same proto version
# This helps ensure consistency across projects

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEEBI_SERVER_ROOT="$(dirname "$SCRIPT_DIR")"
WEEBI_EXPRESS_ROOT="$(dirname "$WEEBI_SERVER_ROOT")/weebi_express"

SERVER_VERSION_FILE="$WEEBI_SERVER_ROOT/.protos-version"
EXPRESS_VERSION_FILE="$WEEBI_EXPRESS_ROOT/.protos-version"

SERVER_VERSION=""
SERVER_COMMIT=""
EXPRESS_VERSION=""
EXPRESS_COMMIT=""

# Read weebi_server version
if [ -f "$SERVER_VERSION_FILE" ]; then
    if grep -q "PROTOS_VERSION=" "$SERVER_VERSION_FILE"; then
        SERVER_VERSION=$(grep "PROTOS_VERSION=" "$SERVER_VERSION_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
    fi
    if grep -q "PROTOS_COMMIT=" "$SERVER_VERSION_FILE"; then
        SERVER_COMMIT=$(grep "PROTOS_COMMIT=" "$SERVER_VERSION_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
    fi
fi

# Read weebi_express version
if [ -f "$EXPRESS_VERSION_FILE" ]; then
    if grep -q "PROTOS_VERSION=" "$EXPRESS_VERSION_FILE"; then
        EXPRESS_VERSION=$(grep "PROTOS_VERSION=" "$EXPRESS_VERSION_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
    fi
    if grep -q "PROTOS_COMMIT=" "$EXPRESS_VERSION_FILE"; then
        EXPRESS_COMMIT=$(grep "PROTOS_COMMIT=" "$EXPRESS_VERSION_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
    fi
fi

echo -e "${CYAN}=== Proto Version Check ===${NC}"
echo ""
echo -e "${YELLOW}weebi_server:${NC}"
if [ -n "$SERVER_VERSION" ]; then
    echo -e "  Version: ${GREEN}$SERVER_VERSION${NC}"
else
    echo -e "  Version: ${RED}(not set)${NC}"
fi
if [ -n "$SERVER_COMMIT" ]; then
    echo -e "  Commit:  ${GREEN}$SERVER_COMMIT${NC}"
else
    echo -e "  Commit:  ${RED}(not set)${NC}"
fi
echo ""
echo -e "${YELLOW}weebi_express:${NC}"
if [ -n "$EXPRESS_VERSION" ]; then
    echo -e "  Version: ${GREEN}$EXPRESS_VERSION${NC}"
else
    echo -e "  Version: ${RED}(not set)${NC}"
fi
if [ -n "$EXPRESS_COMMIT" ]; then
    echo -e "  Commit:  ${GREEN}$EXPRESS_COMMIT${NC}"
else
    echo -e "  Commit:  ${RED}(not set)${NC}"
fi
echo ""

# Compare versions
VERSIONS_MATCH=false
COMMITS_MATCH=false

if [ "$SERVER_VERSION" = "$EXPRESS_VERSION" ] && [ -n "$SERVER_VERSION" ]; then
    VERSIONS_MATCH=true
fi

if [ "$SERVER_COMMIT" = "$EXPRESS_COMMIT" ] && [ -n "$SERVER_COMMIT" ]; then
    COMMITS_MATCH=true
fi

if [ "$VERSIONS_MATCH" = true ] && [ "$COMMITS_MATCH" = true ]; then
    echo -e "${GREEN}✓ Versions match!${NC}"
    exit 0
else
    echo -e "${RED}✗ Versions do NOT match!${NC}"
    if [ "$VERSIONS_MATCH" = false ]; then
        echo -e "${RED}  Version mismatch: $SERVER_VERSION vs $EXPRESS_VERSION${NC}"
    fi
    if [ "$COMMITS_MATCH" = false ]; then
        echo -e "${RED}  Commit mismatch: $SERVER_COMMIT vs $EXPRESS_COMMIT${NC}"
    fi
    exit 1
fi


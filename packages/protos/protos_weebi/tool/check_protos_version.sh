#!/bin/bash
# Check that both weebi_express and weebi_server use the same proto version
# This script verifies version consistency across projects

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTOS_WEEBI_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$PROTOS_WEEBI_DIR/../../.." && pwd)"
WEEBI_EXPRESS_ROOT="$(cd "$PROJECT_ROOT/../weebi_express" && pwd)"

EXPRESS_VERSION_FILE="$WEEBI_EXPRESS_ROOT/.protos-version"
SERVER_VERSION_FILE="$PROJECT_ROOT/.protos-version"

echo "Checking proto version consistency..."

if [ ! -f "$EXPRESS_VERSION_FILE" ]; then
    echo "ERROR: .protos-version not found in weebi_express"
    exit 1
fi

if [ ! -f "$SERVER_VERSION_FILE" ]; then
    echo "ERROR: .protos-version not found in weebi_server"
    exit 1
fi

EXPRESS_VERSION=$(grep "^PROTOS_VERSION=" "$EXPRESS_VERSION_FILE" | cut -d'=' -f2 | tr -d '\r\n' || echo "")
EXPRESS_COMMIT=$(grep "^PROTOS_COMMIT=" "$EXPRESS_VERSION_FILE" | cut -d'=' -f2 | tr -d '\r\n' || echo "")
SERVER_VERSION=$(grep "^PROTOS_VERSION=" "$SERVER_VERSION_FILE" | cut -d'=' -f2 | tr -d '\r\n' || echo "")
SERVER_COMMIT=$(grep "^PROTOS_COMMIT=" "$SERVER_VERSION_FILE" | cut -d'=' -f2 | tr -d '\r\n' || echo "")

echo "weebi_express: PROTOS_VERSION=$EXPRESS_VERSION, PROTOS_COMMIT=$EXPRESS_COMMIT"
echo "weebi_server:  PROTOS_VERSION=$SERVER_VERSION, PROTOS_COMMIT=$SERVER_COMMIT"

if [ "$EXPRESS_COMMIT" != "$SERVER_COMMIT" ]; then
    echo ""
    echo "WARNING: Proto versions do not match!"
    echo "  weebi_express uses: $EXPRESS_COMMIT"
    echo "  weebi_server uses:  $SERVER_COMMIT"
    echo ""
    echo "Please update .protos-version files to use the same version."
    exit 1
fi

echo ""
echo "✓ Proto versions match!"
exit 0


#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-Debug}"
case "$CONFIG" in
  Debug|debug) PRESET="debug" ;;
  Release|release) PRESET="release" ;;
  *)
    echo "Usage: $0 [Debug|Release]"
    exit 1
    ;;
esac

cmake --preset "$PRESET"
cmake --build --preset "$PRESET"

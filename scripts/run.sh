#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-Debug}"
case "$CONFIG" in
  Debug|debug) BIN="./build/debug/sfml_starter" ;;
  Release|release) BIN="./build/release/sfml_starter" ;;
  *)
    echo "Usage: $0 [Debug|Release]"
    exit 1
    ;;
esac

if [ ! -x "$BIN" ]; then
  echo "Binary not found/executable at: $BIN"
  echo "Tip: build first: ./scripts/build.sh $CONFIG"
  echo "Or locate it with: find build -maxdepth 3 -type f -perm -111"
  exit 1
fi

exec "$BIN"

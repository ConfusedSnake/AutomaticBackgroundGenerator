#!/usr/bin/env bash
set -euo pipefail

if ! command -v xcode-select >/dev/null 2>&1; then
  echo "xcode-select not found. Install Xcode Command Line Tools first."
  exit 1
fi

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install from https://brew.sh and rerun."
  exit 1
fi

brew install cmake ninja

echo "Done. Next: add vcpkg in external/vcpkg and run bootstrap-vcpkg.sh"

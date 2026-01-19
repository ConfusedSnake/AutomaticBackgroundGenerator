#!/usr/bin/env bash
set -euo pipefail

# Ensure vcpkg is present (either as submodule or folder)
if [ ! -d "external/vcpkg" ]; then
  echo "external/vcpkg not found."
  echo "If you intended to use vcpkg as a submodule, add it like this:"
  echo "  git submodule add https://github.com/microsoft/vcpkg external/vcpkg"
  echo "  git submodule update --init --recursive"
  exit 1
fi

# If it is a submodule, update it
if [ -f ".gitmodules" ]; then
  git submodule update --init --recursive
fi

# Bootstrap vcpkg
./external/vcpkg/bootstrap-vcpkg.sh

echo "vcpkg bootstrapped at external/vcpkg."

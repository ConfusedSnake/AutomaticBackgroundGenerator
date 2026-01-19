#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y build-essential cmake ninja-build git

echo "Done. Next: add vcpkg in external/vcpkg and run bootstrap-vcpkg.sh"

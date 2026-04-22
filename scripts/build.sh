#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

export PATH="$PATH:$HOME/.dotnet/tools"

echo "[1/7] Restore packages"
dotnet restore HelloWorldAssignment.sln

echo "[2/7] Verify formatting"
dotnet format HelloWorldAssignment.sln --verify-no-changes --no-restore

echo "[3/7] Build Debug"
dotnet build HelloWorldAssignment.sln -c Debug --no-restore

echo "[4/7] Build Release"
dotnet build HelloWorldAssignment.sln -c Release --no-restore

echo "[5/7] Run unit tests"
dotnet test HelloWorldAssignment.sln -c Release --no-build --no-restore

echo "[6/7] Install DocFX if needed"
if ! command -v docfx >/dev/null 2>&1; then
  dotnet tool install --global docfx
fi

echo "[7/7] Generate documentation"
docfx metadata docs/docfx.json
docfx build docs/docfx.json

echo "Build completed successfully."

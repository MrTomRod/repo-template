#!/usr/bin/env bash
set -euo pipefail

cd /workspace

if [[ -f pixi.toml ]]; then
  pixi install
else
  echo "No pixi.toml found in /workspace. Run 'pixi init' when you are ready."
fi

if [[ -z "${OPENROUTER_API_KEY:-}" ]]; then
  echo "OPENROUTER_API_KEY is not set. Declare it in .devcontainer/.env"
fi

echo "Ready! Run 'opencode' or 'opencode web' to start AI-assisted programming."

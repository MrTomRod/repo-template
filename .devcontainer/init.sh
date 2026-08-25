#!/usr/bin/env bash
set -euo pipefail

cd /workspace

if [[ -f pixi.toml ]]; then
  pixi install
else
  echo "No pixi.toml found in /workspace. Run 'pixi init' when you are ready."
fi

cat <<'EOF'
Ready!

Start OpenCode with: 'opencode', then connect a model provider with '/connect'.

Alternatively, run 'opencode web' to start the web interface.
EOF

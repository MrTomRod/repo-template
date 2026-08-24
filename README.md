# Pixi Sandbox Dev Container

A minimal scaffolding environment combining **Pixi**, **OpenCode**, and **VS Code Dev Containers**.

* **[Pixi](https://pixi.sh)** — Fast package and environment management.
* **[OpenCode](https://opencode.ai)** — AI coding assistant in terminal or web UI via OpenRouter.
* **[Dev Container](https://code.visualstudio.com/docs/devcontainers/containers)** — Sandboxed Linux setup with persistent Pixi caching, extensions, and CLI tools (`vim`, `ripgrep`, `curl`).

## Quick Start

1. **Set API key:** Add your key to `.devcontainer/.env`:
```bash
OPENROUTER_API_KEY=sk-or-v1-...

```

2. **Launch container:** Open folder in VS Code → `Ctrl+Shift+P` → **Dev Containers: Reopen in Container**.
3. **Add dependencies:** Run `pixi init`, then `pixi add ...`.

## Usage & Commands

| Action | Command / Shortcut |
| --- | --- |
| Rebuild environment | `Ctrl+Shift+P` → **Dev Containers: Rebuild Container** |
| Initialize pixi | `pixi init` |
| Start AI (Terminal) | `opencode` |
| Start AI (Browser) | `opencode web` |

## Structure

* `.devcontainer/Dockerfile` — Builds image on `ghcr.io/prefix-dev/pixi:latest` with OpenCode CLI.
* `.devcontainer/devcontainer.json` — Mounts workspace, injects env vars, and sets up persistent Pixi volumes.
* `.devcontainer/init.sh` — Startup script that hooks Pixi into the bash shell and installs dependencies automatically if `pixi.toml` exists.
* `.devcontainer/.env` — Stores `OPENROUTER_API_KEY` (gitignored).
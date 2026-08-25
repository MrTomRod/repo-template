# Pixi Sandbox Dev Container

A minimal scaffolding environment combining **Pixi**, **OpenCode**, and **VS Code Dev Containers**.

* **[Pixi](https://pixi.sh)** — Fast package and environment management.
* **[OpenCode](https://opencode.ai)** — AI coding assistant in terminal or web UI, with model providers connected interactively.
* **[Dev Container](https://code.visualstudio.com/docs/devcontainers/containers)** — Sandboxed Linux setup with persistent Pixi caching, extensions, and CLI tools (`vim`, `ripgrep`, `curl`).

## Quick Start

1. **Launch container:** Open folder in VS Code → `Ctrl+Shift+P` → **Dev Containers: Reopen in Container**.
2. **Connect a model provider:** Run `opencode`, then use `/connect` or run `opencode web` to start the web interface.
3. **Add dependencies:** Run `pixi init`, then `pixi add ...`.

OpenCode stores provider credentials outside the repository, in a Docker volume mounted at `/persist-data`.

## Usage & Commands

| Action | Command / Shortcut |
| --- | --- |
| Rebuild environment | `Ctrl+Shift+P` → **Dev Containers: Rebuild Container** |
| Initialize pixi | `pixi init` |
| Start AI (Terminal) | `opencode`, then `/connect` if no provider is configured |
| Start AI (Browser) | `opencode web` |

## Structure

* `.devcontainer/Dockerfile` — Builds image on `ghcr.io/prefix-dev/pixi:latest` with OpenCode CLI.
* `.devcontainer/devcontainer.json` — Mounts workspace and sets up persistent Pixi volumes.
* `.devcontainer/init.sh` — Startup script that hooks Pixi into the bash shell and installs dependencies automatically if `pixi.toml` exists.

FROM ghcr.io/prefix-dev/pixi:latest

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# Retain apt lists so apt-get update only has to run once
RUN rm -f /etc/apt/apt.conf.d/docker-clean \
    && echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

# Install OpenCode and other niceties for an interactive container
RUN --mount=type=cache,target=/var/cache/apt/archives,sharing=locked \
    apt-get update && apt-get install -y --no-install-recommends \
        curl \
        wget \
        locales \
        git \
        less \
        vim \
        ripgrep \
        unzip \
        tree \
    && locale-gen en_US.UTF-8

# Install Bun
ENV BUN_INSTALL=/root/.bun
ENV PATH="$BUN_INSTALL/bin:$PATH"
RUN curl -fsSL https://bun.sh/install | bash

# Configure Bash history & Pixi integration
RUN cat <<'EOF' >> /root/.bashrc

# Persistent bash history
HISTFILE=/workspace/.xdg/.bash_history
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; ${PROMPT_COMMAND}}"

# Pixi
eval "$(pixi shell-hook)"
EOF

# Store OpenCode stuff in the workspace
ENV XDG_CONFIG_HOME=/workspace/.xdg/config
ENV XDG_DATA_HOME=/workspace/.xdg/data
ENV XDG_CACHE_HOME=/workspace/.xdg/cache
ENV XDG_STATE_HOME=/workspace/.xdg/state

# Install OpenCode via Bun
RUN bun install -g --trust @opencode/cli

# # # Install oh-my-openagent (omo)
# RUN bunx oh-my-openagent install --no-tui --claude=no --gemini=no --copilot=no

# Restore frontend for interactive use
ENV DEBIAN_FRONTEND="dialog"

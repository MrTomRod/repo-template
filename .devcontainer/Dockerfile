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
    && locale-gen en_US.UTF-8 \
    && curl -fsSL https://opencode.ai/install | bash
    
# Configure Bash history & Pixi integration
RUN cat <<'EOF' >> /root/.bashrc

# Persistent bash history
HISTFILE=/persist-data/.bash_history
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; ${PROMPT_COMMAND}}"

# Pixi
eval "$(pixi shell-hook)"
EOF

# Restore frontend for interactive use
ENV DEBIAN_FRONTEND="dialog"

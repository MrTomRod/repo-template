FROM ghcr.io/prefix-dev/pixi:latest

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Get apt cache, keep it for convenience
RUN apt-get update

# Some basic installs
RUN apt-get install -y --no-install-recommends curl wget vim ripgrep

# Install OpenCode binary
RUN curl -fsSL https://opencode.ai/install | bash
ENV PATH="/root/.opencode/bin:${PATH}"

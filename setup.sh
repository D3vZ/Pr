
#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(pwd)"
DIR="$ROOT/.devcontainer"

echo "========================================"
echo " Ubuntu 26.04 Codespaces Setup"
echo " ROOT + DinD + SSH"
echo "========================================"

mkdir -p "$DIR"

# ========================================
# Dockerfile
# ========================================

cat > "$DIR/Dockerfile" <<'DOCKERFILE'
FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV SHELL=/bin/bash
ENV DOCKER_BUILDKIT=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    ca-certificates \
    curl \
    wget \
    git \
    git-lfs \
    openssh-client \
    gnupg \
    jq \
    unzip \
    zip \
    xz-utils \
    tar \
    bash-completion \
    nano \
    vim \
    less \
    htop \
    procps \
    iproute2 \
    iputils-ping \
    dnsutils \
    net-tools \
    netcat-openbsd \
    iptables \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    make \
    cmake \
    rsync \
    socat \
    tini \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces

USER root

CMD ["sleep", "infinity"]
DOCKERFILE

# ========================================
# Dev Container
# ========================================

cat > "$DIR/devcontainer.json" <<'JSON'
{
  "name": "Ubuntu 26.04 ROOT DinD SSH",

  "build": {
    "dockerfile": "Dockerfile",
    "context": ".."
  },

  "features": {
    "ghcr.io/devcontainers/features/docker-in-docker:4": {
      "version": "latest",
      "moby": true,
      "dockerDashComposeVersion": "latest",
      "installDockerBuildx": true
    },

    "ghcr.io/devcontainers/features/sshd:1": {
      "version": "latest",
      "gatewayPorts": "yes"
    }
  },

  "remoteUser": "root",
  "updateRemoteUserUID": false,
  "privileged": true,

  "forwardPorts": [
    2222,
    2375,
    3000,
    3001,
    4000,
    4200,
    5000,
    5001,
    5173,
    5500,
    5678,
    6006,
    7000,
    8000,
    8001,
    8080,
    8081,
    8088,
    8443,
    8888,
    9000,
    9090,
    9091,
    9200,
    9300,
    10000,
    15672,
    27017
  ],

  "portsAttributes": {
    "2222": {
      "label": "SSH",
      "onAutoForward": "notify"
    },
    "2375": {
      "label": "Docker API PRIVATE",
      "onAutoForward": "ignore",
      "visibility": "private"
    },
    "3000": {
      "label": "Development Web",
      "onAutoForward": "openBrowser"
    },
    "5173": {
      "label": "Vite",
      "onAutoForward": "openBrowser"
    },
    "8000": {
      "label": "Application API",
      "onAutoForward": "openBrowser"
    },
    "8080": {
      "label": "Web Server",
      "onAutoForward": "openBrowser"
    },
    "8443": {
      "label": "HTTPS",
      "onAutoForward": "openBrowser",
      "protocol": "https"
    }
  },

  "otherPortsAttributes": {
    "onAutoForward": "notify",
    "visibility": "private"
  },

  "containerEnv": {
    "DOCKER_BUILDKIT": "1",
    "COMPOSE_DOCKER_CLI_BUILD": "1"
  },

  "customizations": {
    "vscode": {
      "extensions": [
        "ms-azuretools.vscode-docker",
        "ms-vscode-remote.remote-containers",
        "eamodio.gitlens"
      ]
    }
  },

  "postCreateCommand": "docker version",

  "waitFor": "postCreateCommand"
}
JSON

# ========================================
# Docker ignore
# ========================================

cat > "$DIR/.dockerignore" <<'IGNORE'
.git
.github
node_modules
vendor
__pycache__
*.pyc
.env
IGNORE

# ========================================
# Validation
# ========================================

echo
echo "Generated configuration:"
find "$DIR" -maxdepth 1 -type f -print

echo
echo "========================================"
echo " SUCCESS!"
echo "========================================"
echo
echo "Environment:"
echo "  OS: Ubuntu 26.04"
echo "  User: root"
echo "  Docker: Docker-in-Docker"
echo "  Compose: V2"
echo "  Buildx: Enabled"
echo "  SSH: GHCR feature"
echo
echo "Next:"
echo "  git add .devcontainer setup.sh"
echo "  git commit -m 'Add Ubuntu 26.04 Codespace DinD'"
echo "  git push"
echo
echo "Then rebuild your Codespace."
echo
echo "After rebuild:"
echo "  whoami"
echo "  docker version"
echo "  docker info"
echo "  docker compose version"
echo "  docker run --rm hello-world"
echo

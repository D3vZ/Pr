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

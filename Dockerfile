# syntax=docker/dockerfile:1.7

FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-client \
    git \
    curl \
    wget \
    ca-certificates \
    gnupg \
    jq \
    nano \
    vim \
    unzip \
    zip \
    iproute2 \
    iputils-ping \
    dnsutils \
    net-tools \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# SSH agent forwarding example.
# Private keys are not copied into the image.

RUN mkdir -p /workspace

WORKDIR /workspace

# Example BuildKit SSH mount:
#
# RUN --mount=type=ssh \
#     git clone git@github.com:OWNER/PRIVATE_REPO.git
#
# Supply SSH forwarding with:
# docker build --ssh default .

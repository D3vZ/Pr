#!/usr/bin/env bash
set -e

sudo apt-get update

sudo apt-get install -y \
    openssh-client \
    git \
    curl \
    jq \
    nano \
    vim \
    ca-certificates

echo "Checking Docker..."

docker --version
docker compose version
docker buildx version

echo "Docker environment installed."

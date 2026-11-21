FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && \
    apt-get install -y \
      git git-lfs curl ca-certificates \
      docker.io && \
    rm -rf /var/lib/apt/lists/*

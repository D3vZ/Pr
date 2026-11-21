FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git \
    git-lfs \
    openssh-client \
    openssh-server \
    sudo \
    bash \
    bash-completion \
    nano \
    vim \
    less \
    unzip \
    zip \
    xz-utils \
    tar \
    gzip \
    bzip2 \
    build-essential \
    gcc \
    g++ \
    make \
    cmake \
    pkg-config \
    autoconf \
    automake \
    libtool \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    pipx \
    nodejs \
    npm \
    jq \
    rsync \
    procps \
    htop \
    psmisc \
    lsof \
    strace \
    iproute2 \
    iputils-ping \
    net-tools \
    dnsutils \
    netcat-openbsd \
    socat \
    traceroute \
    tcpdump \
    openssl \
    gnupg \
    iptables \
    nftables \
    bridge-utils \
    conntrack \
    qemu-system-x86 \
    qemu-utils \
    qemu-block-extra \
    ovmf \
    swtpm \
    libvirt-clients \
    libvirt-daemon-system \
    virtinst \
    virt-viewer \
    xauth \
    fuse3 \
    locales \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p \
    /workspaces \
    /var/run/sshd \
    /var/lib/libvirt/images

WORKDIR /workspaces

CMD ["sleep", "infinity"]

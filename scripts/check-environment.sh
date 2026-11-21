#!/usr/bin/env bash
set -u

echo "===== SYSTEM ====="
cat /etc/os-release

echo
echo "===== USER ====="
id

echo
echo "===== DOCKER ====="
docker version || true
docker compose version || true
docker info || true

echo
echo "===== QEMU ====="
qemu-system-x86_64 --version || true
qemu-img --version || true

echo
echo "===== KVM ====="
if [[ -c /dev/kvm && -r /dev/kvm && -w /dev/kvm ]]; then
    echo "KVM device available"
else
    echo "KVM unavailable"
    echo "Hardware-accelerated Windows VM cannot run here."
fi

echo
echo "===== STORAGE ====="
df -h /workspaces

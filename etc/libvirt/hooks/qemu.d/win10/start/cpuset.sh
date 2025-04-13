#!/bin/bash

# Define which CPUs to assign to the VM
VM_CPUS="4-7,12-15"
SYS_CPUS="0-3,8-11"

ROOT_PATH="/sys/fs/cgroup"
VM_PATH="$ROOT_PATH/vm"

# Optional logging
# exec >> /var/log/libvirt-vm-hook.log 2>&1
# echo "$(date): Starting hook for $VM_NAME"

# Enable cpuset controller in root cgroup (needed once per boot)
echo "+cpuset" > "$ROOT_PATH/cgroup.subtree_control" 2>/dev/null || true

# Create VM cgroup
mkdir -p "$VM_PATH"

# Set memory and CPUs for VM cgroup
echo 0 > "$VM_PATH/cpuset.mems"
echo "$VM_CPUS" > "$VM_PATH/cpuset.cpus"

# Wait for QEMU to start
sleep 2

# Attach VM process
VM_PID=$(pgrep -f "qemu-system" | head -n 1)
if [ -n "$VM_PID" ]; then
    echo "$VM_PID" > "$VM_PATH/cgroup.procs"
    echo "Pinned VM PID $VM_PID to cpuset $VM_CPUS"
else
    echo "Warning: Could not find VM PID"
fi

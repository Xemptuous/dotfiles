#!/bin/bash

SYS_CPUS="0-16"

ROOT_PATH="/sys/fs/cgroup"
VM_PATH="/sys/fs/cgroup/vm"

# Move any remaining processes back to root
if [ -f "$VM_PATH/cgroup.procs" ]; then
    for pid in $(cat "$VM_PATH/cgroup.procs"); do
        echo "$pid" > "$ROOT_PATH/cgroup.procs"
    done
fi

# Cleanup
rmdir "$VM_PATH"



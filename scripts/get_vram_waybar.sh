#!/bin/sh

used_file="/sys/class/drm/card1/device/mem_info_vram_used"
total_file="/sys/class/drm/card1/device/mem_info_vram_total"

if [[ -r $used_file && -r $total_file ]]; then
    used=$(<"$used_file")
    total=$(<"$total_file")

    # Convert bytes to GiB with 1 decimal precision
    used_gib=$(awk "BEGIN {printf \"%.1f\", $used / (1024*1024*1024)}")
    total_gib=$(awk "BEGIN {printf \"%.1f\", $total / (1024*1024*1024)}")

    # echo "${used_gib}/${total_gib}"
    echo "{\"text\": \"GPU VRAM: ${used_gib}/${total_gib}\", \"tooltip\": \"Used VRAM: ${used_gib} GiB\nTotal VRAM: ${total_gib} GiB\", \"class\": \"\"}" | jq --unbuffered --compact-output
    # echo "{\"used\": \": \"${used_gib}\", \"total\": \"${total_gib}\", \"tooltip\": \"Used VRAM: ${used_gib} GiB\nTotal VRAM: ${total_gib} GiB\"}"
else
    echo '{"text": "GPU VRAM: unavailable", "tooltip": "Could not read VRAM info"}'
fi

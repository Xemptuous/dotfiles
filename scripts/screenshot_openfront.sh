#!/bin/sh

dir="$HOME/Pictures/Screenshots/OpenFrontio"
prefix=$1

if [ -z "$prefix" ]; then
  echo "Usage: $0 [ffa|team]"
  exit 1
fi

# Find the highest number used for this prefix
number=$(find "$dir" -name "${prefix}*.png" \
  | sed -E "s|.*/${prefix}([0-9]+)\.png|\1|" \
  | sort -n \
  | tail -n 1)


[ -z "$number" ] && number=1 || number=$((number + 1))

filename="${prefix}${number}.png"

grim -o DP-1 "$dir/$filename"

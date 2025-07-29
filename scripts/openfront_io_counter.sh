#!/bin/bash

dir="$HOME/Pictures/Screenshots/OpenFrontio"
output_file="$HOME/.openfrontio_wins"

while true; do
    inotifywait -q -e create -e delete -e moved_to -e moved_from "$dir"
    count=$(find "$dir" -name "*.png" | wc -l)
    echo "$count" > "$output_file"
done

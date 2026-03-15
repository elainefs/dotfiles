#!/bin/bash

selected=$(swaymsg -t get_tree | jq -r '.nodes[].nodes[]? | .. | select(.type? == "con" and .name? != null) | "\(.name) — [ID: \(.id)]"' | rofi -dmenu -i -m 1 -p "Windows")

if [ -n "$selected" ]; then
    win_id=$(echo "$selected" | grep -oP '\[ID: \K[0-9]+(?=\])')

    swaymsg "[con_id=$win_id] focus"
fi

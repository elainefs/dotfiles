#!/bin/bash

window_list=$(swaymsg -t get_tree | jq -r '
    .. 
    | select(.type? == "con" or .type? == "floating_con") 
    | select(.name? != null and .name? != "__i3_scratch") 
    | "\(.name) \tID:\(.id)"')

selected_name=$(echo "$window_list" | cut -f1 | rofi -dmenu -i -m 1 -p "Windows")

if [ -n "$selected_name" ]; then
    win_id=$(echo "$window_list" | grep "^$selected_name" | awk -F'ID:' '{print $2}' | head -n 1)

    swaymsg "[con_id=$win_id] focus"
fi

#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

screen='󰹑'
area=''
edit='󰷜'

options=$(printf "%s\n%s\n%s" "$screen" "$area" "$edit")

selected=$(echo -e "$options" | rofi -dmenu -i -m 1 -theme "$HOME/.config/rofi/screenshot.rasi")

if [ -z "$selected" ]; then
    exit 0
fi

case "$selected" in
"$screen") grim "$FILE" ;;
"$area") grim -g "$(slurp)" "$FILE" ;;
"$edit")
    grim -g "$(slurp)" - | swappy -f -
    notify-send "Screenshot saved"
    exit 0
    ;;
*) exit 0 ;;
esac

wl-copy <"$FILE"
if [ -f "$FILE" ]; then
    notify-send "Screenshot saved"
fi

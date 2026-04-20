#!/bin/bash

lock=''
suspend='󰤄'
hibernate='󰒲'
reboot='󰜉'
shutdown='⏻'

options=$(printf "%s\n%s\n%s\n%s\n%s" "$lock" "$suspend" "$hibernate" "$reboot" "$shutdown")

selected=$(echo -e "$options" | rofi -dmenu -i -m 1 -theme "$HOME/.config/rofi/power.rasi")

if [ -z "$selected" ]; then
  exit 0
fi

case "$selected" in
"$lock") swaylock ;;
"$suspend") systemctl suspend ;;
"$hibernate") systemctl hibernate ;;
"$reboot") systemctl reboot ;;
"$shutdown") systemctl poweroff ;;
*) exit 0 ;;
esac

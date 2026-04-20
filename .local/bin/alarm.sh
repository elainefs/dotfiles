#!/bin/bash

HORA=$(rofi -dmenu -p "Time (HH:MM):")
MENSAGEM=$(rofi -dmenu -p "Reason:")

if [[ -n "$HORA" && -n "$MENSAGEM" ]]; then
    CMD="paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga && notify-send 'Alarm' '$MENSAGEM' -u critical -t 0"
    
    echo "export DISPLAY=:0; export WAYLAND_DISPLAY=wayland-1; $CMD" | at "$HORA"
    
    notify-send "Scheduled!" "Alarm for $HORA successfully set!"
fi

#!/bin/bash

WALLPAPER="$HOME/Pictures/wallpaper.jpg"

QUERY="dark,mountain"
# 'purity=100' (SFW), 'sorting=random', 'toprange=1M' (top of month)
URL="https://wallhaven.cc/api/v1/search?q=$QUERY&purity=100&sorting=random&toprange=1M&atleast=1920x1080"

IMAGE_URL=$(curl -s "$URL" | jq -r '.data[0].path')

curl -s "$IMAGE_URL" > "$WALLPAPER"

swaymsg output "*" background "$WALLPAPER" fill

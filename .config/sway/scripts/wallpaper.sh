#!/bin/bash

WALLPAPER="$HOME/Pictures/wallpaper.jpg"
QUERY="dark,mountain"
URL="https://wallhaven.cc/api/v1/search?q=$QUERY&purity=100&sorting=random&toprange=1M&atleast=1920x1080"

IMAGE_URL=$(curl -s -L -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0" "$URL" | jq -r '.data[0].path')

if [ -z "$IMAGE_URL" ] || [ "$IMAGE_URL" == "null" ]; then
    echo "Error: Could not get the image URL."
    exit 1
fi

TEMP_WALLPAPER="/tmp/wallpaper_new.jpg"
if curl -sL -A "Mozilla/5.0" "$IMAGE_URL" -o "$TEMP_WALLPAPER"; then
    mv "$TEMP_WALLPAPER" "$WALLPAPER"
    swaymsg output "*" background "$WALLPAPER" fill
else
    echo "Error downloading the image."
    exit 1
fi

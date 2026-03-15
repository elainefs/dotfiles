#!/bin/bash

dados=$(curl -s "wttr.in/Ananindeua?format=%l+%c+%t+%h+%m+%w+%u+%S+%s+%T")
read -r loc cond temp hum moon win uv sunrise sunset time <<<"$dados"

jq -cn \
    --arg text "$cond $temp" \
    --arg tooltip "Location: $loc
Weather: $cond
Temperature: $temp
Humidity: $hum
Moon: $moon
Wind: $win
UV: $uv
Sunrise: $sunrise
Sunset: $sunset
Time: $time" \
    '{text: $text, tooltip: $tooltip}'

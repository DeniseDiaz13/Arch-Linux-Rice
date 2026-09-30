#!/bin/bash

export LC_ALL=C.UTF-8
export PYTHONUNBUFFERED=1

zscroll -l 26 \
        --delay 0.2 \
        --scroll-padding "   |   " \
        --match-command "playerctl status 2>/dev/null" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true \
        --eval-in-shell true \
        'status=$(playerctl status 2>/dev/null); meta=$(playerctl metadata --format "{{artist}} - {{title}}" 2>/dev/null); if [ "$status" = "Playing" ]; then echo "󰝚 $meta"; elif [ "$status" = "Paused" ]; then echo "󰏥 $meta"; else echo "󰝛 Nothing playing"; fi'

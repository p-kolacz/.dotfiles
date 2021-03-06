#!/bin/sh

# val=$(cat $(dirname $0)/../share/entities.txt | dmenu -i -l 20 -h 32 | cut -d ' ' -f2)
val=$(cat $(dirname $0)/../share/entities.txt | run-rofi -dmenu | cut -d ' ' -f1)

[ -n "$val" ] && printf "$val" | xclip -selection clipboard && notify-send "$val copied" &


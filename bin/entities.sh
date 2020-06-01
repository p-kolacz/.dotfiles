#!/bin/sh

val=$(cat ~/.local/share/entities | dmenu -i -l 30 -h 32 | cut -d ' ' -f2)

[ -n "$val" ] && printf "$val" | xclip -selection clipboard && notify-send "$val copied" &


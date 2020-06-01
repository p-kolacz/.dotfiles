#!/bin/sh

val=$(cat ~/.local/share/emoji-fa.txt | dmenu -i -l 30 -h 32 | sed "s/ .*//")

[ -n "$val" ] && printf "$val" | xclip -selection clipboard && notify-send "$val copied" &


#!/bin/bash

val=$(cat $(dirname $0)/../share/emoji-fa.txt | dmenu -i -l 20 -h 32 -fn "Noto Color Emoji" | sed "s/ .*//")

[ -n "$val" ] && printf "$val" | xclip -selection clipboard && notify-send "$val copied" &


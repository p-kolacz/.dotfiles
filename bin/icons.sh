#!/bin/sh

val=$(cat $(dirname $0)/../share/nerd-icons.txt | dmenu -i -l 20 -h 32 | cut -d ' ' -f1)

[ -n "$val" ] && printf "$val" | xclip -selection clipboard && notify-send "$val copied" &


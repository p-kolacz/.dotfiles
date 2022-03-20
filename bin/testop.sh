#!/bin/sh

val=$(cat $(dirname $0)/../share/txt/bash-test.txt | dmenu -i -l 28 -h 32 | cut -d ' ' -f1)

# [ -n "$val" ] && printf "$val" | xclip -selection clipboard && notify-send "$val copied" &


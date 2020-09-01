#!/bin/bash

if ! pgrep -x polybar > /dev/null; then
	for m in $(xrandr --current | grep " connected" | cut -d" " -f1); do
		export MONITOR=$m
		polybar --reload main &
	done
else
	exit 1
fi


#!/bin/bash

# numDisplays=$(xrandr --current | grep '\bconnected' | wc -l)

if xrandr | grep "eDP-1 connected" > /dev/null; then   # Intel GPU
	internal=eDP-1
	central=DP-3
	right=HDMI-2
	echo "Intel GPU detected"
else  # nVidia GPU
	internal=eDP-1-1
	central=DP-1-3
	right=HDMI-1-2
	echo "nVidia GPU detected"
fi


if xrandr | grep "$central disconnected" > /dev/null; then    # mobile mode
	xrandr \
		--output "$internal" --auto --primary
	echo "internal monitor only"
else    # docked mode
	xrandr \
		--output $internal --auto --pos 0x272 \
		--output $central  --auto --pos 1920x0 --primary \
		--output $right    --auto --pos 3840x150
	light -S 50
	echo "internal central right"
fi

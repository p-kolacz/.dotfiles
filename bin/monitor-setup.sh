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
	xrandr --setprovideroutputsource modesetting NVIDIA-0
	echo "nVidia GPU detected"
fi


if xrandr | grep "$central disconnected" > /dev/null; then    # mobile mode
	xrandr \
		--output "$internal" --auto --primary
	echo "internal monitor only"
else    # docked mode
	xrandr \
		--output $right    --auto --pos 0x150 \
		--output $central  --auto --pos 1680x0 --primary \
		--output $internal --auto --pos 3840x272
	xrandr --dpi 96
	echo "internal central right"
fi
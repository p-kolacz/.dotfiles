#!/bin/bash

xrandr_output=$(xrandr)
# numDisplays=$(echo $xrandr_output | grep '\sconnected' | wc -l)

if echo $xrandr_output | grep -q "eDP-1 connected"; then   # Intel GPU
	internal=eDP-1
	central=DP-3
	right=HDMI-2
	echo intel > "/tmp/gpu"
	echo "Intel GPU detected"
else  # nVidia GPU
	internal=eDP-1-1
	central=DP-1-3
	right=HDMI-1-2
	xrandr --setprovideroutputsource modesetting NVIDIA-0
	echo nvidia > "/tmp/gpu"
	echo "nVidia GPU detected"
fi


if echo $xrandr_output | grep -q "$central disconnected"; then    # mobile mode
	xrandr \
		--output "$internal" --auto --primary
	echo "internal monitor only"
else    # docked mode
	xrandr \
		--output "$right"    --auto --pos 0x120 \
		--output "$central"  --auto --pos 1680x0 --primary \
		--output "$internal" --auto --pos 3600x260 \
		--dpi 96
	echo "internal central right"
fi


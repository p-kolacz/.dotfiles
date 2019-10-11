#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar > /dev/null; do sleep 0.2; done

# Launch polybar
mon_count=$(xrandr -q | grep ' connected' | wc -l)

eDP=$(xrandr -q | grep '^eDP-.* connected' | awk '{print $1}')
DP=$(xrandr -q | grep '^DP-.* connected' | awk '{print $1}')
HDMI=$(xrandr -q | grep '^HDMI-.* connected' | awk '{print $1}')

case "$mon_count" in
	1)
		MONITOR=$eDP polybar --reload main &
		;;
	2)   
		for m in $(polybar --list-monitors | grep . | cut -d":" -f1); do
			MONITOR=$m polybar --reload main &
		done
		;;
	3)
		MONITOR=$eDP polybar --reload left &
		MONITOR=$DP polybar --reload center &
		MONITOR=$HDMI polybar --reload right &
		;;
	*)
		for m in $(polybar --list-monitors | grep . | cut -d":" -f1); do
			MONITOR=$m polybar --reload main &
		done
		;;
esac

# polybar top &

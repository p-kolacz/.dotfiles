#!/bin/bash

if ! pgrep -x lemonbar.sh > /dev/null; then
	monitors=$(xrandr --current | grep "\sconnected" | wc -l)
	path=$(dirname $0)

	PANEL_FIFO=/tmp/panel-fifo
	[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
	mkfifo "$PANEL_FIFO"
	# bspc subscribe report > "$PANEL_FIFO" &

	for ((i=0; i<$monitors; ++i)); do
		$path/lemonbar.sh $i "$PANEL_FIFO" &
		# echo "%{S$i} $i" | lemonbar -B "#FF000000" -F "#FFFFFFFF" -p &
		# echo "%{S$i} $i" | lemonbar -F "#FFFFFFFF" -p &
	done
else
	exit 1
fi


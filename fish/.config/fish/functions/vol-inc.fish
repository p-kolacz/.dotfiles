function vol-inc
	pactl set-sink-volume @DEFAULT_SINK@ +1000
	# set vol (vol-get)
	# notify-send.sh "Vol: $vol" -t 2000 --replace-file=/tmp/notification-volume --hint string:image-path:audio-volume-high
	# notify-send "Vol: $vol" -t 2000 --hint string:image-path:audio-volume-high
end

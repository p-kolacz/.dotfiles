function mute-get
	pacmd list-sinks | grep mute | head -n 1 | awk '{print $2}'
end


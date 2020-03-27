function vol-get
	pacmd list-sinks | grep volume | head -n 1 | awk '{print $5}'
end


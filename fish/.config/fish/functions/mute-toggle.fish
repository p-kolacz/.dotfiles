function mute-toggle
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	set mute (mute-get)
	if test "$mute" = "yes"
		set icon "audio-volume-muted"
	else
		set icon "audio-volume-high"
	end
	notify-send "Volume muted:" $mute -t 2000 --hint string:image-path:$icon
end

	

#!/bin/bash

# Dependencies: maim xclip libnotify

dir="$HOME/Downloads"

types=(
	"Selection -> clipboard"
	"Window -> clipboard"
	"Screen -> clipboard"
	"Selection -> file"
	"Window -> file"
	"Screen -> file"
)

filename() {
	echo -n $dir/$(date +%FT%T).png
}

notify() {
	[[ -z $1 ]] &&
		notify-send -u low "Screenshot copied" "to clipboard" ||
		notify-send -u low -i "$1" "Screenshot taken" "$1"
}

sel=$(printf "%s\n" "${types[@]}" | dmenu -i -h 32 -p "  " -l 10)

case $sel in
	${types[0]})
		maim -s | xclip -selection clipboard -t image/png
		# scrot -s /tmp/screenshot -e "xclip -selection clipboard -t image/png -i /tmp/screenshot" &&
		notify
		;;
	${types[1]})
		maim -u -B -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
		notify
		;;
	${types[2]})
		maim -u | xclip -selection clipboard -t image/png
		notify
		;;

	${types[3]})
		file=$(filename)
		maim -s $file &&
		notify $file
		;;
	${types[4]})
		file=$(filename)
		maim -u -B -i $(xdotool getactivewindow) $file &&
		notify $file
		;;
	${types[5]})
		file=$(filename)
		maim -u $file &&
		notify $file
		;;
esac


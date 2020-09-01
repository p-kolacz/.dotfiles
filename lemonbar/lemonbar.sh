#!/bin/bash

[ $# -ne 2 ] && echo "Usage: lemonbar.sh monitor fifo_file" && exit 1

monitor=$1
PANEL_FIFO=$2

# SEP="   "
SEP=" "

FG=$(xrdb-color fg)
BG=$(xrdb-color bg)
RED=$(xrdb-color red)
BLUE=$(xrdb-color blue)

source $(dirname $0)/../lib/blocks.sh

while true; do
	echo D$(date-blk)
	timer=$(timer-blk)
	[[ -n $timer ]] && echo T$timer$SEP || echo T
	titrak=$(titrak-blk)
	[[ -n $titrak ]] && echo K$titrak$SEP || echo K
	sleep 1
done > $PANEL_FIFO &

while true; do
	echo C$(cpu-blk)
	sleep 5
done > $PANEL_FIFO &

while true; do
	echo B$(bat-blk $RED)
	sleep 10
done > $PANEL_FIFO &

gpu=$(gpu-blk)

# $(dirname $0)/barinput.sh |


cat "$PANEL_FIFO" | while read -r line; do
	case $line in
		D*)
			date=${line#?} ;;
		C*)
			cpu=${line#?} ;;
		B*)
			bat=${line#?} ;;
		T*)
			timer=${line#?} ;;
		K*)
			titrak=${line#?} ;;
		W*)
			desktops=
			IFS=":"
			readarray -td: items <<< $line;
			for item in ${items[@]}; do
				value=${item#?}
				case $item in
					O*) # occupied focused
						desktops+="%{+u}  $value  %{-u}" ;;
					o*) # occupied unfocused
						desktops+="  $value  " ;;
					U*) # urgent focused
						desktops+="  $value  " ;;
					u*) # urgent unfocused
						desktops+="%{B$RED}  $value  %{B-}" ;;
					F*) # free focused
						desktops+="%{+u}  $value  %{-u}" ;;
					# f*) # free unfocused
						# desktops+="$value " ;;
				esac
			done
	esac
	# echo "%{S$monitor}%{F$FG} $desktops%{r}$titrak $timer $bat$SEP$cpu$SEP$gpu$SEP$date "
	echo "%{S$monitor}%{B$77000000} $desktops%{r}$titrak $timer $bat$SEP$cpu$SEP$gpu$SEP$date "
# done  | lemonbar -F $FG -U $BLUE -u 5 -f "ui:size=12" -g x32
done  | lemonbar -B $BG -F $FG -U $BLUE -u 5 -f "ui:size=12" -g x32


#!/bin/bash

sleep_time=5
sep=" +< "

bat() {
	local power=$(cat /sys/class/power_supply/BAT1/capacity)
	local status=$(cat /sys/class/power_supply/BAT1/status)
	local icon=$([ $status == Charging ] && echo "" || echo "")
	local fg=$([ $power -lt 16 ] && echo "+@fg=1;" || echo "")
	echo "$fg$icon +<$power%+@fg=0;"
}

cpu() {
	local temp=$(sensors | grep Package | cut -d" " -f5 | cut -d . -f1 | tr -d +)
	local fg=$([ $temp -gt 70 ] && echo "+@fg=1;" || echo "")
	echo "$fg +<$temp+@fg=0;"
}

gpu() {
	local file="$HOME/.cache/gpu"
	[ -e $file ] && ([ $(cat $file) == intel ] && echo -n  || echo -n  ) || echo X
}

timer() {
	local file=/tmp/timer
	if [ -e $file ]; then
		local start=$(cat $file)
		local now=$(date +%s)
		echo "祥 "$((start-now))s$sep
	fi
}

left="+R +S (+M) +F +L"
center="+|C +C "
right="+|R"

gpu=$(gpu)

while :; do
	echo $left $center $right $(timer) $(bat)$sep$(cpu)$sep$gpu $sep
	sleep $sleep_time
done


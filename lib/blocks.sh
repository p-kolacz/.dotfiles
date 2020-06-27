
bat() {
	local power=$(cat /sys/class/power_supply/BAT*/capacity)
	local status=$(cat /sys/class/power_supply/BAT*/status)
	local icon=$([ $status == Charging ] && echo "" || echo "")
	local fg=$([ $power -lt 16 ] && echo "+@fg=1;" || echo "")
	# echo "$fg$icon +<$power%+@fg=0;"
	echo "$icon $power%"
}

cpu() {
	local temp=$(sensors | grep Package | cut -d" " -f5 | cut -d . -f1 | tr -d +)
	local fg=$([ $temp -gt 70 ] && echo "+@fg=1;" || echo "")
	# echo "$fg +<$temp+@fg=0;"
	echo " $temp"
}

gpu() {
	local file="/tmp/gpu"
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

#!/bin/fish


set mount_dir "$HOME/.local/mnt/"

# set and_devices ""
# simple-mtpfs -l | while read line;
cat "$HOME/test" | while read line
	set device_id (echo $line | sed "s/:.*//")
	# mounted=$(grep -qs "${mount_dir}android${device_id}" /proc/mounts)
	set -a and_devices $line
	# and_devices+="$line\n"
	# and_devices+="sdfa"
	# echo $and_devices
	# echo (string sub -l -1 (string split ' ' $line)[1])
	# echo $device_id
end

echo (count $and_devices)
echo $and_devices
echo $and_devices | dmenu -l 5

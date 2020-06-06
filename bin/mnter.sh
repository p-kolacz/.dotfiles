#!/bin/bash

mount_dir="$HOME/mnt"
notify_title=MonteR
delimiter="|"
and_icon=
usb_icon=
mmc_icon=兩

and_drives() {
	simple-mtpfs -l 2> /dev/null | sed -r "s/(.): (.*)/\2 \1/" | sed "s/ /-/g"
}

# dev_drives usb|mmc
dev_drives() {
	find /dev/disk/by-id/$1-*-part* -printf "%f\n" 2> /dev/null
}

# is_mounted dir
is_mounted() {
	grep -qs "$mount_dir/$1" /proc/mounts
}

prepend_icon() {
	while read line; do
		echo "$1 $line"
	done
}

append_status() {
	while read line; do
		echo "$line" | sed 's/$/'"$(is_mounted $line && echo " Mounted" || echo " Unmounted")"'/'
	done
}

notify() {
	notify-send "$notify_title" "$1"
}

process() {
	local icon=$(echo $1 | cut -d " " -f1)
	local name=$(echo $1 | cut -d " " -f2)
	local type=$([ $icon == $and_icon ] && echo android || echo dev)
	local dir="$mount_dir/$name"
	local operation=$(is_mounted $name && echo unmount || echo mount)

	[ -d "$dir" ] || mkdir "$dir"

	${operation}_$type $name "$dir" && notify "$icon $name successfully ${operation}ed" || notify "😥 Unable to $operation $name"
}

mount_android() {
	local id=$(echo $1 | rev | cut -d - -f1 | rev)
	simple-mtpfs --device $id "$2"
}

mount_dev() {
	sudo mount -o uid=1000,gid=1000,fmask=113,dmask=002 "/dev/disk/by-id/$1" "$2"
}

unmount_android() {
	fusermount -u "$mount_dir/$1"
}

unmount_dev() {
	sudo umount "$mount_dir/$1"
}

anddrives=$(and_drives | append_status android | prepend_icon $and_icon)
usbdrives=$(dev_drives usb | append_status usb | prepend_icon $usb_icon)
mmcdrives=$(dev_drives mmc | append_status mmc | prepend_icon $mmc_icon)

drives=$(echo -e "$anddrives\n$mmcdrives\n$usbdrives" | sed "/^$/d")
[ -z "$drives" ] && { notify "No drives found"; exit 1; }

selected=$(echo "$drives" | dmenu -i -l 5 -h 32) || exit 1
process "$selected"


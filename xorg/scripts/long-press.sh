#!/bin/bash
delay=0.25 # seconds

id=$2

shm="/dev/shm/btn-held-status-$id"

case $1 in
	press)
		echo "press" > $shm
		sleep $delay

		read line < $shm
		if [ $line = "press" ]; then
			echo "idle" > $shm
			xdotool key $3
		fi
		;;
	release)
		read line < $shm
		if [ $line = "press" ]; then
			echo "idle" > $shm
			xdotool key $3
		fi
		;;
	*)
		exit 1
esac

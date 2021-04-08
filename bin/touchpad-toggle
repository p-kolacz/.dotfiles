#!/bin/bash

id=$(xinput | grep -oP "Touchpad.*id=\K\d+")

if xinput --list-props $id | grep -q "Device Enabled.*:.*1"; then
	xinput disable $id
	notify-send -u low "Touchpad disabled"
else
	xinput enable $id
	notify-send -u low "Touchpad enabled"
fi


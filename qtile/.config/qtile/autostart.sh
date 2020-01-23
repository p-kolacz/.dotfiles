#!/bin/sh

compton -b
xset r rate 250 35
nitrogen --restore &
seafile-applet &
syncthing-gtk &
keepassxc &


#!/bin/bash

LOG="/var/log/events.log"
echo "[$(date "+%F %T")] Monitor change event" >> $LOG

X_USER=$(w -hs | head -1 | awk '{print $1}')
export XAUTHORITY=/home/$X_USER/.Xauthority
export DISPLAY=":0"

/home/piotr/.dotfiles/xorg/scripts/monitor-setup.sh >> $LOG 2>&1

# nitrogen --restore >> $LOG 2>&1

#!/bin/bash

LOG="/var/log/events.log"
echo "[$(date "+%F %T")] [kb-in] Keyboard in event" >> $LOG

X_USER=$(w -hs | head -1 | awk '{print $1}')
echo "[$(date "+%F %T")] [kb-in] Detected user: $X_USER" >> $LOG

export X_USER=$X_USER
export XAUTHORITY=/home/$X_USER/.Xauthority
export DISPLAY=":0"

/home/piotr/.dotfiles/xorg/scripts/kb-setup.sh >> $LOG 2>&1 &

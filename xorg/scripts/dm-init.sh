#!/bin/bash
LOG="/var/log/dm-init.log"

echo "[$(date "+%F %T")] [dm-init.sh] Init" >> $LOG

# xrandr --setprovideroutputsource modesetting NVIDIA-0 >> $LOG 2>&1
# xrandr --auto >> $LOG 2>&1

/home/piotr/.dotfiles/xorg/scripts/monitor-setup.sh

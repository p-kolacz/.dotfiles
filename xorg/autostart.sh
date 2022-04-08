$DOTFILES/xorg/monitor-setup.sh > $XDG_STATE_HOME/xrandr.log
wallpaper restore &
picom -b
setxkbmap -option caps:escape
kbrate.sh
seafile-applet &
syncthing -no-restart -logfile="$XDG_STATE_HOME/syncthing.log" > $XDG_STATE_HOME/syncthing_.log &
dunstdaemonctl restart &
bluetoothctl power on &


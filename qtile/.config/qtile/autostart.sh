#!/bin/sh

# KB
xmodmap $HOME/.dotfiles/xorg/conf/.Xmodmap
xbindkeys -f $HOME/.dotfiles/xorg/conf/.xbindkeysrc
xset r rate 250 35

# Apps
compton -b
nitrogen --restore &
seafile-applet &
syncthing-gtk &
# keepassxc &


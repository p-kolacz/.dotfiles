#!/bin/sh

# KB
xmodmap $HOME/.dotfiles/xorg/conf/.Xmodmap
# xbindkeys -f $HOME/.dotfiles/xorg/conf/.xbindkeysrc
sxhkd &
xset r rate 250 40

# Apps
nitrogen --restore &
seafile-applet &
syncthing-gtk &
compton -b &


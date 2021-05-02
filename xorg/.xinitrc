#!/bin/sh

# source ~/.dotfiles/themes/tokyonight-storm.sh

WM=bspwm

wallpaper restore

userresources=$HOME/.dotfiles/xorg/.Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

[ -n $THEME ] && xrdb -merge $HOME/.dotfiles/themes/$THEME.xresources

source $HOME/.dotfiles/xorg/.xprofile
$HOME/.dotfiles/bin/monitor-setup.sh > $HOME/.local/share/xorg/xrandr.log

# KB
setxkbmap -option caps:escape
kbrate.sh
export SXHKD_SHELL=/bin/bash
{ [ $WM == bspwm ] && 
	sxhkd -c ~/.config/sxhkd/sxhkdrc ~/.config/bspwm/sxhkdrc ||
	sxhkd; } &

# Apps
seafile-applet &
syncthing -no-restart -logfile="$HOME/.local/log/syncthing.log" &
picom -b

exec $WM > $HOME/.local/log/$WM.log 2>&1
# exec qtile > $HOME/.local/share/xorg/qtile.log
# exec spectrwm > $HOME/.local/share/xorg/spectrwm.log 2>&1 
# exec bspwm > $HOME/.local/share/xorg/bspwm.log 2>&1 


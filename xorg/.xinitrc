#!/bin/sh

WM=bspwm
# WM=spectrwm

userresources=$HOME/.dotfiles/xorg/.Xresources
# usermodmap=$HOME/.dotfiles/xorg/conf/.Xmodmap
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
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
restore-wallpaper.sh
seafile-applet &
syncthing -no-restart -logfile="$HOME/.local/log/syncthing.log" &
compton -b

exec $WM > $HOME/.local/log/$WM.log 2>&1
# exec qtile > $HOME/.local/share/xorg/qtile.log
# exec spectrwm > $HOME/.local/share/xorg/spectrwm.log 2>&1 
# exec bspwm > $HOME/.local/share/xorg/bspwm.log 2>&1 


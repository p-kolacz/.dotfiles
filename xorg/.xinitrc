#!/bin/sh

userresources=$HOME/.dotfiles/xorg/.Xresources
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

source $HOME/.dotfiles/xorg/.xprofile
$HOME/.dotfiles/bin/monitor-setup.sh > $HOME/.local/share/xorg/xrandr.log

# KB
xmodmap $HOME/.dotfiles/xorg/conf/.Xmodmap
sxhkd &
xset r rate 250 40

# Apps
nitrogen --restore &
seafile-applet &
syncthing &
compton -b &

# exec qtile > $HOME/.local/share/xorg/qtile.log
exec spectrwm > $HOME/.local/share/xorg/spectrwm.log


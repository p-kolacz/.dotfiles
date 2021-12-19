# https://makefiletutorial.com/

.PHONY: help install yay wifi xorg bspwm audio bluetooth printer printer-dcpt500w
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z0-9-]+:.*' $(MAKEFILE_LIST) | sed 's/:/ /'

install:
	stow -v --no-folding aseprite lazygit vifm xnview 
	stow -v */

yay:
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay && makepkg -si

wifi:
	pacman -S --needed networkmanager crda
	systemctl enable NetworkManager.service
	systemctl start NetworkManager.service

xorg:
	pacman -S --needed xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xev xdotool xautomation xclip

bspwm:
	pacman -S --needed bspwm sxhkd

audio:
	pacman -S --needed pulseaudio pulseaudio-equalizer-ladspa pavucontrol playerctl alsa-utils

bluetooth:
	pacman -S --needed bluez-utils pulseaudio-bluetooth
	systemctl enable bluetooth.service
	systemctl start bluetooth.service

printer:
	pacman -S --needed cups
	systemctl enable cups.service
	systemctl start cups.service

printer-dcpt500w: printer yay
	yay -S brother-dcpt500w


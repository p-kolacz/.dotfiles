# https://makefiletutorial.com/

tmp = $(HOME)/tmp

.DEFAULT_GOAL := help
.PHONY: help stow time wifi xorg bspwm audio bluetooth printer printer-dcpt500w yay


help:
	@grep -E '^[a-zA-Z0-9-]+:.*' $(MAKEFILE_LIST) | sed 's/:/ /'

stow:
	stow -v --no-folding aseprite vifm xnview
	stow -v */

time:
	systemctl enable systemd-timesyncd.service
	systemctl start systemd-timesyncd.service

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

printer-dcpt500w:
	yay -S brother-dcpt500w

yay:
	mkdir -p $(tmp)
	git clone https://aur.archlinux.org/yay.git $(tmp)/yay
	cd $(tmp)/yay && makepkg -si


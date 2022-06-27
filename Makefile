# https://makefiletutorial.com/

.PHONY: help setup terminal xorg bspwm audio fonts DE wifi bluetooth laptop printer printer-dcpt500w wacom devops redox
.DEFAULT_GOAL=help

install=sudo pacman -S --needed
ynstall=yay -S --needed
enable=sudo systemctl enable
start=sudo systemctl start

help:
	@egrep '^[a-zA-Z0-9-]+:.*' $(MAKEFILE_LIST) | sed 's/:$$/ /'

setup:
	mkdir -p $(HOME)/.config/ $(HOME)/.local/share/ $(HOME)/.local/state/
	$(install) stow
	stow -v --no-folding aseprite xnview 
	stow -v */
	pacman -Qs yay > /dev/null || (git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si)

terminal:
	$(install) man-db man-pages htop ripgrep p7zip terminus-font
	$(install) fzf highlight htop lazygit mediainfo python-pip smartmontools trash-cli
	$(install) neovim bash-language-server lua-language-server yaml-language-server
	$(install) vifm fuse-zip curlftpfs sshfs meld catdoc odt2txt
	# $(install) cowsay fortune-mod
	$(ynstall) archivemount dragon-drop figlet-fonts gotop hexyl nerdfetch recutils simple-mtpfs spaceship-prompt wordnet-cli

xorg:
	$(install) xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev xdotool xclip xwallpaper arandr

bspwm: xorg
	$(install) bspwm sxhkd picom dunst rofi rofi-calc
	$(ynstall) polybar

audio:
	# $(install) pulseaudio pulseaudio-equalizer-ladspa pavucontrol playerctl
	$(install) pipewire wireplumber pipewire-pulse playerctl

fonts:
	$(install) noto-fonts-emoji otf-hermit ttf-iosevka-nerd ttf-ubuntu-font-family
	$(ynstall) nerd-fonts-victor-mono 

DE: bspwm audio fonts
	$(install) kitty flameshot syncthing
	$(install) gnome-font-viewer mpv zathura-pdf-poppler
	$(install) gimp gnumeric keepassxc qalculate-gtk thunderbird
	$(ynstall) brave-bin seafile-client 

wifi:
	$(install) networkmanager wireless-regdb
	$(enable) NetworkManager.service
	$(start) NetworkManager.service

bluetooth:
	# $(install) bluez-utils pulseaudio-bluetooth
	$(install) bluez bluez-utils
	$(enable) bluetooth.service
	$(start) bluetooth.service

laptop: bluetooth wifi
	$(install) vulkan-intel nvidia-dkms tlp

printer:
	$(install) cups system-config-printer
	$(enable) cups.service
	$(start) cups.service

printer-dcpt500w: printer yay
	$(ynstall) brother-dcpt500w

wacom:
	$(install) xf86-input-wacom

devops:
	$(install) rsync filezilla whois npm
	$(ynstall) aseprite slack-desktop xsv-bin

redox:
	$(install) avr-libc avrdude


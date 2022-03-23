# https://makefiletutorial.com/

.PHONY: help install wifi laptop xorg bspwm audio bluetooth printer printer-dcpt500w
.DEFAULT_GOAL=help
log=@echo -e "\n"
install=pacman -S --needed

help:
	@grep -E '^[a-zA-Z0-9-]+:.*' $(MAKEFILE_LIST) | sed 's/:$$/ /'

install:
	$(log) "--- Installing stow ---"
	@pacman -Qs stow > /dev/null && echo "already installed" || pacman -S stow
	$(log) "--- Stowing dotfiles ---"
	stow -v --no-folding aseprite lazygit xnview 
	stow -v */
	$(log) "--- Installing yay ---"
	@pacman -Qs yay > /dev/null && echo "already installed" || ( git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si)

system:
	$(install) man-db rsync htop ripgrep unrar unzip zip terminus-font

wifi:
	$(install) networkmanager crda
	systemctl enable NetworkManager.service
	systemctl start NetworkManager.service

laptop: wifi
	$(install) tlp

xorg:
	$(install) xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xev xdotool xautomation xclip

bspwm: xorg
	$(install) bspwm sxhkd picom polybar rofi dunst

audio:
	$(install) pulseaudio pulseaudio-equalizer-ladspa pavucontrol playerctl alsa-utils

desktop: xorg bspwm audio

bluetooth:
	$(install) bluez-utils pulseaudio-bluetooth
	systemctl enable bluetooth.service
	systemctl start bluetooth.service

printer:
	$(install) cups system-config-printer
	systemctl enable cups.service
	systemctl start cups.service

printer-dcpt500w: printer yay
	yay -S brother-dcpt500w

wacom:
	$(install) xf86-input-wacom

terminal:
	$(install) kitty
	c-lolcat
	cowsay
	fzf
	figlet-fonts
	neovim
	odt2txt
	catdoc
	mediainfo
	mp3info
	highlight
	fortune-mod-vimtips
	python-pip
	smartmontools
	wordnet-cli
	maim

vifm:
	$(install) vifm archivemount fuse-zip curlftpfs sshfs dragon-drag-and-drop

devops:
	$(install) whois xsv-bin
npm
filezilla


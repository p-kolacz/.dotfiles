# https://makefiletutorial.com/

.PHONY: help setup terminal xorg bspwm xorg bspwm audio fonts DE wifi bluetooth laptop printer printer-dcpt500w wacom devops redox
.DEFAULT_GOAL=help
# log=@echo -e "\n"
install=sudo pacman -S --needed
ynstall=yay -S --needed

help:
	@egrep '^[a-zA-Z0-9-]+:.*' $(MAKEFILE_LIST) | sed 's/:$$/ /'

setup:
	mkdir -p $(HOME)/.config/ $(HOME)/.local/share/ $(HOME)/.local/state/
	$(install) stow
	stow -vn --no-folding aseprite xnview 
	stow -vn */
	pacman -Qs yay > /dev/null || (git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si)

terminal:
	$(install) man-db man-pages rsync htop ntfs-3g ripgrep unrar unzip zip terminus-font
	$(install) cmus fzf highlight htop lazygit mediainfo python-pip smartmontools trash-cli
	$(install) neovim lua-language-server npm
	$(install) vifm fuse-zip curlftpfs sshfs meld catdoc odt2txt
	$(install) cowsay fortune-mod
	$(ynstall) archivemount dragon-drop figlet-fonts gotop moar nerdfetch recutils simple-mtpfs spaceship-prompt wordnet-cli

xorg:
	$(install) xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev xdotool xclip xwallpaper arandr

bspwm: xorg
	$(install) bspwm sxhkd picom dunst
	$(install) rofi rofi-calc
	$(ynstall) polybar

audio:
	$(install) pulseaudio pulseaudio-equalizer-ladspa pavucontrol playerctl

fonts:
	$(install) noto-fonts-emoji ttf-iosevka-nerd ttf-ubuntu-font-family
	$(ynstall) nerd-fonts-victor-mono 

DE: bspwm audio fonts
	$(install) gnome-font-viewer mpv zathura-pdf-poppler
	$(install) kitty flameshot syncthing
	$(install) calibre gimp gnumeric keepassxc qalculate-gtk thunderbird
	$(ynstall) brave-bin seafile-client 

wifi:
	$(install) networkmanager crda
	systemctl enable NetworkManager.service
	systemctl start NetworkManager.service

bluetooth:
	$(install) bluez-utils pulseaudio-bluetooth
	systemctl enable bluetooth.service
	systemctl start bluetooth.service

laptop: bluetooth wifi
	$(install) nvidia-dkms tlp

printer:
	$(install) cups system-config-printer
	systemctl enable cups.service
	systemctl start cups.service

printer-dcpt500w: printer yay
	$(ynstall) brother-dcpt500w

wacom:
	$(install) xf86-input-wacom

devops:
	$(install) filezilla whois
	$(ynstall) aseprite slack-desktop xmind-2020 xsv-bin

redox:
	$(install) avr-libc avrdude


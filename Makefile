# https://makefiletutorial.com/

.PHONY: help setup terminal wifi laptop xorg bspwm audio bluetooth printer printer-dcpt500w
.DEFAULT_GOAL=help
# log=@echo -e "\n"
install=pacman -S --needed
ynstall=yay -S --needed

help:
	@egrep '^[a-zA-Z0-9-]+:.*' $(MAKEFILE_LIST) | sed 's/:$$/ /'

setup:
	mkdir -p "$HOME/.config/" "$HOME/.local/share/" "$HOME/.local/state/"
	$(install) stow
	stow -vn --no-folding aseprite xnview 
	stow -vn */
	pacman -Qs yay > /dev/null || (git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si)

terminal:
	$(install) catdoc cmus fzf highlight htop lazygit mediainfo mp3info neovim odt2txt python-pip simple-mtpfs smartmontools wordnet-cli
	$(install) vifm archivemount fuse-zip curlftpfs sshfs dragon-drag-and-drop
	lua-language-server
	moar
	recutils
	trash-cli
	$(install) c-lolcat cowsay figlet-fonts fortune-mod nerdfetch 
	$(ynstall) gotop spaceship-prompt 

system:
	$(install) man-db man-pages rsync htop ntfs-3g ripgrep unrar unzip zip terminus-font

xorg:
	$(install) xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev xdotool xclip xwallpaper arandr

bspwm: xorg
	$(install) bspwm sxhkd picom polybar dunst
	$(install) rofi rofi-calc

audio:
	$(install) pulseaudio pulseaudio-equalizer-ladspa pavucontrol playerctl

fonts:
	$(install) noto-fonts-emoji nerd-fonts-victor-mono ttf-iosevka-nerd ttf-ubuntu-font-family

DE: system bspwm audio fonts
	$(install) gimp gnome-font-viewer gnumeric keepassxc meld mpv qalculate-gtk syncthing thunderbird zathura-pdf-poppler
	seafile-client
	calibre
	kitty 
	flameshot
	$(ynstall) brave-bin

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
	$(install) aseprite filezilla npm slack-desktop whois xmind-2020 xsv-bin

redox:
	$(install) avr-libc avrdude


#  _____ _     _
# |  ___(_)___| |__
# | |_  | / __| '_ \
# |  _| | \__ \ | | |
# |_|   |_|___/_| |_|
#       _        _     _    __ _ _
#  _ __| |__  __| |___| |_ / _(_) |___ ___
# | '_ \ / /_/ _` / _ \  _|  _| | / -_|_-/
# | .__/_\_(_)__,_\___/\__|_| |_|_\___/__/
# |_|


fish_ssh_agent

# Path
set -gx PATH "$HOME/.dotfiles/bin" "$HOME/.local/bin" "$HOME/.local/lib/node_modules/bin" $PATH

alias nvidia-settings "nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"

# if not status is-login
# end

if status is-interactive

	# Misc
	# set -gx EDITOR "$HOME/.emacs.d/bin/editor.sh"

	set -x LESS_TERMCAP_mb (printf "\033[01;31m")
	set -x LESS_TERMCAP_md (printf "\033[01;31m")
	set -x LESS_TERMCAP_me (printf "\033[0m")
	set -x LESS_TERMCAP_se (printf "\033[0m")
	set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
	set -x LESS_TERMCAP_ue (printf "\033[0m")
	set -x LESS_TERMCAP_us (printf "\033[01;32m")

	# Greeting
	function fish_greeting
		# fortune -as -n 100
		fortune -a archlinux computers chucknorris
	end

	#  /\    |_ _  _|_ _  _|_
	# /--\|_||_(_)_)|_(_|| |_

	# neofetch
	pfetch
	# fish_vi_key_bindings
	fish_default_key_bindings

	cd ~

	# Aliases
	alias ls="env LC_COLLATE=C ls --color=auto --group-directories-first"
	alias la="ls -lA"
	alias vim="vim --servername VIM"

	alias efish "vim ~/.dotfiles/fish/.config/fish/config.fish"
	alias ekitty "vim ~/.dotfiles/kitty/.config/kitty/kitty.conf"
	alias evifm "vim ~/.dotfiles/vifm/.config/vifm/vifmrc"
	alias etile "vim ~/.dotfiles/qtile/.config/qtile/config.py"

	#  /\ |_ |_  _ _
	# /--\|_)|_)| _)

	# Packages
	abbr -a -g pacs sudo pacman -S
	abbr -a -g prem sudo pacman -Rns
	abbr -a -g pacq pacman -Qs
	abbr -a -g paci pacman -Qi
	abbr -a -g pacl pacman -Ql
	abbr -a -g paco pacman -Qo
	abbr -a -g premo pacman -Rns (pacman -Qtdq)
	abbr -a -g y yay
	abbr -a -g yf yay -Ss
	abbr -a -g yrem yay -Rns
	abbr -a -g yq yay -Qs

	# systemctl
	abbr -a -g sys sudo systemctl status
	abbr -a -g syse sudo systemctl enable
	abbr -a -g sysd sudo systemctl disable
	abbr -a -g syst sudo systemctl start
	abbr -a -g sysp sudo systemctl stop
	abbr -a -g sysr sudo systemctl restart

	# processes
	abbr -a -g kk killall
	abbr -a -g psa "ps -e | grep -i"

end

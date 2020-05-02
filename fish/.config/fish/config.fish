#  _____ _     _
# |  ___(_)___| |__
# | |_  | / __| '_ \
# |  _| | \__ \ | | |
# |_|   |_|___/_| |_|


fish_ssh_agent

# Path
set -x PATH "$HOME/.dotfiles/bin" "$HOME/.local/bin" "$HOME/.local/lib/node_modules/bin" $PATH

alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"

set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x TERMINAL alacritty
set -x EDITOR vim
set -x BROWSER opera
set -x LESSHISTFILE "-"


if status is-interactive

	# Greeting
	# function fish_greeting
		# fortune -as -n 100
		# fortune -a archlinux computers chucknorris
	# end

	# Aliases
	alias vim="vim --servername VIM"
	alias fonts="fc-list | sort | fzf"
	alias ls="env LC_COLLATE=C ls --color=auto --group-directories-first"
	alias la="ls -lA"

	# alias vim="vim --servername VIM"

	alias efish "vim ~/.dotfiles/fish/.config/fish/config.fish"
	alias ekitty "vim ~/.dotfiles/kitty/.config/kitty/kitty.conf"
	alias evifm "vim ~/.dotfiles/vifm/.config/vifm/vifmrc"
	alias etile "vim ~/.config/qtile/config.py"
	alias eauto "vim ~/.config/qtile/autostart.sh"
	alias ecom "vim ~/.dotfiles/compton/.config/compton.conf"
	alias eala "vim ~/.config/alacritty/alacritty.yml"

	#  /\ |_ |_  _ _
	# /--\|_)|_)| _)

	function remove_all_abbr
		for a in (abbr | awk '{print $5}');
			abbr -e $a
		end
	end

	# Packages
	# abbr -a -g pacs sudo pacman -S
	# abbr -a -g prem sudo pacman -Rns
	# abbr -a -g pacq pacman -Qs
	# abbr -a -g paci pacman -Qi
	# abbr -a -g pacl pacman -Ql
	# abbr -a -g paco pacman -Qo
	# abbr -a -g premo pacman -Rns (pacman -Qtdq)
	# abbr -a -g y yay
	# abbr -a -g yf yay -Ss
	# abbr -a -g yrem yay -Rns
	# abbr -a -g yq yay -Qs

	# systemctl
	abbr -a -g sys sudo systemctl status
	abbr -a -g syse sudo systemctl enable
	abbr -a -g sysd sudo systemctl disable
	abbr -a -g syst sudo systemctl start
	abbr -a -g sysp sudo systemctl stop
	abbr -a -g sysr sudo systemctl restart

	# processes
	abbr -a -g ka killall
	abbr -a -g psa "ps -e | grep -i"

end

# Start X at login
if status is-login
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		startx
	end
end


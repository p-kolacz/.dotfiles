#  _____ _     _
# |  ___(_)___| |__
# | |_  | / __| '_ \
# |  _| | \__ \ | | |
# |_|   |_|___/_| |_|


fish_ssh_agent

if status is-login
	# Path
	set -x PATH "$HOME/.dotfiles/bin" "$HOME/.local/bin" "$HOME/.local/lib/node_modules/bin" $PATH
end

alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"

set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
# set -x TERMINAL alacritty
set -x EDITOR vim
set -x BROWSER brave
set -x LESSHISTFILE "-"


if status is-interactive

	# function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
	# 	for mode in default insert visual
	# 		fish_default_key_bindings -M $mode
	# 	end
	# 	fish_vi_key_bindings --no-erase
	# end
	# set -g fish_key_bindings hybrid_bindings

	fish_hybrid_key_bindings
	term_theme

	# Aliases
	alias vim="vim --servername VIM"
	alias fonts="fc-list | sort | fzf"
	alias ls="ls --color=auto"
	alias la="ls -lA --group-directories-first"

	# alias vim="vim --servername VIM"

	alias econf "cd ~/.dotfiles;vim"
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

	# misc.
	# abbr -ag f "| fzf" # wont work
end

# Start X at login
if status is-login
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		startx
	end
end


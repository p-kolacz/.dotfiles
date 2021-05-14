#  _____ _     _
# |  ___(_)___| |__
# | |_  | / __| '_ \
# |  _| | \__ \ | | |
# |_|   |_|___/_| |_|


# sh ~/test.sh

fish_ssh_agent

if status is-login
	# Path
	set -x PATH "$HOME/.dotfiles/bin" "$HOME/.local/bin" "$HOME/.local/lib/node_modules/bin" $PATH
end

alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"

set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x TERMINAL kitty
set -x EDITOR nvim
set -x BROWSER brave
# set -x LESSHISTFILE "-"
# set -x THEME gruvbox-dark
# set -x THEME tokyonight-storm

if status is-interactive

	fish_hybrid_key_bindings
	term_theme

	# https://github.com/raylee/tldr-sh-client
	set -x TLDR_HEADER 'magenta bold underline'
	set -x TLDR_QUOTE 'italic'
	set -x TLDR_DESCRIPTION 'green'
	set -x TLDR_CODE 'red'
	set -x TLDR_PARAM 'blue'

	# Aliases
	alias vim="vim --servername VIM"
	alias fonts="fc-list | sort | fzf"
	alias ls="ls --color=auto"
	alias la="ls -lA --group-directories-first"
	alias envs="env | fzf"

	# alias vim="vim --servername VIM"

	alias econf "cd ~/.dotfiles;$EDITOR"
	# alias efish "vim ~/.dotfiles/fish/.config/fish/config.fish"
	# alias ekitty "vim ~/.dotfiles/kitty/.config/kitty/kitty.conf"
	# alias evifm "vim ~/.dotfiles/vifm/.config/vifm/vifmrc"
	alias jur "cd ~/Work/Jurist/Jurist && $EDITOR"
	alias evim "cd ~/.config/nvim && $EDITOR init.lua"
	# alias todo "vim ~/Cloud/Exocortex/Life/TODO/todo.txt"

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
	abbr -a -g ka killall --wait
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


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

# Path
set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/.local/lib/node_modules/bin" $PATH

# Misc
set -gx EDITOR "$HOME/.emacs.d/bin/editor.sh"
set -gx npm_config_prefix "$HOME/.local/lib/node_modules"

# XDG
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Stop littering home dir
set -gx ANDROID_SDK_HOME "$XDG_CONFIG_HOME/android"
# set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
# set -gx ICEAUTHORITY "$XDG_CACHE_HOME/ICEauthority"
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -gx LESSHISTFILE "-"
set -gx MPLAYER_HOME "$XDG_CONFIG_HOME/mplayer"
set -gx MYSQL_HISTFILE "$XDG_DATA_HOME/mysql_history"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -gx NPM_CONFIG_TMP "$XDG_RUNTIME_DIR/npm"
set -gx NUGET_PACKAGES "$XDG_CACHE_HOME/NuGetPackages"
set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"
# set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"

export QT_QPA_PLATFORMTHEME="qt5ct"

fish_ssh_agent

if not status is-login

	#  __              
	# |__)_ _  _  _ |_ 
	# |  | (_)||||_)|_ 
	#            |     

	function fish_prompt
		powerline-shell --shell bare $status
	end
end

if status is-interactive

	# Greeting

	function fish_greeting
		fortune -as -n 100
	end
                        
	#  /\    |_ _  _|_ _  _|_ 
	# /--\|_||_(_)_)|_(_|| |_

	neofetch
	kitty + complete setup fish | source

	#  /\ |_ |_  _ _ 
	# /--\|_)|_)| _) 

	# Packages
	abbr -a p sudo pacman -S
	abbr -a pf pacman -Ss
	abbr -a prem sudo pacman -Rns
	abbr -a pq pacman -Qs
	abbr -a pi pacman -Qi
	abbr -a po pacman -Rns (pacman -Qtdq)
	abbr -a y yay
	abbr -a yf yay -Ss
	abbr -a yrem yay -Rns
	abbr -a yq yay -Qs

	# systemctl
	abbr -a sys sudo systemctl status
	abbr -a syse sudo systemctl enable
	abbr -a sysd sudo systemctl disable
	abbr -a syst sudo systemctl start
	abbr -a sysp sudo systemctl stop
	abbr -a sysr sudo systemctl restart
	
	# processes
	abbr -a kk killall
	abbr -a psa "ps -e | grep -i"
end

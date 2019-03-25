#  _____ _     _     
# |  ___(_)___| |__  
# | |_  | / __| '_ \ 
# |  _| | \__ \ | | |
# |_|   |_|___/_| |_|                   
#       _        _     _    __ _ _        
#  _ __| |__  __| |___| |_ / _(_) |___ ___
# | '_ \ / /_/ _` / _ \  _|  _| | / -_|_-<
# | .__/_\_(_)__,_\___/\__|_| |_|_\___/__/
# |_|                                     

set -gx PATH ~/.local/bin $PATH
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

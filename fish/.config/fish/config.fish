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

	abbr -a p sudo pacman -S
	abbr -a pf pacman -Ss
	abbr -a prem sudo pacman -Rs
	abbr -a pq pacman -Qs

	abbr -a y yay
	abbr -a yf yay -Ss
	abbr -a yrem yay -Rs
	abbr -a yq yay -Qs

	abbr -a s sudo systemctl
	abbr -a kk killall
	abbr -a psa "ps -e | grep -i"
end

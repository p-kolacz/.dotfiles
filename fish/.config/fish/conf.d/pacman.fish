#                                   __ _    _
#  _ __  __ _ __ _ __  __ _ _ _    / _(_)__| |_
# | '_ \/ _` / _| '  \/ _` | ' \ _|  _| (_-< ' \
# | .__/\__,_\__|_|_|_\__,_|_||_(_)_| |_/__/_||_|
# |_|

alias pacup="sudo pacman -Syu"
abbr -ag inst "sudo pacman -S"
abbr -ag rem "sudo pacman -Rns"
abbr -ag orphans "pacman -Qdt"
abbr -ag paci "pacman -Qi"
abbr -ag pacl "pacman -Ql"
abbr -ag paco "pacman -Qo"

function remove-orphans
	pacman -Qtdq | sudo pacman -Rns -
end

# function pacinfo
# 	pacman -Qi $argv[1] | colorize 'Wymagany.*' red | colorize 'Zale.*' blue | colorize 'Grup.*' green
# end

# function pac
# 	set app (pacman -Qeq | fzf --layout=reverse-list --preview "pacinfo {}" --bind 'f3:execute(pacman -Ql {} | fzf),f8:execute(sudo pacman -Rns {} < /dev/tty > /dev/tty 2>&1)') &&
# 		sudo pacman -Rns "$app"
# end

# function pacall
# 	set app (pacman -Qq | fzf --layout=reverse-list --preview 'pacinfo {}' --bind 'f3:execute(pacman -Ql {} | fzf)') &&
# 		sudo pacman -Rns "$app"
# end

# function pacavail
# 	set app (pacman -Slq | fzf --layout=reverse-list --preview 'pacman -Si {}') &&
# 		sudo pacman -S "$app"
# end


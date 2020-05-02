#                                   __ _    _
#  _ __  __ _ __ _ __  __ _ _ _    / _(_)__| |_
# | '_ \/ _` / _| '  \/ _` | ' \ _|  _| (_-< ' \
# | .__/\__,_\__|_|_|_\__,_|_||_(_)_| |_/__/_||_|
# |_|

alias inst="sudo pacman -S"
alias rem="sudo pacman -Rns"
alias orphans="pacman -Qdt"
alias paci="pacman -Qi"
alias pacl="pacman -Ql"
alias paco="pacman -Qo"

function apps
	set app (pacman -Qeq | fzf --layout=reverse-list --preview 'pacman -Qi {}' --bind 'f1:execute(pacman -Ql {} | fzf)') &&
		sudo pacman -Rns "$app"
end

function aapps
	set app (pacman -Qq | fzf --layout=reverse-list --preview 'pacman -Qi {}' --bind 'f1:execute(pacman -Ql {} | fzf)') &&
		sudo pacman -Rns "$app"
end


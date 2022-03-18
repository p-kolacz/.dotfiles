alias envs="env | fzf"
alias fonts="fc-list | sort | fzf"
alias lg=lazygit

alias la="ls -lA --group-directories-first"
alias ls="ls --color=auto"

alias disks="lsblk --nodeps --output NAME,MODEL,SIZE"
alias parts="lsblk --output NAME,SIZE,FSTYPE,MOUNTPOINTS,MODEL"

alias evim "cd ~/.config/nvim && $EDITOR init.lua"
alias todo="~/Tools/todofzf/todofzf ~/Cloud/Exocortex/TODO/todo.txt"
alias recom "killall --wait picom && picom -b"

abbr inst="sudo pacman -S"
abbr rem="sudo pacman -Rns"

abbr sys="sudo systemctl status"
abbr syse="sudo systemctl enable"
abbr sysd="sudo systemctl disable"
abbr syst="sudo systemctl start"
abbr sysp="sudo systemctl stop"
abbr sysr="sudo systemctl restart"

abbr ka="killall --wait"
abbr psa="ps -e | grep -i"

alias -g F="| fzf"
alias -g G="| grep -i"
alias -g L="| less"
alias -g X="| xargs"


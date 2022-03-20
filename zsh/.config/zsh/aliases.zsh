alias la="ls -lAv --group-directories-first"
alias ls="ls --color=auto"
alias ll="ls --color=auto"

alias disks="lsblk --nodeps --output NAME,MODEL,SIZE"
alias parts="lsblk --output NAME,SIZE,FSTYPE,MOUNTPOINTS,MODEL"

alias envs="env | fzf"
# alias evim='$EDITOR -c "cd ~/.config/nvim" init.lua'
alias evim="edit_in_dir ~/.config/nvim init.lua"
alias fonts="fc-list | sort | fzf"
alias recom="killall --wait picom && picom -b"
alias todo="~/Tools/todofzf/todofzf ~/Cloud/Exocortex/TODO/todo.txt"
# alias gamez='$EDITOR -c "cd ~/Cloud/Exocortex/Gamez/" "db/gamez.rec"'
alias gamez="edit_in_dir ~/Cloud/Exocortex/Gamez db/gamez.rec"
alias paths='sed "s/:/\n/g" <<< $PATH'
alias recomp="killall --wait picom && picom -b"
alias redox="edit_in_dir ~/Tools/qmk_firmware keyboards/redox_w/keymaps/max/keymap.c"
alias nsxiv="nsxiv -a"
abbr dlaudio="youtube-dl --extract-audio --audio-format mp3 --embed-thumbnail"

# Git ---------------------------------
alias lg=lazygit
abbr g="git status"
abbr gico="git add . && git commit -m"
alias gipu="git push"
alias gicora='git add . && git commit -m "$(shuf -n 1 < $HOME/.dotfiles/share/txt/git-messages.txt)"'
alias gipura='git add . && git commit -m "$(shuf -n 1 < $HOME/.dotfiles/share/txt/git-messages.txt)" && git push'
alias gicoda='git add . && git commit -m "$(date +%F_%T)"'
alias gipuda='git add . && git commit -m "$(date +%F_%T)" && git push'

# Pacman ------------------------------
abbr inst="sudo pacman -S"
abbr rem="sudo pacman -Rns"

# Systemctl ---------------------------
abbr sys="sudo systemctl status"
abbr syse="sudo systemctl enable"
abbr sysd="sudo systemctl disable"
abbr syst="sudo systemctl start"
abbr sysp="sudo systemctl stop"
abbr sysr="sudo systemctl restart"

# Processes ---------------------------
abbr ka="killall --wait"
abbr psa="ps -e | grep -i"

# Global ------------------------------
alias -g F="| fzf"
alias -g G="| grep -i"
alias -g L="| less"
alias -g X="| xargs"

# Suffix ------------------------------
alias -s {md,txt}=$EDITOR


alias ls="ls --color=auto"
alias ll="ls -lhv --group-directories-first"
alias la="ll -A"
alias dus="du -hs"
alias dul="du -d 1 -h | sort -hr"
alias finddir="find . -type d -name"
alias findfile="find . -type f -name"
alias grep="grep --color=auto"
alias envs="env | fzf"
alias fonts="fc-list | sort | fzf"
alias paths='sed "s/:/\n/g" <<< $PATH'
alias recomp="killall --wait picom && picom -b"
# alias roficalc="rofi -show calc -modi calc -no-show-match -no-sort"
alias nsxiv="nsxiv -a"
abbr yt2mp3="youtube-dl --extract-audio --audio-format mp3 --embed-thumbnail --add-metadata"
alias batman="nmcli device wifi connect 'Batman'"
alias myip="curl ipinfo.io/ip"
alias nv="nvim"
alias weather="curl 'wttr.in/?Fqn&lang=pl'"
alias todo="~/repos/todofzf/todofzf ~/Cloud/Exocortex/TODO/todo.txt"
(( $+commands[host] )) || alias host="drill ANY"

# Disk utils --------------------------
alias disks="lsblk --nodeps --output NAME,MODEL,SIZE"
alias parts="lsblk --output NAME,SIZE,FSTYPE,MOUNTPOINTS,MODEL"
alias dispeed="sudo hdparm -t"

# Edit config files -------------------
alias edot="cd $DOTFILES && $EDITOR"
alias evim="edit_in_dir $DOTFILES/nvim/.config/nvim/ init.lua"
alias ekeys="$EDITOR -O $DOTFILES/sxhkd/.config/sxhkd/sxhkdrc $DOTFILES/bspwm/.config/bspwm/sxhkdrc"
alias redox="edit_in_dir ~/repos/qmk_firmware keyboards/redox_w/keymaps/max/keymap.c"

# Databases ---------------------------
alias books="edit_in_dir ~/Cloud/Exocortex/Databases/ db/books.rec"
alias gamez="edit_in_dir ~/Cloud/Exocortex/Databases/ db/gamez.rec"
alias komix="edit_in_dir ~/Cloud/Exocortex/Databases/ db/komix.rec"
alias ludzie="edit_in_dir ~/Cloud/Exocortex/Databases/ db/people.rec"

# Git ---------------------------------
alias lg=lazygit
alias gits="git status"
abbr gico="git add . && git commit -m"
alias gifico='git add. && git commit -m "First commit."'
alias gipu="git push"
alias gicora='git add . && git commit -m "$(shuf -n 1 < $HOME/.dotfiles/share/txt/git-messages.txt)"'
alias gipura='git add . && git commit -m "$(shuf -n 1 < $HOME/.dotfiles/share/txt/git-messages.txt)" && git push'
alias gicoda='git add . && git commit -m "$(date +%F_%T)"'
alias gipuda='git add . && git commit -m "$(date +%F_%T)" && git push'

# Pacman ------------------------------
abbr inst="sudo pacman -S"
abbr rem="sudo pacman -Rns"
abbr pacown="pacman -Qo"
abbr paclist="pacman -Ql"

# Systemctl ---------------------------
abbr sys="systemctl status"
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
alias -g H="| head"
alias -g L="| $PAGER"
alias -g T="| tail"
alias -g W="| wc -l"
alias -g X="| xargs"

# Suffix ------------------------------
alias -s {md,txt}=$EDITOR


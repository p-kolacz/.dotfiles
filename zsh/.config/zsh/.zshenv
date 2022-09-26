# Runs always as first config file

export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/.dotfiles"
export TERMINAL="kitty"
export PAGER="less"
export EDITOR="nvim"
export BROWSER="brave"
export IMGVIEWER="nsxiv -a"
export IMGRIFLE="nsxiv-rifle"
export VMENU="rofi -dmenu"

source $DOTFILES/share/themes/current

[[ -f $HOME/.local/config/zsh/custom.zshenv ]] && source $HOME/.local/config/zsh/custom.zshenv


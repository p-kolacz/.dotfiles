source $ZDOTDIR/xdg-comply.zsh
source $ZDOTDIR/plugins/ssh-agent.zsh

path+="$HOME/.dotfiles/bin"
path+="$HOME/.local/bin"
path+="$HOME/.local/lib/node_modules/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx $DOTFILES/xorg/xinitrc > $XDG_STATE_HOME/startx.log 2>&1
fi


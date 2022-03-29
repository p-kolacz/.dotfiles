# combine emacs & vim modes
bindkey -e
bindkey '\e' vi-cmd-mode

source $ZDOTDIR/plugins/abbr.zsh
source $ZDOTDIR/plugins/less.zsh
source $ZDOTDIR/plugins/tldr.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/aliases.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

unalias run-help
autoload run-help
alias help=run-help

HISTFILE="$XDG_STATE_HOME/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt autocd

(( $+commands[moar] )) && export PAGER="moar --no-linenumbers"

nerdfetch
# eval "$(starship init zsh)"
autoload -U promptinit; promptinit
prompt spaceship


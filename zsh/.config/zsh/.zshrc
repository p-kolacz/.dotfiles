source plugins/abbr.zsh
source plugins/less.zsh
source plugins/ssh-agent.zsh
source plugins/tldr.zsh
source aliases.zsh

autoload -Uz compinit run-help
compinit
zstyle ':completion:*' menu select
HISTFILE="$XDG_STATE_HOME/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v


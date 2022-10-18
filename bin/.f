#!/bin/bash

_git() {
	git --git-dir="$HOME/.config/dotfiles" --work-tree="$HOME" "$@"
}

edit() {
	$EDITOR "$HOME/.gitignore"
}

[[ $# == 0 ]] && { _git status; exit 0; }

if [[ $(typeset -f "$1") ]]; then
	$1
else
	_git "$@"
fi


# config config --local status.showUntrackedFiles no
# https://www.atlassian.com/git/tutorials/dotfiles

conf() {
	local old=$PWD
	cd ~/.dotfiles
	local file=$(find . -not -wholename "./.git*" -type f | fzf --preview "preview.sh {}")
	[[ -f $file ]] && $EDITOR "$file"
	cd "$old"
}

chsh () {
	curl cheat.sh/$1/$2
}

edit_in_dir() {
	$EDITOR -c "cd $1" "$2"
}

ealias() {
	local file=$ZDOTDIR/aliases.zsh
	$EDITOR $file
	source $file
}

efuncs() {
	local file=$ZDOTDIR/functions.zsh
	$EDITOR $file
	source $file
}

kk() {
	local pid=$(ps -f -u $(whoami) | sed 1d | fzf --no-hscroll | awk '{print $2}')
	[[ -n $pid ]] && kill -9 $pid
}

mkd() {
	mkdir -p "$1" && cd "$1"
}

notes() {
	local dir="~/Cloud/Exocortex/Notes"
	local file=$(find . -name "$dir/*.md" -type f | fzf --preview "preview.sh {}")
	[[ -n $file ]] && edit_in_dir "$dir" "$file"
}


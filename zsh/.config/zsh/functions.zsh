conf() {
	local old=$PWD
	cd ~/.dotfiles
	local file=$(find . -not -wholename "./.git*" -type f | fzf --preview "preview.sh {}")
	[[ -f $file ]] && $EDITOR "$file"
	cd "$old"
}

encfile() {
	gpg --symmetric "$1"
}
decfile() {
	orig=${1%.gpg}
	[[ -f $orig ]] && { echo "$orig already exists"; return; }
	gpg --decrypt --output "$orig" "$1"
}

sheet () {
	curl cheat.sh/"$1"
}

edit_in_dir() {
	cd "$1" && $EDITOR "$2"
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
	# local dir="$HOME/Cloud/Exocortex/Notes"
	# local file=$(find $dir -name "*.md" -type f | fzf --preview "preview.sh {}")
	# [[ -f $file ]] && edit_in_dir "$dir" "$file"
	cd "$HOME/Cloud/Exocortex/Notes/"
	local file=$(find . -name "*.md" -type f | fzf --preview "preview.sh {}")
	[[ -f $file ]] && $EDITOR "$file"
}

rss2mp3() {
	curl $1 | egrep -o "https?://.*mp3" | uniq | xargs -I _ curl -OL _
}


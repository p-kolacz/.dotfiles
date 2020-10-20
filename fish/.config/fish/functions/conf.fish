function conf
	set last (pwd)
	cd ~/.dotfiles
	set file (find . -not -wholename "./.git*" -type f | fzf --preview "highlight -O truecolor -s moria --force {}")
	test -n "$file"; and vim "$file"
	cd "$last"
end


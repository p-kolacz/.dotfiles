function vonf
	set last (pwd)
	cd ~/.vim
	# set file (find . -not -wholename "./.git*" -type f | fzf --preview "highlight -O truecolor -s moria {}")
	set file (rg --files | fzf --preview "highlight -O truecolor -s moria {}")
	test -n "$file"; and vim "$file"
	cd "$last"
end


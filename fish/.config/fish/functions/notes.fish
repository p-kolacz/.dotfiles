function notes
	set last (pwd)
	cd ~/Cloud/Exocortex/Notes
	set file (find . -name "*.md" -type f | fzf --preview "highlight -O truecolor -s moria {}")
	test -n "$file"; and vim "$file"
	cd "$last"
end


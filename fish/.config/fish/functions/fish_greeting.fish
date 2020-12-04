function fish_greeting
	# fortune vimtips | cowsay -f (ls /usr/share/cows/*.cow | shuf -n 1) | lolcat
	fortune vimtips | cowsay -f (echo -e "bud-frogs\ndefault\nelephant\neyes\nkitty\nmoose\nsmall\ntux\nudder" | shuf -n 1) | lolcat
end

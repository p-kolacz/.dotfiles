if status is-interactive
	abbr -ag g git status
	abbr -ag gc "git add . && git commit -m"
	abbr -ag gp git push
end

function gpush
	set -l msg (cat "$HOME/.dotfiles/git/messages" | shuf -n 1) 
	git add . && git commit -m "$msg" && git push 
end


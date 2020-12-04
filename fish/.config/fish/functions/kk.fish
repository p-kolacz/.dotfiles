# kill process
function kk
	# set pid (ps -e | sed 1d | fzf | awk '{print $1}')
	set pid (ps -f -u (whoami) | sed 1d | fzf --no-hscroll | awk '{print $2}')

	test -n "$pid"; and kill -9 $pid
end


# kill process
function kk
	set pid (ps -e | sed 1d | fzf | awk '{print $1}')
	# pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

	test -n "$pid"; and kill -9 $pid
end


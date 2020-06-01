function colorize
	if [ (count $argv) -eq 2 ]
		sed 's/'$argv[1]'/'(set_color $argv[2])'&'(set_color normal)'/'
	else
		echo "Usage: COMMAND | colorize REGEX COLOR"
	end
end


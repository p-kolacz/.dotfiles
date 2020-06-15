function fish_prompt
	set -l fg black
	set -l bg white
	# set -l open (set_color $bg)""(set_color -b $bg; set_color $fg)
	set -l open (set_color -b $bg; set_color $fg)
	set -l close (set_color normal;set_color $bg)" "
	set -l bgjobs (jobs | wc -l)
	set -l bgjobs ([ $bgjobs -eq 0 ] && echo "" || echo " $bgjobs $close$open ")
	printf "$open $bgjobs%s $close " (prompt_pwd)
	set_color normal
end


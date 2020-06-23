function fish_prompt
	set -l fg black
	set -l bg white
	# set -l open (set_color $bg)""(set_color -b $bg; set_color $fg)
	set -l open (set_color -b $bg; set_color $fg)
	set -l close (set_color normal;set_color $bg)" "
	set -l bgjobs (jobs | wc -l)
	set -l bgjobs ([ $bgjobs -eq 0 ] && echo "" || echo " $bgjobs $close$open ")
	printf "$open $bgjobs%s%s $close " (_mode_prompt) (prompt_pwd)
	set_color normal
end

function _mode_prompt
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                echo -n 'ﱄ' 
            case insert
                echo -n ''
            case replace_one
                echo -n '累'
            case replace
                echo -n 'R'
            case visual
                echo -n ''
        end
        echo -n ' '
    end
end


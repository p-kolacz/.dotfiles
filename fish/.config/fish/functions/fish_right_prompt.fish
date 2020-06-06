function _print_pipestatus --description "Print pipestatus for prompt"
    # only output status codes if some process in the pipe failed
    # SIGPIPE (141 = 128 + 13) is usually not a failure, see #6375.
    if string match -qvr '^(0|141)$' $argv
        echo (set_color --bold red)(string join "|" (__fish_pipestatus_with_signal $argv))
	else
		echo (set_color green)""
    end
end

function fish_right_prompt
    #Save the return status of the previous command
    set -l last_ps $pipestatus

	set -l fg black
	set -l bg white
	set -l open (set_color $bg)""(set_color -b $bg; set_color $fg)
	set -l close (set_color normal;set_color $bg)" "
	set -l pi_status (_print_pipestatus $last_ps)

	printf "$open $pi_status $close"
	set_color normal
end


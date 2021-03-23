if &term == "alacritty"
	if has("termguicolors")
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	if !has('nvim')
		set ttymouse=sgr	" Fixes mouse in alacritty, removed in nvim
	endif
endif


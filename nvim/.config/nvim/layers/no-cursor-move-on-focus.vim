augroup NO_CURSOR_MOVE_ON_FOCUS
	au!
	au FocusLost * let g:oldmouse=&mouse | set mouse=
	au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

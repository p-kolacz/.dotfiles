" Required for formatoptions autocmd to work
filetype plugin indent on

augroup vimrc
	autocmd!
	autocmd BufWritePost init.vim source $MYVIMRC
	autocmd FocusLost * :wa
	" c - autowrap comments, r - insert comments at <cr>, o - comment after o/O
	autocmd FileType * setlocal formatoptions-=c formatoptions-=o
augroup END

command! OpenImg execute 'silent !sxiv '.expand('%:p:h').'/'.expand('<cfile>').' &'
" command! -nargs=1 Silent execute 'silent !' . <q-args> | execute 'redraw!'


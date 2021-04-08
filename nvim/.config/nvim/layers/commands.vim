augroup vimrc
	autocmd!
	autocmd FocusLost * :wa
	autocmd BufRead */.config/nvim/init.lua setlocal includeexpr=stdpath('config').'/lua/layers/'.v:fname
augroup END

command! OpenImg execute 'silent !sxiv '.expand('%:p:h').'/'.expand('<cfile>').' &'
" command! -nargs=1 Silent execute 'silent !' . <q-args> | execute 'redraw!'


augroup vimrc
	autocmd!
	autocmd FocusLost * :wa
	autocmd BufRead */.config/nvim/init.lua setlocal includeexpr=stdpath('config').'/lua/'.v:fname
augroup END

command! OpenImg execute 'silent !$IMGVIEWER '.expand('%:p:h').'/'.expand('<cfile>').' &'


 " _  _     _
" | || |___| |_ __
" | __ / -_) | '_ \
" |_||_\___|_| .__/
 "           |_|

 if has('win32') || has ('win64')
	 let $VIMHOME = $VIM."/vimfiles"
 elseif has('nvim')
	 let $VIMHOME = stdpath('config')
 else
	 let $VIMHOME = $HOME."/.vim"
 endif

function! Help()
	execute 'edit' $VIMHOME.'/doc/'.&filetype.'.txt'
endfunction

execute 'autocmd vimrc BufWritePost $VIMHOME/doc/*.txt helptags $VIMHOME/doc'
autocmd vimrc FileType help nnoremap <buffer> gi :silent exec '!sxiv $VIMHOME/doc/img/'.expand('%:t:r').'/<cfile> &'<CR>

nnoremap <F1> :call Help()<cr>
nnoremap <leader>hf :call Help()<cr>
call Desc('h.f', 'filetype notes')


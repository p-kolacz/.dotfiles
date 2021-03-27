 " _  _     _
" | || |___| |_ __
" | __ / -_) | '_ \
" |_||_\___|_| .__/
 "           |_|

function! Help()
	execute 'edit' $VIMHOME.'/doc/'.&filetype.'.txt'
endfunction

execute 'autocmd vimrc BufWritePost $VIMHOME/doc/*.txt helptags $VIMHOME/doc'
autocmd vimrc FileType help nnoremap <buffer> gi :silent exec '!sxiv $VIMHOME/doc/img/'.expand('%:t:r').'/<cfile> &'<CR>

call Desc('h', '+Help')
nnoremap <leader>hh :help<space>
call Desc('h.h', 'help')
nnoremap <leader>hg :helpgrep<space>
call Desc('h.g', 'help grep')
nnoremap <F1> :call Help()<cr>
nnoremap <leader>hf :call Help()<cr>
call Desc('h.f', 'filetype notes')


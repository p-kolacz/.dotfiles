 " _  _     _
" | || |___| |_ __
" | __ / -_) | '_ \
" |_||_\___|_| .__/
 "           |_|

function! Help()
	execute 'edit' stdpath('config').'/doc/'.&filetype.'.txt'
endfunction

" execute 'autocmd vimrc BufWritePost $VIMHOME/doc/*.txt helptags $VIMHOME/doc'
autocmd vimrc FileType help nnoremap <buffer> gi :silent exec '!sxiv $VIMHOME/doc/img/'.expand('%:t:r').'/<cfile> &'<CR>

call Desc('h', '+Help')
nnoremap <leader>hh :help<space>
call Desc('hh', 'help')
nnoremap <leader>hg :helpgrep<space>
call Desc('hg', 'help grep')
nnoremap <F1> :call Help()<cr>
nnoremap <leader>hf :call Help()<cr>
call Desc('hf', 'filetype notes')

" Desc hm filetype\ manual
" Desc ha filetype\ API

" command! -nargs=1 HelpMapMan nnoremap <buffer> <leader>hm :silent exe "!$BROWSER ".<q-args><cr>
" command! -nargs=1 HelpMapAPI nnoremap <buffer> <leader>ha :silent exe "!$BROWSER ".<q-args><cr>


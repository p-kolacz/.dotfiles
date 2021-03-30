" https://github.com/tpope/vim-commentary

lua Plug.add 'tpope/vim-commentary'

" C-_ means C-/
" C-? means backspace but <BS> also works
nnoremap <C-_> :Commentary<cr><down>
nnoremap <BS> :Commentary<cr>
vnoremap <BS> :Commentary<cr>
nmap <leader>cc yypkgccj
call Desc('c.c', 'duplicomment')


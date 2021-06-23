Desc e +Edit

" Move line
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==
" Move selection
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

nnoremap <leader>et :%s/\s\+$//e<CR>
call Desc('et', 'remove trailing spaces')

nnoremap <leader>es :%s//g<left><left>
call Desc('es', 'substitute')

" change cword and press . to repeat change on next, n to goto next
nnoremap <silent> <leader>ed :let @/='\<'.expand('<cword>').'\>'<cr>cgn
xnoremap <silent> <leader>ed "sy:let @/=@s<cr>cgn

Desc ed change&repeat

nnoremap <leader>er :g/^/m0<CR>
vnoremap <leader>er :'<,'>!tac<CR>
Desc er reverse\ lines


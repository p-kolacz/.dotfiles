nnoremap <buffer> <localleader>x :call luaeval(getline('.'))<cr>
nnoremap <buffer> <localleader>s :w<cr>:luafile %<cr>

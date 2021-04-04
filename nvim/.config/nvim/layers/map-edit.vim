Desc e +Edit
nnoremap <leader>er :%s/\s\+$//e<CR>
call Desc('er', 'remove trailing spaces')

nnoremap <leader>es :%s//g<left><left>
call Desc('es', 'substitute')


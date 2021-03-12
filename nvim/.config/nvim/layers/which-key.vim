" https://github.com/liuchengxu/vim-which-key

Plug 'liuchengxu/vim-which-key'

nnoremap <silent> <space>       :<c-u>WhichKey '<space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

set timeoutlen=500

call Desc('o', '+Options')
call Desc('p', '+Project')
call Desc('t', '+Tools')
call Desc('v', '+Vim')


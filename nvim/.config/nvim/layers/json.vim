" Plug 'elzr/vim-json'

autocmd vimrc FileType json nnoremap <buffer> <localleader>p :%!python -m json.tool<cr>

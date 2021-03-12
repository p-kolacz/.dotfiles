Plug 'kovetskiy/sxhkd-vim'

autocmd vimrc FileType sxhkd nnoremap <buffer> <F5> :!pkill -USR1 -x sxhkd<CR>


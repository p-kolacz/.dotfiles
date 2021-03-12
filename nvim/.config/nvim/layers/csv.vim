  " ____ ______     __
 " / ___/ ___\ \   / /
" | |   \___ \\ \ / /
" | |___ ___) |\ V /
 " \____|____/  \_/
" https://github.com/mechatroner/rainbow_csv

Plug 'mechatroner/rainbow_csv'

" Plug 'chrisbra/csv.vim'

" autocmd vimrc InsertLeave *.csv :%!column -t
autocmd vimrc FileType csv nnoremap <buffer> <localleader>a :%!column -t<CR>
autocmd vimrc FileType csv nnoremap <buffer> <localleader>j :!csv2json.sh "%" > "%:t:r".json<CR>


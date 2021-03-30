  " ____ ______     __
 " / ___/ ___\ \   / /
" | |   \___ \\ \ / /
" | |___ ___) |\ V /
 " \____|____/  \_/
" https://github.com/mechatroner/rainbow_csv

lua Plug.add 'mechatroner/rainbow_csv'

autocmd vimrc FileType csv nnoremap <buffer> <localleader>a :%!column -t<CR>
autocmd vimrc FileType csv nnoremap <buffer> <localleader>j :!csv2json.sh "%" > "%:t:r".json<CR>


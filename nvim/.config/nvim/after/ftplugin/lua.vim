setlocal formatoptions-=o
nnoremap <buffer> <localleader>x :call luaeval(getline('.'))<cr>
nnoremap <buffer> <localleader>s :w<cr>:luafile %<cr>

lua Help.map_manual 'https://www.lua.org/manual/5.1/'
lua Help.map_api 'https://www.lua.org/manual/5.1/#index'


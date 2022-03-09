setlocal.formatoptions:remove("o")

nnoremap_buffer("<localleader>x", ":call luaeval(getline('.'))<cr>", "evaluate line")
nnoremap_buffer("<localleader>s", ":w<cr>:luafile %<cr>", "evaluate file")

-- lua Help.map_manual 'https://www.lua.org/manual/5.1/'
-- lua Help.map_api 'https://www.lua.org/manual/5.1/#index'


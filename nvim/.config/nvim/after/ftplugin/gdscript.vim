setlocal formatoptions-=t

lua Help.map_manual 'https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html'
lua Help.map_api 'https://docs.godotengine.org/en/stable/classes/index.html'

nnoremap <buffer> <C-space>	:Telescope find_files find_command=rg,--hidden,--no-ignore,-i,--files,--glob,*gd,--glob,*shader,--glob,*json<cr>
nnoremap <buffer> <F5> :wa<cr>:GodotRun<CR>
nnoremap <buffer> <F6> :wa<cr>:GodotRunCurrent<CR>


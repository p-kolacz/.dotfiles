setlocal formatoptions-=t

lua Help.map_manual 'https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html'
lua Help.map_api 'https://docs.godotengine.org/en/stable/classes/index.html'

nnoremap <buffer> <C-space>	:Telescope find_files find_command=rg,--hidden,--no-ignore,-i,--files,--glob,*gd,--glob,*shader,--glob,*json<cr>
nnoremap <buffer> <F5> :wa<cr>:GodotRun<CR>
nnoremap <buffer> <F6> :wa<cr>:GodotRunCurrent<CR>

" iunmap <cr>

lua <<ENDLUA
--[[
require'compe'.setup {
	preselect = 'disable',
	source = {
		debug = true,
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		ultisnips = true,
		-- nvim_lua = true,
	}
}
]]
ENDLUA

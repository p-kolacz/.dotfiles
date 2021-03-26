package.loaded.layers = nil
local layers = require("layers")

layers.define({

	------------------------------ Global settings ----------------------------- "
	"layers/commands.vim",
	"layers/options.vim",
	-- "layers/$TERM.vim",
	"layers/lua.vim",

	-------------------------------- Key mappings ------------------------------ "
	"layers/which-key.vim",
	"layers/mappings.vim",
	"layers/plug.vim",

	--------------------------------- Appearance  ------------------------------ "
	"layers/appearance.vim",
	"layers/themes/nightfly.vim",
	"layers/airline.vim",

	--------------------------------- Navigation ------------------------------- "
	-- set mouse=a
	{ "layers/telescope.vim",
		"telescope-setup" },
	"layers/open-browser.vim",

	---------------------------------- General --------------------------------- "
	-- Plug 'tpope/vim-surround'
	-- Plug 'tpope/vim-repeat'
	-- Plug 'michaeljsmith/vim-indent-object'
	"layers/coc.vim",
	"layers/commentary.vim",
	"layers/filesystem.vim"	,
	"layers/ultisnips.vim",

	--------------------------------- Languages -------------------------------- "
	"layers/csv.vim",
	"layers/fish.vim",
	"layers/gdscript.vim",
	-- " ftplugin/json.vim
	"layers/markdown.vim",
	"layers/python.vim",
	"layers/sxhkd.vim",
	"layers/webdev.vim",
	-- " ftplugin/vim.vim

	----------------------------------- Tools ---------------------------------- "
	"layers/cheatsh.vim",
	"layers/fugitive.vim",
	"layers/figlet.vim",
	"layers/rest.vim",
	"layers/help.vim",
	"layers/vimwiki.vim",
	"layers/unicode.vim",

})


layers.plug_begin()
layers.source(1)
layers.plug_end()
layers.source(2)

vim.cmd("execute 'colorscheme '.g:colorscheme")
--[[
call which_key#register('<Space>', "g:which_key_map")
" lua print(vim.fn.stdpath('config'))
" luafile vim.fn.stdpath('config')..'layers/telescope-setup.lua'

" Load project specific configuration
if filereadable('.project.vim')
	source .project.vim
endif
]]

-- package.loaded.layers = nil
local layers = require("layers")
Vimplug = require("vimplug")

layers.define {

	------------------------------ Global settings -----------------------------
	"layers/commands.vim",
	"layers/options.vim",

	-------------------------------- Key mappings ------------------------------
	{ "layers/which-key.vim", "layers/which-key-setup.vim" },
	"layers/mappings.vim",
	"layers/plug.vim",

	--------------------------------- Appearance  ------------------------------
	"layers/appearance.vim",
	"layers/themes/nightfly.vim",
	{ nil, "statusline" },
	-- "layers/airline.vim",
	-- { "layers/galaxyline.vim", "galaxyline-setup" },
	{ "gitsigns-plugin", "gitsigns-setup" },

	--------------------------------- Navigation -------------------------------
	{ "layers/telescope.vim", "telescope-setup" },
	"layers/open-browser.vim",

	---------------------------------- General ---------------------------------
	"layers/editing.vim",
	"layers/commentary.vim",
	-- "layers/coc.vim",
	{ "layers/lsp.vim", "lsp" },
	{ "compe-plugin", "compe-setup" },
	"layers/filesystem.vim"	,
	"layers/ultisnips.vim",

	--------------------------------- Languages --------------------------------
	{ nil, "bash" },
	"layers/csv.vim",
	"layers/fish.vim",
	{ "layers/gdscript.vim", "gdscript" },
	-- { nil, "gdscript" },
	{ "layers/lua.vim", "lua-setup" },
	-- ftplugin/json.vim
	"layers/markdown.vim",
	-- layers/python.vim",
	{ nil, "php" },
	{ nil, "python" },
	{ nil, "sql-setup" },
	"layers/sxhkd.vim",
	"layers/webdev.vim",
	-- " ftplugin/vim.vim

	----------------------------------- Tools ----------------------------------
	-- "layers/cheatsh.vim",
	"layers/fugitive.vim",
	"layers/figlet.vim",
	"layers/rest.vim",
	"layers/help.vim",
	"layers/vimwiki.vim",
	"layers/unicode.vim",
}


Vimplug.plug_begin()
layers.source(1)
Vimplug.plug_end()
layers.source(2)

vim.cmd("execute 'colorscheme '.g:colorscheme")

-- Load project specific configuration
if vim.fn["filereadable"]("project.vim") > 0 then
	vim.cmd("source project.vim")
end


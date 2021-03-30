Plug = require 'sme-plug'
require 'layers'.source {

------------------------------ Global settings -----------------------------
"layers/commands.vim",
"layers/options.vim",

-------------------------------- Key mappings ------------------------------
"layers/which-key.vim",
"layers/mappings.vim",

--------------------------------- Appearance  ------------------------------
"layers/appearance.vim",
"layers/themes/nightfly.vim",
"icons",
"statusline",

--------------------------------- Navigation -------------------------------
"layers/telescope.vim",
"telescope-setup",
"layers/open-browser.vim",
-- { plug = 'kyazdani42/nvim-tree.lua', },

---------------------------------- General ---------------------------------
"layers/commentary.vim",
"layers/editing.vim",
"lsp",
"compe-setup",
"layers/filesystem.vim",
"layers/ultisnips.vim",

--------------------------------- Languages --------------------------------
"bash-ft",
"layers/csv.vim",
"layers/fish.vim",
"layers/gdscript.vim", "gdscript" ,
"lua-ft",
-- ftplugin/json.vim
"layers/markdown.vim",
"php",
"python",
"sql",
"layers/sxhkd.vim",
"layers/webdev.vim",
-- " ftplugin/vim.vim

----------------------------------- Tools ----------------------------------
-- "cheatsh.vim",
"layers/fugitive.vim",
"gitsigns",
"layers/figlet.vim",
"layers/rest.vim",
"layers/help.vim",
"layers/vimwiki.vim",
"layers/unicode.vim",

}

-- Load project specific configuration
if vim.fn["filereadable"]("project.vim") > 0 then
	vim.cmd("source project.vim")
end

-- vim.cmd('colorscheme nightfly')

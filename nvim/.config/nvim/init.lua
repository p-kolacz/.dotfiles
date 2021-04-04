Plug = require 'sme-plug'
Map = require 'sme-map'
require 'layers'.source {

------------------------------ Global settings -----------------------------
"layers/commands.vim",
"layers/options.vim",

-------------------------------- Key mappings ------------------------------
"layers/which-key.vim",
"layers/mappings.vim",
"layers/map-edit.vim",
"map-project",

--------------------------------- Appearance  ------------------------------
"layers/appearance.vim",
"layers/themes/nightfly.vim",
"icons",
"statusline",

--------------------------------- Navigation -------------------------------
"telescope",
"layers/open-browser.vim",
"nvim-tree",

---------------------------------- General ---------------------------------
"colorizer",
"layers/commentary.vim",
"layers/editing.vim",
"lsp",
"compe",
"lspsaga",
"layers/filesystem.vim",
-- "gitsigns",
"layers/ultisnips.vim",

--------------------------------- Languages --------------------------------
"bash-ft",
"layers/csv.vim",
"css",
"layers/fish.vim",
"layers/gdscript.vim",
"gdscript" ,
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
"codi",
"layers/fugitive.vim",
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


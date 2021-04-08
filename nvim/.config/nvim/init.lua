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
"colorizer",
"icons",
"statusline",
"marksigns",

--------------------------------- Navigation -------------------------------
"telescope",
"layers/open-browser.vim",
"nvim-tree",

---------------------------------- General ---------------------------------
"layers/commentary.vim",
"layers/editing.vim",
"gitsigns",		-- must be after plenary
"lsp",
"compe",
-- "lspsaga",
"layers/filesystem.vim",
"layers/ultisnips.vim",
"treesitter",

--------------------------------- Languages --------------------------------
"bash-ft",
"layers/csv.vim",
"css",
"layers/fish.vim",
"layers/gdscript.vim",
"gdscript" ,
"lua-ft",
-- after/ftplugin/json.vim --
"layers/markdown.vim",
"php",
"python",
"sql",
"layers/sxhkd.vim",
"layers/webdev.vim",
"vim",
-- after/ftplugin/vim.vim --

----------------------------------- Tools ----------------------------------
-- "cheatsh.vim",
"cheatsheet",
"codi",
"layers/fugitive.vim",
"layers/figlet.vim",
"layers/rest.vim",
"layers/help.vim",
-- "layers/vimwiki.vim",
"layers/unicode.vim",

}

-- Load project specific configuration
if vim.fn["filereadable"]("project.vim") > 0 then
	vim.cmd("source project.vim")
end


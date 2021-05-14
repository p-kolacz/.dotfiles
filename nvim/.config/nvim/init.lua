Plug = require 'sme-plug'
Map = require 'sme-map'
Help = require 'sme-help'
require 'config'.source {

------------------------------ Global settings -----------------------------
"layers/commands.vim",
"layers/options.vim",

-------------------------------- Key mappings ------------------------------
"layers/which-key.vim",
"layers/mappings.vim",
"layers/map-edit.vim",
"maps/map-project",

--------------------------------- Appearance  ------------------------------
"layers/appearance.vim",
"layers/themes/nightfly.vim",
-- "layers/themes/oceanic-next.vim",
-- "themes/tokyonight",
"conf/colorizer",
"conf/icons",
"conf/statusline",
"conf/marksigns",

--------------------------------- Navigation -------------------------------
"conf/telescope",
"layers/open-browser.vim",
"conf/nvim-tree",

---------------------------------- General ---------------------------------
"layers/commentary.vim",
"layers/editing.vim",
"conf/gitsigns",		-- must be after plenary
"conf/lsp",
"conf/lsp-icons",
"conf/compe",
-- "lspsaga",
"layers/filesystem.vim",
"layers/ultisnips.vim",
-- "conf/treesitter",

--------------------------------- Languages --------------------------------
"lang/bash",
"lang/css",
"layers/csv.vim",
"layers/fish.vim",
"lang/gdscript" ,
"lang/lua",
-- after/ftplugin/json.vim --
"layers/markdown.vim",
"lang/php",
"lang/python",
"lang/sql",
"layers/sxhkd.vim",
"layers/webdev.vim",
"lang/vim",
-- after/ftplugin/vim.vim --

----------------------------------- Tools ----------------------------------
-- "cheatsh.vim",
"conf/cheatsheet",
"conf/codi",
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


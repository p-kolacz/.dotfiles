require "lib/lua_helpers"
require "lib/sme-plug"
require "lib/sme-map"
Help = require "lib/sme-help"

require "lib/config" {

-- General settings --------------------
	"conf/options",
	"conf/which-key",
	"conf/mappings",

-- Appearance  -------------------------
	"conf/appearance",
	"conf/colorizer",

-- General -----------------------------
"conf/file",
"conf/edit",
"conf/lsp",
"conf/lsp-icons",
"conf/completion",
"conf/ultisnips",
"conf/treesitter",

-- Navigation --------------------------
"conf/telescope",
"conf/nvim-tree",
"conf/gitsigns",		-- must be after plenary

-- Languages ---------------------------
"lang/bash",
"layers/csv.vim",
"lang/gdscript" ,
"lang/lua",
"layers/markdown.vim",
"lang/php",
"lang/python",
"lang/sql",
"layers/sxhkd.vim",
"layers/webdev.vim",
"lang/webdev",
"lang/vim",
"lang/org-mode",
"lang/recutils",

-- Tools ------------------------------
"conf/cheatsheet",
"conf/figlet",
"layers/rest.vim",
"layers/help.vim",
-- "conf/help",
}

-- Load project specific configuration
if vim.fn.filereadable("project.vim") > 0 then
	vim.cmd("source project.vim")
end


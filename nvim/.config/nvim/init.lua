require "lib/helpers"
require "lib/plugozaur"
require "lib/mapper"
Help = require "lib/helpozor"

Require {

-- Configuration -----------------------
	"conf/options",
	"conf/which-key",
	"conf/mappings",
	"conf/appearance",

-- Tools -------------------------------
	"tool/tpope",
	"tool/lsp",
	"tool/completion",
	"tool/ultisnips",
	"tool/treesitter",
	"tool/telescope",
	"tool/nvim-tree",
	"tool/gitsigns",
	"tool/cheatsheet",
	"tool/colorizer",
	"tool/figlet",
	"tool/rest",
	-- "tool/lightspeed",

-- Languages ---------------------------
	"lang/bash",
	"lang/csv",
	"lang/gdscript" ,
	"lang/lua",
	"lang/markdown",
	"lang/php",
	"lang/python",
	"lang/sql",
	"lang/sxhkd",
	"lang/webdev",
	"lang/org-mode",
	"lang/recutils",

}

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end


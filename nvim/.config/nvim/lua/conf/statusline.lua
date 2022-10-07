Plugin {
	"https://github.com/nvim-lualine/lualine.nvim",
}

require "lualine".setup {
	options = {
		-- theme = "auto",
		-- theme = "papercolor_light",
		theme = "solarized",
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#available-themes
		globalstatus = true,
	},
	tabline = {
		lualine_a = {"tabs"},
	}
}

-- require "tabline".setup {
-- 	options = {
-- 		-- show_tabs_always = false,
-- 		show_tabs_only = true,
-- 	}
-- }

-- set.laststatus = 3
-- require "lib/statepipe".setup {
-- 	{
-- 		"mode", "filetype_full",  "spell", "readonly", "modified",  "separator",
-- 		"short_path", "lsp_icon",
-- 		"separator", "diagnostics","encoding", "column", "lines", "percent",
-- 	},
-- 	{ "modified", "separator", "readonly", "filename",  "separator" }
-- }



Plugin "https://github.com/nvim-lualine/lualine.nvim"

-- Plugin "https://github.com/WhoIsSethDaniel/lualine-lsp-progress.nvim"

require "lualine".setup {
	options = {
		theme = "auto",
		-- theme = "papercolor_light",
		-- theme = "solarized",
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#available-themes
		globalstatus = true,
	},
	sections = {
		lualine_c = {},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
	},
	winbar = {
		lualine_b = {'filename',},
	},
	inactive_winbar= {
		lualine_b = {'filename',},
	},
	tabline = {
		lualine_z = {"tabs"},
	}
}


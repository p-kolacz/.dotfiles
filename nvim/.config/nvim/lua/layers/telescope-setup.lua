local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous
			},
		},
		winblend = 20,
	}
}

-- Telescope Ultisnips
-- https://github.com/fhill2/telescope-ultisnips.nvim
require('telescope').load_extension('ultisnips')


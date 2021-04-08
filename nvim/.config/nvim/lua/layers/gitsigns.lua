-- https://github.com/lewis6991/gitsigns.nvim

Plug.add 'lewis6991/gitsigns.nvim'

-- vim.wo.signcolumn = "yes:2"
require('gitsigns').setup {
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,

		-- ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		-- ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

		-- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		-- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		-- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		-- ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		-- ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		-- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

		-- Text objects
		-- ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
		-- ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
	},
}

Map.nb('<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'preview chunk')


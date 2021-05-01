 -- _____    _                                             _
-- |_   _|__| | ___  ___  ___ ___  _ __   ___   _ ____   _(_)_ __ ___
 --  | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \ | '_ \ \ / / | '_ ` _ \
 --  | |  __/ |  __/\__ \ (_| (_) | |_) |  __/_| | | \ V /| | | | | | |
 --  |_|\___|_|\___||___/\___\___/| .__/ \___(_)_| |_|\_/ |_|_| |_| |_|
 --                               |_|
-- https://github.com/nvim-telescope/telescope.nvim

Plug.add('nvim-lua/popup.nvim')
Plug.add('nvim-lua/plenary.nvim')
Plug.add('nvim-telescope/telescope.nvim')
Plug.add('nvim-telescope/telescope-symbols.nvim')

--https://github.com/nvim-telescope/telescope.nvim#pickers

--File pickers
Map.n('<C-space>', ':Telescope find_files find_command=rg,--hidden,--no-ignore,-i,--files<cr>')
Map.n('<leader>gf', ':Telescope git_files<cr>', 'find files')
Map.n('<leader>fc', ':Telescope grep_string<cr>', 'find cword')
Map.n('<leader>ff', ':Telescope live_grep<cr>', 'find in files')
Map.n('<leader>fb', ':Telescope file_browser theme=get_dropdown<cr>', 'browse files')

--Vim pickers
Map.n('<leader>vb', ':Telescope buffers<cr>', 'buffers')
Map.n('<leader>fh', ':Telescope oldfiles<cr>', 'history')
Map.n('<leader>vc', ':Telescope commands theme=get_dropdown<cr>', 'commands')
Map.n('<C-p>',		':Telescope commands theme=get_dropdown<cr>')
Map.n('<leader>vx', ':Telescope command_history theme=get_dropdown<cr>', 'cmd history')
Map.n('<leader>ht', ':Telescope help_tags<cr>', 'help tags')
Map.n('<leader>vq', ':Telescope quickfix<cr>', 'quickfix list')
Map.n('<leader>vl', ':Telescope loclist<cr>', 'loc list')
Map.n('<leader>vo', ':Telescope vim_options theme=get_dropdown<cr>', 'options')
Map.n('<leader>vr', ':Telescope registers<cr>', 'registers')
Map.n('<leader>su', ':Telescope spell_suggest theme=get_dropdown<cr>', 'suggest')
Map.n('<leader>vk', ':Telescope keymaps<cr>', 'keymaps')
Map.n('<leader>vf', ':Telescope filetypes theme=get_dropdown<cr>', 'filetypes')
Map.n('<leader>vh', ':Telescope highlights<cr>', 'highlights')
Map.n('<leader>/', ':Telescope current_buffer_fuzzy_find theme=get_dropdown<cr>', 'search')

--LSP Pickers

--Git Pickers
Map.desc('gc', '+Commits')
Map.n('<leader>gcc', ':Telescope git_commits<cr>', 'commits')
Map.n('<leader>gcb', ':Telescope git_bcommits<cr>', 'buffer commits')
Map.n('<leader>gb', ':Telescope git_branches<cr>', 'branches')
Map.n('<leader>gs', ':Telescope git_status<cr>', 'status')

--Treesitter
Map.n('<leader>tt', ':Telescope treesitter<cr>', 'treesitter')

--Symbols
Map.n('<leader>ie', ":lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>", 'emoji')
Map.n('<leader>ik', ":lua require'telescope.builtin'.symbols{ sources = {'kaomoji'} }<cr>", 'kaomoji')
Map.n('<leader>im', ":lua require'telescope.builtin'.symbols{ sources = {'math'} }<cr>", 'math')
Map.n('<leader>il', ":lua require'telescope.builtin'.symbols{ sources = {'latex'} }<cr>", 'latex')


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
Map.n('<leader>cs', ':Telescope ultisnips ultisnips theme=get_dropdown<cr>', 'snippets')


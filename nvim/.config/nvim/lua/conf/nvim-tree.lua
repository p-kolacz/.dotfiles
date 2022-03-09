Plugin "https://github.com/kyazdani42/nvim-tree.lua"

vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }
require'nvim-tree'.setup {
	auto_close	= true,
	-- hijack_cursor = false,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	view = {
		mappings = {
			list = {
				{ key = "l", action = {"edit_in_place"} },
				-- { key = "h", action = {"close_node"} },		# bugged?
			},
		},
	},
}

nnoremap('<F8>', ':NvimTreeToggle<cr>')
nnoremap('<leader>fl', ':NvimTreeFindFile<cr>', 'locate in tree')


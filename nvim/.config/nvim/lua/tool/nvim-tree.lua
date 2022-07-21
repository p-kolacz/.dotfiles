Plugin "https://github.com/kyazdani42/nvim-tree.lua"

local icons = { unpack(Icons.diagnostics) }
icons.warning = icons.warn
icons.warn = nil

require'nvim-tree'.setup {
	diagnostics = {
		enable = true,
		icons = icons,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all" }
			},
		},
	},
}

nnoremap('<F8>', ':NvimTreeToggle<cr>')
nnoremap('<leader>fl', ':NvimTreeFindFile<cr>', 'locate in tree')


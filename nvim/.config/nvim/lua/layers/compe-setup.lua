vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 10

require'compe'.setup {
	preselect = 'always',
	source = {
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
	}
}

local map = require'map'

local opts = { expr = true }
-- map.i('<cr>', "compe#confirm('<cr>')", nil, opts)
map.i('<C-e>', "compe#close('<C-e>')", nil, opts)


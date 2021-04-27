-- https://github.com/hrsh7th/nvim-compe
Plug.add 'hrsh7th/nvim-compe'

vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 10

require'compe'.setup {
	preselect = 'always',
	source = {
		debug = true,
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		ultisnips = true,
		-- nvim_lua = true,
	}
}


local opts = { expr = true }
-- Map.i('<cr>', "compe#confirm('<cr>')", nil, opts)
Map.i('<C-e>', "compe#close('<C-e>')", nil, opts)


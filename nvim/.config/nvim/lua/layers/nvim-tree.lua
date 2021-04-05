-- https://github.com/kyazdani42/nvim-tree.lua

Plug.add 'kyazdani42/nvim-tree.lua'
Map.n('<F8>', ':NvimTreeToggle<cr>')
Map.n('<leader>fl', ':NvimTreeFindFile<cr>', 'show in tree')

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }


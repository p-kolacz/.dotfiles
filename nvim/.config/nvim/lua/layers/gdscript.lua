-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gdscript
--
require'lspconfig'.gdscript.setup{
	cmd = {"gdlog.sh", "localhost", "6008"},
}

-- FT plugin
-- ftplugin/gdscript.vim

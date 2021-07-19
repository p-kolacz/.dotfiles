-- ~/.config/nvim/after/ftplugin/gdscript.vim
-- https://github.com/habamax/vim-godot
Plug.add 'habamax/vim-godot'
-- let g:godot_ext_hl=v:true

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gdscript
--[[
require'lspconfig'.gdscript.setup{
	-- cmd = {"gdlog.sh", "localhost", "6008"},
	cmd = {"nc", "localhost", "6008"},
	on_attach = LSP_ON_ATTACH,
}
]]

-- FT plugin
-- after/ftplugin/gdscript.vim

-- PHPActor
require'lspconfig'.phpactor.setup {
	cmd = { LSP_DATA_HOME.."phpactor/bin/phpactor", "language-server" }
}

--[[
-- Intelephense
require'lspconfig'.intelephense.setup{
	cmd = { LSP_NODE_BIN .. "intelephense", "--stdio" },
	on_attach = LSP_ON_ATTACH,
	-- initializationOptions = {
	-- 	globalStoragePath = '/home/piotr/.cache/intelephense',
	-- },
}
]]


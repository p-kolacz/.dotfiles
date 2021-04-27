require'lspconfig'.intelephense.setup{
	cmd = { LSP_NODE_BIN .. "intelephense", "--stdio" },
	on_attach = LSP_ON_ATTACH,
	-- initializationOptions = {
	-- 	globalStoragePath = '/home/piotr/.cache/intelephense',
	-- },
}


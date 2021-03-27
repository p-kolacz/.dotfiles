require'lspconfig'.intelephense.setup{
	cmd = { LSP_NODE_HOME .. "intelephense", "--stdio" },
	on_attach = LSP_ON_ATTACH
}


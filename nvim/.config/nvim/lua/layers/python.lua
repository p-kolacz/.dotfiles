require("lspconfig").pyright.setup{
	cmd = { LSP_NODE_HOME .. "pyright-langserver", "--stdio"},
	on_attach = LSP_ON_ATTACH,
}


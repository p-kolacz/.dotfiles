require("lspconfig").pyright.setup{
	cmd = { LSP_NODE_BIN .. "pyright-langserver", "--stdio"},
	on_attach = LSP_ON_ATTACH,
}


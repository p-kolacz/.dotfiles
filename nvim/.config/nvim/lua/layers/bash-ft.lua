require("lspconfig").bashls.setup{
	cmd = { LSP_NODE_HOME .. "bash-language-server", "start"},
	on_attach = LSP_ON_ATTACH,
}


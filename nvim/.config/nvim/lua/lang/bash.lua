require("lspconfig").bashls.setup {
	cmd = { LSP_NODE_BIN .. "bash-language-server", "start" },
	on_attach = LSP_ON_ATTACH,
}


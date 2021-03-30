require'lspconfig'.sqlls.setup{
	cmd = { LSP_NODE_HOME .. "sql-language-server", "up", "--method", "stdio"},
	on_attach = LSP_ON_ATTACH
}


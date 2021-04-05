require'lspconfig'.vimls.setup{
	cmd = { LSP_NODE_BIN.."vim-language-server", "--stdio" },
	on_attach = LSP_ON_ATTACH,
}


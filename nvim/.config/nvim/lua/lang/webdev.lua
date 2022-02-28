-- __        __   _     ____
-- \ \      / /__| |__ |  _ \  _____   __
--  \ \ /\ / / _ \ '_ \| | | |/ _ \ \ / /
--   \ V  V /  __/ |_) | |_| |  __/\ V /
--    \_/\_/ \___|_.__/|____/ \___| \_/

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require "lspconfig"
lspconfig.html.setup {
	cmd = { LSP_NODE_BIN .. 'vscode-html-language-server', '--stdio' },
	capabilities = capabilities,
}

lspconfig.cssls.setup {
	cmd = { LSP_NODE_BIN .. 'vscode-css-language-server', '--stdio' },
	capabilities = capabilities,
}

lspconfig.tsserver.setup {
	cmd = { LSP_NODE_BIN .. 'typescript-language-server', '--stdio' },
}


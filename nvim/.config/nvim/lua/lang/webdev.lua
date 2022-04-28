-- __        __   _     ____
-- \ \      / /__| |__ |  _ \  _____   __
--  \ \ /\ / / _ \ '_ \| | | |/ _ \ \ / /
--   \ V  V /  __/ |_) | |_| |  __/\ V /
--    \_/\_/ \___|_.__/|____/ \___| \_/

-- Czy Emmet potrzebny przy LSP?

vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")

local lspconfig = require "lspconfig"
lspconfig.html.setup {
	cmd = { LSP_NODE_BIN .. 'vscode-html-language-server', '--stdio' },
	capabilities = LSP_CAPABILITIES,
}

lspconfig.cssls.setup {
	cmd = { LSP_NODE_BIN .. 'vscode-css-language-server', '--stdio' },
	capabilities = LSP_CAPABILITIES,
}

lspconfig.tsserver.setup {
	cmd = { LSP_NODE_BIN .. 'typescript-language-server', '--stdio' },
}


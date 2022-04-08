-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
Plugin "https://github.com/neovim/nvim-lspconfig"

LSP_DATA_HOME = vim.fn.stdpath('data') .. '/lsp/'
LSP_NODE_BIN = LSP_DATA_HOME .. 'node_modules/.bin/'

mapgroup("<leader>cd", "+Diagnostic")
nnoremap('<leader>cdf', '<cmd>lua vim.diagnostic.open_float()<CR>')
nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nnoremap('<leader>cdl', '<cmd>lua vim.diagnostic.setloclist()<CR>', "diag set loclist")

mapgroup("<leader>cl", "+LSP")
nnoremap('<leader>cli', ':LspInfo<cr>', 'info')
nnoremap('<leader>cls', ':LspStart<cr>', 'start')
nnoremap('<leader>clS', ':LspStop<cr>', 'stop')
nnoremap('<leader>clr', ':LspRestart<cr>', 'restart')
nnoremap("<leader>clt", ":split | lcd "..LSP_DATA_HOME.." | terminal", "terminal to LSP data")
nnoremap("<leader>cll", ":lua vim.cmd('e'..vim.lsp.get_log_path())<cr>", "logs")

LSP_ON_ATTACH = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	nnoremap_buffer('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
	nnoremap_buffer('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
	nnoremap_buffer('<leader>ck', '<Cmd>lua vim.lsp.buf.hover()<CR>', "LSP hover")
	nnoremap_buffer('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	nnoremap_buffer('<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature')
	-- nnoremap_buffer('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	-- nnoremap_buffer('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	-- nnoremap_buffer('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	nnoremap_buffer('<leader>cd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition')
	nnoremap_buffer('<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename')
	nnoremap_buffer('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
end


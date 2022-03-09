-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
Plugin "https://github.com/neovim/nvim-lspconfig"

mapgroup("<leader>cd", "+Diagnostic")
nnoremap('<leader>cdf', '<cmd>lua vim.diagnostic.open_float()<CR>')
nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nnoremap('<leader>cdl', '<cmd>lua vim.diagnostic.setloclist()<CR>', "diag set loclist")
nnoremap('<leader>ci', ':LspInfo<cr>', 'LSP info')

LSP_DATA_HOME = vim.fn.stdpath('data') .. '/lsp/'
LSP_NODE_BIN = LSP_DATA_HOME .. 'node_modules/.bin/'

LSP_ON_ATTACH = function(client, bufnr)
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Mappings.
	nnoremap_buffer('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
	nnoremap_buffer('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
	nnoremap_buffer('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
	nnoremap_buffer('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	nnoremap_buffer('<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature')
	-- nnoremap_buffer('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	-- nnoremap_buffer('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	-- nnoremap_buffer('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	nnoremap_buffer('<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition')
	nnoremap_buffer('<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename')
	nnoremap_buffer('gr', '<cmd>lua vim.lsp.buf.references()<CR>')

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		nnoremap_buffer("<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", 'formatting')
	elseif client.resolved_capabilities.document_range_formatting then
		nnoremap_buffer("<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", 'formatting')
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			hi LspReferenceRead cterm=bold ctermbg=red gui=underline
			hi LspReferenceText cterm=bold ctermbg=red gui=underline
			hi LspReferenceWrite cterm=bold ctermbg=red gui=underline
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
				augroup END
		]], false)
	end
end


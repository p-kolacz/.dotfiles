Plug.add 'neovim/nvim-lspconfig'

Map.n('<leader>ci', ':LspInfo<cr>', 'LSP info')

LSP_DATA_HOME = vim.fn.stdpath('data') .. '/lsp/'
LSP_NODE_BIN = LSP_DATA_HOME .. 'node_modules/.bin/'

require('conf/lsp-icons')

LSP_ON_ATTACH = function(client, bufnr)
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Mappings.
	Map.nb('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
	Map.nb('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
	-- Map.nb('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
	Map.nb('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	Map.nb('<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature')
	-- Map.nb('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	-- Map.nb('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	-- Map.nb('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	Map.nb('<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition')
	Map.nb('<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename')
	Map.nb('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	Map.nb('<leader>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'diagnostics')
	Map.nb('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	Map.nb(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	Map.nb('<leader>cl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'diag loclist')

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		Map.nb("<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", 'formatting')
	elseif client.resolved_capabilities.document_range_formatting then
		Map.nb("<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", 'formatting')
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


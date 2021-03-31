Plug.add 'neovim/nvim-lspconfig'

Map.n('<leader>ci', ':LspInfo<cr>')

LSP_DATA_HOME = vim.fn.stdpath('data') .. '/lsp/'
LSP_NODE_HOME = LSP_DATA_HOME .. 'node_modules/.bin/'

require('layers/lsp-icons')

LSP_ON_ATTACH = function(client, bufnr)
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Mappings.
	Map.nb('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
	Map.nb('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
	-- Map.nb('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
	Map.nb('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	Map.nb('<leader>hs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- Map.nb('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	-- Map.nb('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	-- Map.nb('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	Map.nb('<space>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	Map.nb('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
	Map.nb('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	Map.nb('<space>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	Map.nb('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	Map.nb(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	Map.nb('<space>cl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		Map.nb("<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	elseif client.resolved_capabilities.document_range_formatting then
		Map.nb("<space>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
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


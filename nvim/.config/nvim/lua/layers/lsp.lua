LSP_DATA_HOME = vim.fn.stdpath('data') .. '/lsp/'
LSP_NODE_HOME = LSP_DATA_HOME .. 'node_modules/.bin/'

require('layers/lsp-icons')

LSP_ON_ATTACH = function(client, bufnr)
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Mappings.
	local map = require('map')
	map.n('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
	map.n('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
	map.n('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
	map.n('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	map.n('<leader>hs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map.n('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	-- map.n('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	-- map.n('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	map.n('<space>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map.n('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
	map.n('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	map.n('<space>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	map.n('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	map.n(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	map.n('<space>cl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		map.n("<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	elseif client.resolved_capabilities.document_range_formatting then
		map.n("<space>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
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


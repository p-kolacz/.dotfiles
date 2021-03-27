LSP_DATA_HOME = vim.fn.stdpath('data') .. '/lsp/'
LSP_NODE_HOME = LSP_DATA_HOME .. 'node_modules/.bin/'

require('layers/lsp-icons')

LSP_ON_ATTACH = function(client, bufnr)
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Mappings.
	local map = require('map')
	map.nb('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
	map.nb('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
	map.nb('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
	map.nb('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	map.nb('<leader>hs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map.nb('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	-- map.nb('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	-- map.nb('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	map.nb('<space>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map.nb('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
	map.nb('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	map.nb('<space>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	map.nb('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	map.nb(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	map.nb('<space>cl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		map.nb("<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	elseif client.resolved_capabilities.document_range_formatting then
		map.nb("<space>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
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


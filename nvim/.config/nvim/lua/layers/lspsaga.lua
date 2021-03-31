Plug.add 'glepnir/lspsaga.nvim'

require'lspsaga'.init_lsp_saga()

-- find the cursor word definition and reference
Map.n('gh' ,':Lspsaga lsp_finder<CR>', 'def&ref')

-- code actions
Map.n('<leader>ca' ,':Lspsaga code_action<CR>', 'code actions')
Map.v('<leader>ca' ,':<C-U>Lspsaga range_code_action<CR>')

-- hover doc
Map.n('K', ':Lspsaga hover_doc<CR>')

-- scroll down hover doc or scroll in definition preview
Map.n('<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
Map.n('<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- signature help
Map.n('gs', ':Lspsaga signature_help<CR>')

-- rename
Map.n('cr', ':Lspsaga rename<CR>', 'rename')


  -- ____  ___
 -- / ___|/ _ \
-- | |  _| | | |
-- | |_| | |_| |
 -- \____|\___/

-- https://github.com/golang/tools/tree/master/gopls

require"lspconfig".gopls.setup {
	-- cmd = { vim.fn.stdpath("data").."/../go/bin/gopls" },
	on_attach = LSP_ON_ATTACH,
}


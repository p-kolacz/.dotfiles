-- Enable embeded lua syntax highlighting
vim.g.vimsyn_embed= 'l'

-- LS
require'lspconfig'.sumneko_lua.setup {
	cmd = {
		LSP_DATA_HOME .. "lua-language-server/bin/Linux/lua-language-server",
		"-E",
		LSP_DATA_HOME .. "lua-language-server/main.lua",
	},
	settings = {
		Lua = {
			runtime = {
				-- LuaJIT for neovim
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
	on_attach = LSP_ON_ATTACH,
}


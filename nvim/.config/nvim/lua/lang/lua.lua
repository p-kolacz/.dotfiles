vim.g.vimsyn_embed= 'l'		-- Enable embeded lua syntax highlighting

-- require'lspconfig'.sumneko_lua.setup {
-- 	cmd = {
-- 		LSP_DATA_HOME .. "lua-language-server/bin/lua-language-server",
-- 		"-E",
-- 		LSP_DATA_HOME .. "lua-language-server/main.lua",
-- 	},
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = 'LuaJIT',						-- LuaJIT for neovim
-- 				path = vim.split(package.path, ';'),	-- Setup your lua path
-- 			},
-- 			diagnostics = {
-- 				globals = {'vim'},						-- Get the language server to recognize the `vim` global
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = {
-- 					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
-- 					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
-- 				},
-- 			},
-- 			completion = {
-- 				keywordSnippet = 'Disable'
-- 			},
-- 		},
-- 	},
-- 	on_attach = LSP_ON_ATTACH,
-- 	capabilities = LSP_CAPABILITIES,
-- }
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
	cmd = {
		LSP_DATA_HOME .. "lua-language-server/bin/lua-language-server",
		-- "-E",
		-- LSP_DATA_HOME .. "lua-language-server/main.lua",
	},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = LSP_ON_ATTACH,
	capabilities = LSP_CAPABILITIES,
}


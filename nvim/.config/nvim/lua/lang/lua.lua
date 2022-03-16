let.vimsyn_embed= 'l'		-- Enable embeded lua syntax highlighting

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
	flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
	-- cmd = {
		-- LSP_DATA_HOME .. "lua-language-server/bin/lua-language-server",
		-- "-E",
		-- LSP_DATA_HOME .. "lua-language-server/main.lua",
	-- },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',  -- LuaJIT for Neovim
				path = runtime_path,
			},
			diagnostics = {
				globals = {'vim'},  -- Get the language server to recognize the `vim` global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),  -- Make the server aware of Neovim runtime files
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


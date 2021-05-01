-- Run :TSUpdate after install
Plug.add 'nvim-treesitter/nvim-treesitter'

require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = { "gdscript" },  -- list of language that will be disabled
	},
    -- incremental_selection = { enable = true },
    -- textobjects = { enable = true },
}

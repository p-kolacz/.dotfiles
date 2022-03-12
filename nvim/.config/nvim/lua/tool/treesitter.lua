-- Run :TSUpdate after install
Plugin 'nvim-treesitter/nvim-treesitter'

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "html", "css", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
}


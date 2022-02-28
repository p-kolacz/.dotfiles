-- Run :TSUpdate after install
Plug.add 'nvim-treesitter/nvim-treesitter'

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "html", "css" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
}

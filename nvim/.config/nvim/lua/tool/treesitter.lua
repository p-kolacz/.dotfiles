-- Run :TSUpdate after install
Plugin "https://github.com/nvim-treesitter/nvim-treesitter"

mapgroup("<leader>ct", "+Treesitter")
mapgroup("<leader>cth", "+Highlight")
nnoremap("<leader>cthe", ":TSBufEnable highlight<cr>", "enable buffer highlight")
nnoremap("<leader>cthd", ":TSBufDisable highlight<cr>", "disable buffer highlight")
nnoremap("<leader>ctht", ":TSBufToggle highlight<cr>", "toggle buffer highlight")

require"nvim-treesitter.configs".setup {

	ensure_installed = { "html", "css", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages

	highlight = {
		enable = true,
	},

}


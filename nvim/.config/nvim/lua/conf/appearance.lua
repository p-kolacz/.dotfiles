set.listchars      = "space:•,tab:|->,eol:↲,nbsp:+,trail:•,extends:⟩,precedes:⟨"
set.cursorline     = true
set.wrap           = false
set.number         = true
set.relativenumber = true
set.scrolloff      = 5		-- top and bottom margin in rows
set.showmatch      = true
set.signcolumn     = "yes"
set.splitbelow     = true
set.splitright     = true
set.termguicolors  = true
-- set.shortmess:remove("F")

vim.cmd([[autocmd vimrc TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}]]) -- Highlight yank

Plugin "kyazdani42/nvim-web-devicons"
require "nvim-web-devicons".setup()
-- Plugin "https://github.com/lukas-reineke/indent-blankline.nvim"
require "lib/marketeer".setup()
-- Sign column icons
DIAG_ICONS = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for name, icon in pairs(DIAG_ICONS) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require "conf/themes"
colorscheme "tokyonight"

require "lib/sme-statusline".setup {
	{
		"mode", "filetype",  "spell", "readonly", "modified",  "separator",
		"short_path", "lsp_icon",
		"separator", "diagnostics", "column", "line_count", "percent",
	},
	{ "modified", "separator", "readonly", "filename",  "separator" }
}


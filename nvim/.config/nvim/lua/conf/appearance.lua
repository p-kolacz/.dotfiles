set.listchars      = "space:•,tab:├─>,eol:↲,nbsp:+,trail:•,extends:⟩,precedes:⟨"
vim.opt.fillchars      = {
	fold = " ", foldopen = "", foldclose = "",
	horiz = "═", horizdown = "╦", horizup = "╩",
	vert = "║", vertright = "╠", verthoriz = "╬", vertleft = "╣",
}
set.cursorline     = true
set.wrap           = false
set.number         = true
set.scrolloff      = 5		-- top and bottom margin in rows
set.showmatch      = true
set.signcolumn     = "yes"
set.splitbelow     = true
set.splitright     = true
set.termguicolors  = true
set.foldcolumn     = "auto"
-- set.shortmess:remove("F")

-- Highlight yank
-- vim.cmd([[autocmd vimrc TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}]])
autocmd("TextYankPost", { group = "vimrc", pattern = "*", callback =
	function()
		vim.highlight.on_yank {higroup="IncSearch", timeout=500}
	end
})

Plugin "kyazdani42/nvim-web-devicons"
require "nvim-web-devicons".setup()
require "lib/iconz"
require "conf/themes"
colorscheme "rose-pine"

-- Highlights must be after colorscheme
vim.cmd("highlight Folded gui='italic'")
-- vim.cmd("highlight CursorLineFold gui='italic'")

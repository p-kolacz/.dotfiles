set.listchars      = "space:•,tab:├─>,eol:↲,nbsp:+,trail:•,extends:⟩,precedes:⟨"
set.fillchars      = "horiz:═,vert:║"
set.cursorline     = true
set.wrap           = false
set.number         = true
set.scrolloff      = 5		-- top and bottom margin in rows
set.showmatch      = true
set.signcolumn     = "yes"
set.splitbelow     = true
set.splitright     = true
set.termguicolors  = true
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


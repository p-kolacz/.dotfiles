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

Plugin 'kyazdani42/nvim-web-devicons'
require'nvim-web-devicons'.setup()
require'sme-marksigns'.setup()
require'sme-statusline'.setup()

require "conf/themes"
colorscheme "onedark"


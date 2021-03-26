Plug 'ryanoasis/vim-devicons'

set cursorline
set listchars=space:•,tab:\ ->,eol:↲,nbsp:+,trail:•,extends:⟩,precedes:⟨
set nowrap
set number relativenumber
set scrolloff=5		" top and bottom margin in rows
set showmatch
set signcolumn=yes
set termguicolors
set textwidth=80

" Enable underline & undercurl
" let &t_Cs = "\e[4:3m"
" let &t_Ce = "\e[4:0m"

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

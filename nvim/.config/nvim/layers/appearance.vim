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

" Highlight yank
autocmd vimrc TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

" Icons
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Quick scope
Plug 'unblevable/quick-scope' 
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


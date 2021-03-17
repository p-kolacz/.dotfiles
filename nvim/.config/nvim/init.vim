let mapleader=' '
let maplocalleader=','
set shell=bash
augroup vimrc
	autocmd!
augroup END

if (has("termguicolors"))
	if &term == "alacritty"
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	set termguicolors
endif

"Layers of Vim
	runtime layers/vimonly.vim
	" call plug#begin('~/.vim/plugged')
	call plug#begin(stdpath('data') . '/plugged')

" Which key
	runtime layers/desc.vim
	runtime layers/which-key.vim
	
" Appearance
	Plug 'wincent/terminus'
	runtime layers/airline.vim
	" Plug 'bluz71/vim-nightfly-guicolors'
	Plug 'ryanoasis/vim-devicons'
	" runtime layers/themes/gruvbox.vim
	" runtime layers/themes/oceanic-next.vim
	runtime layers/themes/onedark.vim
	" runtime layers/themes/auto.vim
	Plug 'machakann/vim-highlightedyank'

" Navigation
	" runtime layers/nerdtree.vim
	runtime layers/netrw.vim
	runtime layers/fzf.vim
	runtime layers/open-browser.vim

" General coding
	Plug 'tpope/vim-surround'
	runtime layers/filesystem.vim	
	Plug 'tpope/vim-repeat'
	Plug 'michaeljsmith/vim-indent-object'
	runtime layers/commentary.vim
	runtime layers/fugitive.vim
	" runtime layers/ale.vim
	runtime layers/coc.vim
	runtime layers/ultisnips.vim
	" Plug 'mjbrownie/swapit'
	" Plug 'tommcdo/vim-exchange'

" Languages
	" Plug 'nvie/vim-flake8'
	runtime layers/gdscript.vim
	runtime layers/markdown.vim
	runtime layers/fish.vim
	runtime layers/webdev.vim
	runtime layers/sxhkd.vim
	runtime layers/json.vim
	runtime layers/csv.vim
	runtime layers/python.vim
	" Plug 'ap/vim-css-color'
	" Plug 'vim-scripts/dbext.vim'

" Tools
	" Plug 'freitass/todo.txt-vim'
	" Plug 'vifm/vifm.vim'
	runtime layers/figlet.vim
	runtime layers/lf.vim
	runtime layers/rest.vim
	" Plug 'chrisbra/unicode.vim'
	runtime layers/help.vim
	runtime layers/vimwiki.vim

	call plug#end()

runtime layers/plug.vim

call which_key#register('<Space>', "g:which_key_map")

" Main setup
	scriptencoding utf-8
	set fileformats=unix
	language messages en_US.utf8
	set splitbelow splitright
	" set exrc secure		" Enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
	set scrolloff=5		" top and bottom margin in rows
	" set hidden
	" open help vertically hack
	cnoreabbrev h vert h

" Formating
	set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
	" c - autowrap comments, r - insert comments at <cr>, o - comment after o/O
	autocmd vimrc FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Folding
	set nofoldenable foldmethod=indent

" Searching
	set ignorecase smartcase incsearch nohlsearch

" Appearance
	" Enable underline & undercurl
	let &t_Cs = "\e[4:3m"
	let &t_Ce = "\e[4:0m"
	execute 'colorscheme '.g:colorscheme

	if &term == "xterm-kitty"
		"fix for scrolling background
		set t_ut=""
		" fix for devicons and glitches
		set t_RV=
	endif

	set nowrap
	set number relativenumber
	set signcolumn=yes
	set showmatch showcmd
	set listchars=space:.,tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
	" set fillchars+=vert:┋
	" set fillchars+=vert:\ 
	set fillchars+=vert:│ 
	set cursorline

" Auto save on blur
	autocmd vimrc FocusLost * :wa
	" :autocmd vimrc FocusLost * silent! wa

" Bindings
	inoremap jj <Esc>
	inoremap kk <Esc>
	inoremap jk <Esc>
	nnoremap H ^
	nnoremap L $
	" Ctrl-space
	" inoremap <C-@> _
	nnoremap Y y$
	nnoremap <F12> :e $MYVIMRC<CR>
	nnoremap <C-F12> :source $MYVIMRC<CR>
	" nnoremap <CR> o<Esc>
	vnoremap <C-c> "*y :let @+=@*<CR>
	map <C-v> "+P

	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" nnoremap h <C-w>8<
	" nnoremap j <C-w>8+
	" nnoremap k <C-w>8-
	" nnoremap l <C-w>8>

	nnoremap <leader><leader> :
	nnoremap <leader>w :w<CR>
	call DescIgnore('w')
	" call Desc('w', 'write')

	nnoremap <leader>q :q<CR>
	" call Desc('q', 'quit')
	call DescIgnore('q')
	nnoremap <leader>Q :wq<CR>
	call Desc('Q', 'write&quit')

	call Desc('f', '+File')
	nnoremap <leader>fe :e<space>
	call Desc('f.e', 'edit')

	nnoremap <leader>dw df_
	call Desc('d.w', 'delete till _')
	nnoremap <leader>cw ct_
	call Desc('c.w', 'change till _')

	call Desc('e', '+Edit')
	nnoremap <leader>er :%s/

	call Desc('o.s', '+Spell')
	nnoremap <leader>oss :setlocal spell!<CR>
	call Desc('o.s.s', 'spell check')
	nnoremap <leader>osc :setlocal complete+=kspell<CR>
	call Desc('o.s.c', 'spell complete')
	nnoremap <leader>osn :setlocal complete-=kspell<CR>
	call Desc('o.s.n', 'spell no complete')
	nnoremap <leader>ose :setlocal spelllang=en_us<CR>
	call Desc('o.s.e', 'lang en_us')
	nnoremap <leader>osp :setlocal spelllang=pl<CR>
	call Desc('o.s.p', 'lang pl')

	nnoremap <leader>ol :setlocal list!<CR>
	call Desc('o.l', 'list')
	nnoremap <leader>on :set relativenumber! number!<CR>
	call Desc('o.n', 'line numbers')

	nnoremap <leader>ow :setlocal wrap!<CR>
	call Desc('o.w', 'wrap')

	nnoremap <leader>tr :%s/\s\+$//e<CR>
	call Desc('t.r', 'remove trailing spaces')

	" Move line
	nnoremap j :m .+1<cr>==
	nnoremap <a-j> :m .+1<cr>==
	nnoremap k :m .-2<cr>==
	nnoremap <a-k> :m .-2<cr>==
	" Move selection
	vnoremap j :m '>+1<cr>gv=gv
	vnoremap k :m '<-2<cr>gv=gv

	" https://vi.stackexchange.com/questions/2299/how-to-translate-unicode-escape-sequences-to-the-unicode-character
	nnoremap <leader>tu :%s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g<cr>
	call Desc('t.u', 'unicode chars from \uXXXX')

	" nnoremap gi :!sxiv <cfile> &<CR>
	command! OpenImg execute 'silent !sxiv '.expand('%:p:h').'/'.expand('<cfile>').' &'
	nnoremap gi :OpenImg<CR>

" Commands
	command! -nargs=1 Silent execute 'silent !' . <q-args> | execute 'redraw!'

" Auto commands
	autocmd vimrc BufWritePost vimrc source $MYVIMRC
	autocmd vimrc BufWritePost .Xresources silent !xrdb -merge ~/.dotfiles/xorg/.Xresources

" Load project specific configuration
	if filereadable('.project.vim')
		source .project.vim
	endif


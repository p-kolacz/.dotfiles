" https://neovim.io/doc/user/vim_diff.html#vim-differences

if !has('nvim')
	syntax on
	filetype plugin indent on
	set encoding=utf-8
	set belloff=all
	set autoread
	set backspace=indent,eol,start
	set incsearch
	set viminfo+='1000,n$XDG_DATA_HOME/viminfo
	set wildmenu
	Plug 'wincent/terminus'
endif

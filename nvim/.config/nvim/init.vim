call plug#begin(stdpath('data') . '/plugged')

" ------------------------------ Global settings ----------------------------- "
runtime layers/commands.vim
runtime layers/options.vim
runtime layers/$TERM.vim

" -------------------------------- Key mappings ------------------------------ "
runtime layers/which-key.vim
runtime layers/mappings.vim
runtime layers/plug.vim

" --------------------------------- Appearance  ------------------------------ "
runtime layers/appearance.vim
runtime layers/themes/nightfly.vim
runtime layers/airline.vim
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'

" --------------------------------- Navigation ------------------------------- "
set mouse=a
runtime layers/fzf.vim
runtime layers/netrw.vim
runtime layers/open-browser.vim
runtime layers/vifm.vim

" ---------------------------------- General --------------------------------- "
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'michaeljsmith/vim-indent-object'
runtime layers/coc.vim
runtime layers/commentary.vim
runtime layers/filesystem.vim	
runtime layers/ultisnips.vim

" --------------------------------- Languages -------------------------------- "
runtime layers/csv.vim
runtime layers/fish.vim
runtime layers/gdscript.vim
" ftplugin/json.vim
runtime layers/markdown.vim
runtime layers/python.vim
runtime layers/sxhkd.vim
runtime layers/webdev.vim
" ftplugin/vim.vim

" ----------------------------------- Tools ---------------------------------- "
runtime layers/fugitive.vim
runtime layers/figlet.vim
runtime layers/rest.vim
runtime layers/help.vim
runtime layers/vimwiki.vim
runtime layers/unicode.vim

" ---------------------------------------------------------------------------- "
call plug#end()
call which_key#register('<Space>', "g:which_key_map")
execute 'colorscheme '.g:colorscheme

" Load project specific configuration
if filereadable('.project.vim')
	source .project.vim
endif


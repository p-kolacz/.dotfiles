    " _    _      _ _
   " / \  (_)_ __| (_)_ __   ___
  " / _ \ | | '__| | | '_ \ / _ \
 " / ___ \| | |  | | | | | |  __/
" /_/   \_\_|_|  |_|_|_| |_|\___|
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline/wiki/Screenshots

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_section_z = '%l/%L:%2v'

" Glyphs https://github.com/ryanoasis/powerline-extra-symbols
"                 
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
let g:airline_left_sep = '  '
let g:airline_right_sep = ' '
	 
" Options
let g:airline#extensions#whitespace#enabled = 0
	" let g:airline_statusline_ontop=1

" Smarter tab line
	" Automatically displays all buffers when there's only one tab open.
	" let g:airline#extensions#tabline#enabled = 1

	" Separators can be configured independently for the tabline, so here is how you can define "straight" tabs:
	" let g:airline#extensions#tabline#left_sep = ' '
	" let g:airline#extensions#tabline#left_alt_sep = '|'

	" In addition, you can also choose which path formatter airline uses. This affects how file paths are displayed in each individual tab as well as the current buffer indicator in the upper right.
	" let g:airline#extensions#tabline#formatter = 'default'

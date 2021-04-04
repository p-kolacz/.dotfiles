Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git'"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Ctrl-space
if has('nvim')
	nnoremap <C-space> :Files<cr>
else
	nnoremap <C-@> :Files<cr>
endif

nnoremap <leader>fh :History<CR>
call Desc('fh', 'history')
nnoremap <leader>fl :BLines<CR>
call Desc('fl', 'lines')
nnoremap <leader>ff :Rg<cr>
call Desc('ff', 'find in files')
nnoremap <leader>fc :Rgc<cr>
call Desc('fc', 'find in files cword')
nnoremap <leader>fs :Snippets<CR>
call Desc('fs', 'snippets')

nnoremap <leader>hh :Helptags<CR>
call Desc('hh', 'helptags')

nnoremap <leader>gc :Commits<CR>
call Desc('gg', 'commits')

nnoremap <leader>vc :Commands<CR>
call Desc('vc', 'commands')
nnoremap <leader>vf :Filetypes<CR>
call Desc('vf', 'filetypes')
nnoremap <leader>vh :History:<CR>
call Desc('vh', 'commands history')
nnoremap <leader>vs :History/<CR>
call Desc('vs', 'search history')
nnoremap <leader>vm :Maps<CR>
call Desc('vm', 'nmaps')

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rgc
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(expand('<cword>')), 1,
  \   fzf#vim#with_preview(), <bang>0)


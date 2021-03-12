 " __  __            _       _
" |  \/  | __ _ _ __| | ____| | _____      ___ __
" | |\/| |/ _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \
" | |  | | (_| | |  |   < (_| | (_) \ V  V /| | | |
" |_|  |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|
" https://github.com/tpope/vim-markdown
" https://github.com/plasticboy/vim-markdown
" https://github.com/dkarter/bullets.vim

" Plug 'dkarter/bullets.vim'

" let g:markdown_fenced_languages =  ['bash', 'gdscript', 'html', 'css', 'php', 'sh', 'vim']
let g:markdown_fenced_languages =  ['gdscript', 'html', 'css', 'php', 'sh', 'vim']

" let g:polyglot_disabled = ['markdown']
" Plug 'plasticboy/vim-markdown'
" Plug 'gabrielelana/vim-markdown'

" autocmd vimrc Filetype markdown nnoremap <buffer> <leader>hh yyp<c-v>$r=
autocmd vimrc Filetype markdown nnoremap <buffer> <localleader>hh o<esc>80i=<esc>o<esc>
autocmd vimrc Filetype markdown nnoremap <buffer> <localleader>h2 yyp<c-v>$r-

" Run code in fences
" https://github.com/dbridges/vim-markdown-runner

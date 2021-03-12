Plug 'lifepillar/vim-mucomplete'

" Mandatory
set completeopt+=menuone
set completeopt-=preview

" Auto completion
set completeopt+=noinsert	" noselect or noinsert
" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#completion_delay = 1

" Optional
" set shortmess+=c   " Shut off completion messages
" set belloff+=ctrlg " If Vim beeps during completion

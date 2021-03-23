let mapleader=' '
let maplocalleader=','

" --------------------------------- Navigation ------------------------------- "
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
nnoremap H ^
nnoremap L $
nnoremap Y y$
nnoremap <CR> o<Esc>

" ---------------------------------- Editing --------------------------------- "
" Clipboard
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P

" Move line
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==
" Move selection
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

" Snake case
nnoremap <leader>dw df_
call Desc('d.w', 'delete till _')
nnoremap <leader>cw ct_
call Desc('c.w', 'change till _')

" ---------------------------------- Buffers --------------------------------- "
nnoremap <leader>q :q<CR>
call DescIgnore('q')
nnoremap <leader>Q :wq<CR>
call Desc('Q', 'write&quit')

call Desc('f', '+File')
nnoremap <leader>fe :e<space>
call Desc('f.e', 'edit')

call Desc('e', '+Edit')
nnoremap <leader>es :%s/
call Desc('e.r', 'substitute')

nnoremap <F12> :e $MYVIMRC<CR>

" ---------------------------------- Windows --------------------------------- "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <a-h> <C-w><
nnoremap <a-j> <C-w>+
nnoremap <a-k> <C-w>-
nnoremap <a-l> <C-w>>

nnoremap <leader><leader> :
nnoremap <leader>w :w<CR>
call DescIgnore('w')

" ---------------------------------- Options --------------------------------- "
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

" ----------------------------------- Tools ---------------------------------- "
nnoremap <leader>tr :%s/\s\+$//e<CR>
call Desc('t.r', 'remove trailing spaces')

nnoremap gi :OpenImg<CR>


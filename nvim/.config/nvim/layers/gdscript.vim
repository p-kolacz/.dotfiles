" Plug 'clktmr/vim-gdscript3'

" https://github.com/habamax/vim-godot
Plug 'habamax/vim-godot'

" autocmd vimrc FileType gdscript3 nnoremap <buffer> <F5> :!echo "--------------------------------------------------------------------------------";godot<CR>
autocmd vimrc FileType gdscript nnoremap <buffer> <F5> :GodotRun<CR>
autocmd vimrc FileType gdscript nnoremap <buffer> <F6> :GodotRunCurrent<CR>

" autocmd vimrc FileType gdscript nnoremap <buffer> <C-p> :GFiles *.gd<CR>
autocmd vimrc FileType gdscript nnoremap <buffer> <leader>ff :RgGD<CR>

autocmd vimrc FileType gdscript nnoremap <buffer> <localleader>t :!ctags -R .<cr>

command! -bang -nargs=* RgGD
	\ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -g '*.gd' ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)


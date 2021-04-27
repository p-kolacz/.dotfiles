" ~/.config/nvim/after/ftplugin/gdscript.vim
" Old plugin Plug 'clktmr/vim-gdscript3'
" https://github.com/habamax/vim-godot

lua Plug.add 'habamax/vim-godot'
" let g:godot_ext_hl=v:true

" autocmd vimrc FileType gdscript3 nnoremap <buffer> <F5> :!echo "--------------------------------------------------------------------------------";godot<CR>
" autocmd vimrc FileType gdscript nnoremap <buffer> <C-p> :GFiles *.gd<CR>
" autocmd vimrc FileType gdscript nnoremap <buffer> <leader>ff :RgGD<CR>
" autocmd vimrc FileType gdscript nnoremap <buffer> <localleader>t :!ctags -R .<cr>
" command! -bang -nargs=* RgGD
" 	\ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -g '*.gd' ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)


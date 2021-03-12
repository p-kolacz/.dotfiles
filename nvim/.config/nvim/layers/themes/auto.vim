" ~/.vim/layers/themes/gruvbox.vim
" ~/.vim/layers/themes/nord.vim

if filereadable($HOME.'/.vim/layers/themes/'.$THEME.'.vim')
	source ~/.vim/layers/themes/$THEME.vim
else
	source ~/.vim/layers/themes/gruvbox.vim
endif


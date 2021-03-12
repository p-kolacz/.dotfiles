Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
	\ 'dir':	'\v[\/](node_modules)',
	\ 'file':	'\v\.(png|import|tres|tscn)$',
\ }

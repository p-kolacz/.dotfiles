" __     ___        __        ___ _    _
" \ \   / (_)_ __ __\ \      / (_) | _(_)
"  \ \ / /| | '_ ` _ \ \ /\ / /| | |/ / |
"   \ V / | | | | | | \ V  V / | |   <| |
"    \_/  |_|_| |_| |_|\_/\_/  |_|_|\_\_|
"
" https://github.com/vimwiki/vimwiki

Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{'path': '~/Cloud/Exocortex/Notes/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0
" let g:vimwiki_markdown_link_ext = 1
" let g:vimwiki_url_maxsave = 0
let g:vimwiki_map_prefix = '<leader>i'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_auto_header = 1


" nmap <leader>vw <Plug>VimwikiIndex
" autocmd vimrc FileType vimwiki set autochdir
autocmd vimrc FileType vimwiki silent! iunmap <buffer> <Tab>
" autocmd vimrc FileType vimwiki unmap <buffer> <C-space>
" autocmd vimrc FileType vimwiki unmap <buffer> <C-@>

autocmd vimrc FileType vimwiki nmap <buffer> <localleader>c :VimwikiCheckLinks<cr>
autocmd vimrc FileType vimwiki nmap <buffer> <localleader>f :Files<cr>
autocmd vimrc FileType vimwiki nmap <buffer> <localleader>g :Rg<cr>


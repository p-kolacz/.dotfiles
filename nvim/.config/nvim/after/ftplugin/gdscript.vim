setlocal formatoptions-=t

lua Help.map_manual 'https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html'
lua Help.map_api 'https://docs.godotengine.org/en/stable/classes/index.html'

nnoremap <buffer> <C-space>	:Telescope find_files find_command=rg,--hidden,--no-ignore,-i,--files,--glob,*gd,--glob,*shader,--glob,*json,--glob,*csv<cr>
nnoremap <buffer> <F5> :wa<cr>:GodotRun<CR>
nnoremap <buffer> <F6> :wa<cr>:GodotRunCurrent<CR>

" CoC setup
set pumheight=10
nmap <buffer> <silent> [g <Plug>(coc-diagnostic-prev)
nmap <buffer> <silent> ]g <Plug>(coc-diagnostic-next)
nmap <buffer> <silent> gd <Plug>(coc-definition)
nmap <buffer> <silent> gy <Plug>(coc-type-definition)
nmap <buffer> <silent> gi <Plug>(coc-implementation)
nmap <buffer> <silent> gr <Plug>(coc-references)
nmap <buffer> <leader>cr <Plug>(coc-rename)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <buffer><silent><expr> <cr> pumvisible() ? "\<c-n>" : "\<cr>"

" inoremap <expr> <CR> complete_info().selected != -1 ?
"             \ &filetype == "gdscript" ? (coc#expandable() ?  "\<C-y>" : "\<C-y><Esc>a") : "\<C-y>"
"             \ : "\<C-g>u\<CR>"

" Use K to show documentation in preview window.
nnoremap <buffer> <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


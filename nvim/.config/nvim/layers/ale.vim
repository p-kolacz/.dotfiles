Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '☢'
let g:ale_sign_warning = '⚠'
" let g:ale_gdscript3_godotheadless_executable='godot-headless' 
" let g:ale_completion_enabled = 1

call Desc('e', '+Errors')
nmap <leader>ep <Plug>(ale_previous_wrap)
call Desc('e.p', 'previous error')
nmap <leader>en <Plug>(ale_next_wrap)
call Desc('e.n', 'next error')

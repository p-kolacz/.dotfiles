nnoremap <leader>tff :.!figlet \| sed 's/ *$//g'<CR>
nnoremap <leader>tfr :.!figlet -f rectangles \| sed 's/ *$//g'<CR>
nnoremap <leader>tfs :.!figlet -f small \| sed 's/ *$//g'<CR>
nnoremap <leader>tfc :.!figlet -f cybermedium \| sed 's/ *$//g'<CR>
nnoremap <leader>tf2 :.!figlet -f twopoint \| sed 's/ *$//g'<CR>
nnoremap <leader>tf3 :.!figlet -f threepoint \| sed 's/ *$//g'<CR>

call Desc('t.f', '+Figlet')
call Desc('t.f.f', 'Default')
call Desc('t.f.r', 'Rectangles')
call Desc('t.f.s', 'Small')
call Desc('t.f.c', 'Cybermedium')
call Desc('t.f.2', '2-point')
call Desc('t.f.3', '3-point')

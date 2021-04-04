nnoremap <leader>tff :.!figlet \| sed 's/ *$//g'<CR>
nnoremap <leader>tfr :.!figlet -f rectangles \| sed 's/ *$//g'<CR>
nnoremap <leader>tfs :.!figlet -f small \| sed 's/ *$//g'<CR>
nnoremap <leader>tfc :.!figlet -f cybermedium \| sed 's/ *$//g'<CR>
nnoremap <leader>tf2 :.!figlet -f twopoint \| sed 's/ *$//g'<CR>
nnoremap <leader>tf3 :.!figlet -f threepoint \| sed 's/ *$//g'<CR>

call Desc('tf', '+Figlet')
call Desc('tff', 'Default')
call Desc('tfr', 'Rectangles')
call Desc('tfs', 'Small')
call Desc('tfc', 'Cybermedium')
call Desc('tf2', '2-point')
call Desc('tf3', '3-point')

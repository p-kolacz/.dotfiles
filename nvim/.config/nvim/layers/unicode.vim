" https://vi.stackexchange.com/questions/2299/how-to-translate-unicode-escape-sequences-to-the-unicode-character
nnoremap <leader>tu :%s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g<cr>
call Desc('t.u', 'unicode chars from \uXXXX')


require'lib/cheatash'.setup()

mapgroup("<leader>hC","Cheat.sh")
nnoremap('<leader>hCc', ':CheatshCword<cr>', 'cheat.sh cword')
nnoremap('<leader>hCq', ':Cheatsh ', 'cheat.sh query')

require'lib/caniuse'.setup()
mapgroup("<leader>hu","Can I Use")

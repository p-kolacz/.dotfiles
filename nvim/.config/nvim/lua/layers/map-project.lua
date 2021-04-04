vim.cmd('command! -nargs=1 ProjGrep :vimgrep /<args>/gj ** | copen')

Map.n('<leader>pg', ':ProjGrep<space>')
Map.n('<leader>ps', ':cfdo %s//gc<left><left><left>')

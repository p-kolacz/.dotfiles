-- https://vi.stackexchange.com/questions/2776/vim-search-replace-all-files-in-current-project-folder
vim.cmd('command! -nargs=1 ProjGrep :vimgrep /<args>/gj ** | copen')
vim.cmd('command! -nargs=1 ProjSubstitute :cfdo %s/<args>/gc | update')

Map.desc('p', '+Project')
Map.n('<leader>pg', ':ProjGrep<space>', 'grep')
Map.n('<leader>ps', ':ProjSubstitute<space>', 'substitute')


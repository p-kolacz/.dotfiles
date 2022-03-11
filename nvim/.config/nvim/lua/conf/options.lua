vim.cmd[[
	augroup vimrc
		autocmd!
		autocmd FocusLost * :wa
		autocmd BufRead */.config/nvim/init.lua setlocal includeexpr=stdpath('config').'/lua/'.v:fname
	augroup END
]]

vim.cmd("language messages en_US.utf8")

set.shell          = "bash"
set.fileformats    = "unix"
set.autowrite      = true
set.mouse          = "a"
set.tabstop        = 4
set.shiftwidth     = 4
set.ignorecase     = true
set.smartcase      = true
set.hlsearch       = false
set.foldlevelstart = 99


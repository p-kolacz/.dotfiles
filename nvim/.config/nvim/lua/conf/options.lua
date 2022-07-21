augroup("vimrc", { clear = true })
autocmd("FocusLost", { group = "vimrc", pattern = "*", command = "wall" })
autocmd("BufRead", {
	group = "vimrc",
	pattern = {"*/.config/nvim/init.lua", "*/.config/nvim/lua/conf/appearance.lua"},
	command = "setlocal includeexpr=stdpath('config').'/lua/'.v:fname"
})

vim.cmd("language messages en_US.utf8")

-- set.shell          = "bash"
set.fileformats    = "unix"
set.autowrite      = true
set.mouse          = "a"
set.tabstop        = 4
set.shiftwidth     = 4
set.ignorecase     = true
set.smartcase      = true
set.hlsearch       = false
set.foldlevelstart = 99


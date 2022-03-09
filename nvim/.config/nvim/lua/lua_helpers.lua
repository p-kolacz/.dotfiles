let = vim.g
set = vim.opt
setlocal = vim.opt_local

function colorscheme(name)
	vim.cmd("colorscheme "..name)
end

function v(x) print(vim.inspect(x)) end

let = vim.g
set = vim.opt
setlocal = vim.opt_local
augroup = vim.api.nvim_create_augroup
autocmd = vim.api.nvim_create_autocmd

function colorscheme(name)
	vim.cmd("colorscheme "..name)
end

-- function highlight(values)
-- 	vim.cmd("highlight "..values)
-- end

function v(x)
	print(vim.inspect(x))
end

function Require(t)
	for _,v in pairs(t) do
		require(v)
	end
end


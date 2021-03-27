local M = {}

function M.plug_begin()
	vim.fn["plug#begin"](vim.fn.stdpath("data").."/plugged")
end

function M.plug(name)
	vim.cmd(string.format("Plug '%s'", name))
end

function M.plug_end()
	vim.fn["plug#end"]()
end

return M


local M = {}

local function _process(file)
	local ext = file:match("%..*$")
	if ext == ".vim" then
		vim.cmd("runtime "..file)
	else
		require(file)
	end
end

function M.source(files)
	for _, v in pairs(files) do
		_process(v)
	end
end

return M


local M = {}

local layers

local function _process(file)
	local ext = file:match("%..*$")
	if ext == ".vim" then
		vim.cmd("runtime "..file)
	else
		require("layers/"..file)
	end
end

function M.define(_layers)
	layers = _layers
end

function M.source(indx)
	for _, v in pairs(layers) do
		if type(v) == "table" then
			if v[indx] then
				_process(v[indx])
			end
		elseif indx == 1 then
			_process(v)
		end
	end
end

-- function M.init()
-- 	vim.bo.suffixesadd = ".lua"
-- 	vim.bo.includeexpr = "stdpath('config').'/lua/layers/'.v:fname"
-- end

return M


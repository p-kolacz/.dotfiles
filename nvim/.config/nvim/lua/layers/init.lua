local M = {}

-- local layers

local function _process(file)
	local ext = file:match("%..*$")
	if ext == ".vim" then
		vim.cmd("runtime "..file)
	else
		require("layers/"..file)
	end
end

-- function M.define(_layers)
-- 	layers = _layers
-- end

-- function M.source(indx)
-- 	for k, v in pairs(layers) do
-- 		if type(v) == "table" then
-- 			if indx == 1 and k == "plug" then
-- 				require'vimplug'.plug(v.plug)
-- 			elseif v[indx] then
-- 				_process(v[indx])
-- 			end
-- 		elseif indx == 1 then
-- 			_process(v)
-- 		end
-- 	end
-- end

function M.source(layers)
	for _, v in pairs(layers) do
		_process(v)
	end
end

return M


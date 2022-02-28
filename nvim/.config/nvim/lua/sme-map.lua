-- package.loaded['sme-map'] = nil
local M = {}

M.which_key_map = {}

-- function M.desc(key, val)
-- 	local path = key:gmatch('<leader>(.+)')()
-- 	-- local ref = M.which_key_map
-- 	local ref = vim.g.which_key_map
-- 	for i=1, #path do
-- 		local k = path:sub(i,i)
-- 		if i == #path then
-- 			if val:sub(1,1) == '+' then
-- 				if ref[k] then
-- 					ref[k].name = val
-- 				else
-- 					ref[k] = { name = val }
-- 				end
-- 			else
-- 				ref[k] = val
-- 			end
-- 		else
-- 			if not ref[k] then
-- 				ref[k] = {}
-- 			end
-- 			ref = ref[k]
-- 		end
-- 	end
-- end

function M.desc(key, val)
	local k = key:gmatch('<leader>(.+)')()
	k = k or key
	vim.fn.Desc(k, val)
end

function M.which_register()
	vim.g.which_key_map = Map.which_key_map
	vim.fn['which_key#register']('<Space>', 'g:which_key_map')
end

local function map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	-- opts.noremap = opts.noremap or true
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
	if desc then
		M.desc(lhs, desc)
	end
end

local function map_buf(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	-- opts.noremap = opts.noremap or true
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
	if desc then
		M.desc(lhs, desc)
	end
end

function nnoremap(lhs, rhs, desc, opts) map("n", lhs, rhs, desc, { noremap = true }) end
function nnoremap_buffer(lhs, rhs, desc, opts) map_buf("n", lhs, rhs, desc, { noremap = true }) end

function M.n(lhs, rhs, desc, opts) map("n", lhs, rhs, desc, opts) end
function M.i(lhs, rhs, desc, opts) map("i", lhs, rhs, desc, opts) end
function M.v(lhs, rhs, desc, opts) map("v", lhs, rhs, desc, opts) end
function M.x(lhs, rhs, desc, opts) map("x", lhs, rhs, desc, opts) end

function M.nb(lhs, rhs, desc, opts) map_buf("n", lhs, rhs, desc, opts) end
function M.ib(lhs, rhs, desc, opts) map_buf("i", lhs, rhs, desc, opts) end
function M.vb(lhs, rhs, desc, opts) map_buf("v", lhs, rhs, desc, opts) end
function M.xb(lhs, rhs, desc, opts) map_buf("x", lhs, rhs, desc, opts) end

return M


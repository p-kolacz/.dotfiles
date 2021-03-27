local M = {}

local function map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.noremap = opts.noremap or true
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local function map_buf(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.noremap = opts.noremap or true
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end

function M.n(lhs, rhs, desc, opts) map("n", lhs, rhs, desc, opts) end
function M.i(lhs, rhs, desc, opts) map("i", lhs, rhs, desc, opts) end
function M.v(lhs, rhs, desc, opts) map("v", lhs, rhs, desc, opts) end
function M.x(lhs, rhs, desc, opts) map("x", lhs, rhs, desc, opts) end

function M.nb(lhs, rhs, desc, opts) map_buf("n", lhs, rhs, desc, opts) end
function M.ib(lhs, rhs, desc, opts) map_buf("i", lhs, rhs, desc, opts) end
function M.vb(lhs, rhs, desc, opts) map_buf("v", lhs, rhs, desc, opts) end
function M.xb(lhs, rhs, desc, opts) map_buf("x", lhs, rhs, desc, opts) end

return M


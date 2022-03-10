package.loaded["sme-statusline"] = nil
local M = {}

local p = require'sme-statusline/providers'
local Fticons = require'sme-fticons'

local Labels = {
	mode = {
		n="NOR", i="INS", v="VIS", V="VIL", ['']="VIB", R="RPL", c="CMD"
	}
}

local Colors = {
	reset = "NormalText",
	mode = {
		n = "DiffText",
		i = "DiffAdd",
		v = "Search",
		V = "Search",
		[''] = "Search",
		R = "IncSearch",
		c = "TermCursor",
		_ = "ErrorMsg",
	}
}

local Icons = {
	readonly = " ",
	modified = "* ",
	separator = "|",
	server = "",
	scrollbar = {'█   ', ' █  ', '  █ ', '   █' },
}

local RESET_COLOR = string.format("%%#%s#", Colors.reset)

local function active(bufnr)
	local mode = vim.fn.mode()
	local col= p.color(mode, Colors.mode)
	local sl = {
		col,
		p.mode_label(mode, Labels.mode),
		RESET_COLOR,
		"%=",			-- separator
		p.readonly(bufnr, Icons.readonly),
		p.modified(bufnr, Icons.modified),
		"%f ",			-- filename
		p.filetype(bufnr, Fticons, Icons.separator),
		p.spell(bufnr, Icons.separator),
		-- p.lsp(bufnr, Icons.separator),
		p.lsp_icon(bufnr, Icons.server, Icons.separator),
		p.lsp_diagnostic(bufnr),
		"%=",			-- separator
		col,
		" %4l/%L",	-- line/Lines
		":%2c",		-- line/Lines
		" ",
		"%#LineNr#",
		-- RESET_COLOR,
		p.scrollbar(Icons.scrollbar),
		col,
		" ",
	}
	return table.concat(sl)
end

local function inactive(bufnr)
	local sl = {
		"%=",			-- separator
		p.readonly(bufnr, Icons.readonly),
		p.modified(bufnr, Icons.modified),
		"%f ",			-- filename
		-- Icons.separator,
		p.filetype(bufnr, Fticons, Icons.separator),
		-- p.debug(bufnr),
		"%=",			-- separator
		-- " ",
	}
	return table.concat(sl)
end

local function nvim_tree()
	return "%=NvimTree%="
end

function M.statusline()
	local bufnr = vim.fn.winbufnr(vim.g.statusline_winid)
	if vim.fn.bufname(bufnr) == "NvimTree_1" then
		return nvim_tree()
	elseif vim.g.statusline_winid == vim.fn.win_getid() then
		return active(bufnr)
	else
		return inactive(bufnr)
	end
end

function M.setup()
	vim.o.statusline = [[%!luaeval('require"sme-statusline".statusline()')]]
end

return M


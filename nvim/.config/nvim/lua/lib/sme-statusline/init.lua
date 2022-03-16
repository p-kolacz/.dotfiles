package.loaded["lib/sme-statusline"] = nil
package.loaded['lib/sme-statusline/providers'] = nil

local M = {}
local providers = require'lib/sme-statusline/providers'
local templates

local Colors = {
	reset = "NormalText",
	mode = {
		n = { "DiagnosticVirtualTextHint2", "DiagnosticVirtualTextHint" },
		i = { "DiagnosticWarn", "DiagnosticVirtualTextWarn" },
		v = "Visual",
		V = "Visual",
		[''] = "Visual",
		R = "IncSearch",
		c = "TermCursor",
		_ = "ErrorMsg",
	}
}

local Icons = {
	mode = { n="NOR", i="INS", v="VIS", V="VIL", ['']="VIB", R="RPL", c="CMD" },
	readonly = " ",
	modified = " ",
	separator = "|",
	lsp = "",
	scrollbar = {'█   ', ' █  ', '  █ ', '   █' },
	filetype = require'lib/ft2devicons',
}

local RESET_COLOR = string.format("%%#%s#", Colors.reset)

local function invert_hl(group, new_group)
	local id = vim.fn.synIDtrans(vim.fn.hlID(group))
	local new_fg = vim.fn.synIDattr(id, "bg", "gui")
	print(new_fg)
	local new_bg = vim.fn.synIDattr(id, "fg", "gui")
	vim.cmd(string.format("highlight %s guifg=%s guibg=%s", new_group, new_fg, new_bg))
	-- vim.cmd(string.format("highlight %s guifg=%s", new_group, new_fg))
end

-- invert_hl("DiagnosticVirtualTextHint", "DiagnosticVirtualTextHint2")

local function active(bufnr)
	-- local col= p.color(mode, Colors.mode)
	-- local sl = {
	-- 	col,
	-- 	p.mode_label(mode, Labels.mode),
	-- 	RESET_COLOR,
	-- 	"%=",			-- separator
	-- 	p.readonly(bufnr, Icons.readonly),
	-- 	p.modified(bufnr, Icons.modified),
	-- 	-- "%t ",			-- filename
	-- 	p.filename(),
	-- 	p.filetype(bufnr, Fticons, Icons.separator),
	-- 	p.spell(bufnr, Icons.separator),
	-- 	-- p.lsp(bufnr, Icons.separator),
	-- 	p.lsp_icon(bufnr, Icons.server, Icons.separator),
	-- 	p.lsp_diagnostic(bufnr),
	-- 	"%=",			-- separator
	-- 	col,
	-- 	" %4l/%L",	-- line/Lines
	-- 	":%2c",		-- line/Lines
	-- 	" ",
	-- 	"%#LineNr#",
	-- 	-- RESET_COLOR,
	-- 	p.scrollbar(Icons.scrollbar),
	-- 	col,
	-- 	" ",
	-- }
end

local function compose(bufnr, template)
	local t = {}
	for _, m in pairs(template) do
		-- print(m)
		table.insert(t, providers[m](bufnr, Icons[m], Colors))
	end
	return table.concat(t)
end

local function nvim_tree()
	return "%=NvimTree%="
end

 function M.statusline()
	local bufnr = vim.fn.winbufnr(vim.g.statusline_winid)
	-- v(vim.g.statusline_winid)
	if vim.fn.bufname(bufnr) == "NvimTree_1" then
		return nvim_tree()
	elseif vim.g.statusline_winid == vim.fn.win_getid() then
		return compose(bufnr, templates[1])
	else
		return compose(bufnr, templates[2])
	end
end

function M.setup(tmpls)
	templates = tmpls
	vim.o.statusline = [[%!luaeval('require"lib/sme-statusline".statusline()')]]
	-- vim.o.statusline = [[%{%luaeval('require"lib/sme-statusline".statusline()')%}]]
	-- vim.go.statusline = "%{%v:lua.require'lib/sme-statusline'.statusline()%}"
end

-- M.setup { {
-- 		"mode", "separator",
-- 		"modified", "short_path", "filetype", "lsp_icon",
-- 		"separator", "column", "scrollbar",
-- 	}, {
-- 		"separator", "readonly", "modified", "short_path", "filetype", "separator"
-- 	}
-- }

return M


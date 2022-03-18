package.loaded["lib/sme-statusline"] = nil
package.loaded['lib/sme-statusline/providers'] = nil

local M = {}
local providers = require'lib/sme-statusline/providers'
local templates

local Colors = {
	mode = {
		n = "DiagnosticVirtualTextHint",
		i = "DiagnosticVirtualTextWarn",
		v = "Visual",
		V = "Visual",
		[''] = "Visual",
		R = "IncSearch",
		c = "TermCursor",
		_ = "ErrorMsg",
	},
	modified = "DiagnosticError",
	diagnostics = {
		[vim.diagnostic.severity.ERROR] = "DiagnosticError",
		[vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
		[vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
		[vim.diagnostic.severity.HINT]  = "DiagnosticHint",
	}
}

local Icons = {
	separator = " ",
	mode = { n="NOR", i="INS", v="VIS", V="VIL", ['']="VIB", R="RPL", c="CMD" },
	readonly = "",
	modified = " ",
	lsp = "",
	filetype = require'lib/ft2devicons',
	diagnostics = {
		[vim.diagnostic.severity.ERROR] = "",
		[vim.diagnostic.severity.WARN]  = "",
		[vim.diagnostic.severity.INFO]  = "",
		[vim.diagnostic.severity.HINT]  = "",
	},
	line = "",
	line_count = "",
	column = "",
	scrollbar = {'█   ', ' █  ', '  █ ', '   █' },
}

local Extract = {
	Green  = "DiagnosticHint",
	Blue   = "DiagnosticInfo",
	Yellow = "DiagnosticWarn",
	Red    = "DiagnosticError",
}

local function get_color(group, typ)
	local id = vim.fn.synIDtrans(vim.fn.hlID(group))
	return  vim.fn.synIDattr(id, typ, "gui")
end

local function create_highlights()
	vim.cmd("highlight SlickLineNone guifg=NONE guibg=NONE")
	for k,v in pairs(Extract) do
		local color = get_color(v, "fg")
		vim.cmd("highlight SlickLine"..k.."FG guifg="..color)
		vim.cmd("highlight SlickLine"..k.."BG guibg="..color)
	end
end

local function compose(bufnr, template)
	local t = {}
	for _, m in pairs(template) do
		local part = providers[m](bufnr, Icons[m], Colors[m])
		if part then
			table.insert(t, part)
		end
	end
	return table.concat(t, Icons.separator)
end

local function nvim_tree()
	return "%=NvimTree%="
end

function M.statusline()
	local bufnr = vim.fn.winbufnr(vim.g.statusline_winid)
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
	create_highlights()
	vim.o.statusline = [[%!luaeval('require"lib/sme-statusline".statusline()')]]
	-- vim.o.statusline = [[%{%luaeval('require"lib/sme-statusline".statusline()')%}]]
	-- vim.go.statusline = "%{%v:lua.require'lib/sme-statusline'.statusline()%}"
end

-- M.setup {
-- 	{
-- 		"mode", "filetype",  "spell", "readonly", "modified",  "separator",
-- 		"short_path", "lsp_icon",
-- 		"separator", "diagnostics", "column", "line_count", "percent",
-- 	},
-- 	{ "separator", "readonly", "modified", "filename",  "separator" }
-- }

return M


package.loaded["layers/statusline"] = nil
local M = {}

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
	modified = " ",
	separator = "",
	scrollbar = {'█   ', ' █  ', '  █ ', '   █' },
}

local RESET_COLOR = string.format("%%#%s#", Colors.reset)

local ok,devicons = pcall(require,'nvim-web-devicons')
if not ok then
	devicons = nil
end

local function color(mode)
	local c = Colors.mode[mode] or Colors.mode._
	return string.format("%%#%s#", c)
end

local function mode_label(mode)
	local label = Labels.mode[mode] or mode
	return string.format("  %s  ", label)
end

local function readonly(bufnr)
	return vim.fn.getbufvar(bufnr, '&readonly') == 0 and "" or Icons.readonly
end

local function modified(bufnr)
	return vim.fn.getbufvar(bufnr, '&modified') == 0 and "" or Icons.modified
end

local function filetype(bufnr)
	local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
	local icon = ''
	if devicons then
		local filename = vim.fn.expand("#"..bufnr..":t")
		local ext = vim.fn.expand("#"..bufnr..":e")
		local glyph,_ = devicons.get_icon(filename, ext)
		if glyph then
			-- ft = ft..string.format("%%#%s#%saaaaa%s", hi, icon, RESET_COLOR)
			icon = string.format(" %s ", glyph)
		end
	end
	return icon .. ft
end

local function lsp(bufnr)
	local buf_ft = vim.fn.getbufvar(bufnr,'&filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return ""
	end

	for _,client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
			return Icons.separator .. " " .. client.name
		end
	end
	return ""
end

local function spell(bufnr)
	local s = vim.fn.getbufvar(bufnr, "&spell")
	local lang = string.upper(vim.fn.getbufvar(bufnr, "&spelllang"))
	return s == 0 and "" or string.format(" %s %s", Icons.separator, lang)
end

-- extension for scoll bar
local function scrollbar()
	local current_line = vim.fn.line('.')
	local total_lines = vim.fn.line('$')
	-- local default_chars = {' ', '▏', '▎', '▍', '▌', '▋', '▊', '▉', '█'}
	local index = 1

	index = ((current_line - 1) / (total_lines - 1)) * (#Icons.scrollbar - 1) + 1
	index = math.floor(index + 0.5)
	-- if  current_line == 1 then
	-- 	index = 1
	-- elseif current_line == total_lines then
	-- 	index = #chars
	-- else
	-- 	local line_no_fraction = vim.fn.floor(current_line) / vim.fn.floor(total_lines)
	-- 	index = vim.fn.float2nr(line_no_fraction * #chars)
	-- 	if index == 0 then
	-- 		index = 1
	-- 	end
	-- end
	-- return index
	return Icons.scrollbar[index]
end

local function debug(bufnr)
	-- return vim.g.actual_curbuf or "x"
	-- return vim.g.actual_curbuf or "x"
	-- return vim.g.actual_curwin or ""
	-- return " " ..vim.g.statusline_winid .. "/"..vim.fn.win_getid() 
	-- return vim.bo.filetype or "none"
	return ""
end

local function active(bufnr)
	local mode = vim.fn.mode()
	local col= color(mode)
	local sl = {
		col,
		mode_label(mode),
		RESET_COLOR,
		"%=",			-- separator
		readonly(bufnr),
		modified(bufnr),
		"%f ",			-- filename
		Icons.separator,
		filetype(bufnr),
		debug(bufnr),
		spell(bufnr),
		" ",
		lsp(bufnr),
		"%=",			-- separator
		col,
		" %4l/%L",	-- line/Lines
		":%2c",		-- line/Lines
		" ",
		"%#LineNr#",
		-- RESET_COLOR,
		scrollbar(),
		col,
		" ",
	}
	return table.concat(sl)
end

local function inactive(bufnr)
	local sl = {
		"%=",			-- separator
		readonly(bufnr),
		modified(bufnr),
		"%f ",			-- filename
		Icons.separator,
		filetype(bufnr),
		debug(bufnr),
		"%=",			-- separator
		-- " ",
	}
	return table.concat(sl)
end

function M.statusline()
	local bufnr = vim.fn.winbufnr(vim.g.statusline_winid)
	if vim.g.statusline_winid == vim.fn.win_getid() then
		return active(bufnr)
	else
		return inactive(bufnr)
	end
end

vim.o.statusline = [[%!luaeval('require"layers/statusline".statusline()')]]

return M


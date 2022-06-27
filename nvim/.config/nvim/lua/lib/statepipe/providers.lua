local M = {}

local function colorize(str, hi)
	return string.format("%%#%s#%s%%#StatusLine#", hi, str)
end

-- local function bubble(str, prefix)
-- 	return string.format(
-- 		"%%#%sFG#%%#%sBG#%s %%#%sFG#%%#SlickLineNone#",
-- 		prefix, prefix, str, prefix)
-- end

function M.separator(_, _)
	return "%="
end

function M.mode(_, icons, colors)
	local mode = vim.api.nvim_get_mode().mode
	local label = "  "..(icons[mode] or mode).."  "
	local color = colors[mode] or colors.n
	return colorize(label, color)
	-- return string.format("%s%s%s%s",
		-- colorize("", color[1]), colorize(label, color[2]), colorize("", color[1]), colorize("", "None"))
end

function M.readonly(bufnr, icon)
	return vim.api.nvim_buf_get_option(bufnr, 'readonly') and icon or false
end

function M.modified(bufnr, icon, color)
	return vim.api.nvim_buf_get_option(bufnr, 'modified') and colorize(icon, color) or false
end

function M.short_path()
	return vim.fn.pathshorten(vim.fn.expand("%:."))
end

function M.filename()
	return "%f"
end

function M.filetype()
	return "%y"
end

function M.encoding()
	return "%{&fileencoding?&fileencoding:&encoding}"
end

function M.filetype_icon(bufnr, icons)
	local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
	local icon, color = icons.get_icon(ft)
	if icon then
		icon = colorize(icon, color)
	end
	return ""..(icon or ft)..""
end

function M.filetype_full(bufnr, icons)
	local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
	local icon, color = icons.get_icon(ft)
	if icon then
		icon = colorize(icon, color)
	end
	return (icon or "").." %y"
end

local function lsp_name(bufnr)
	-- local buf_ft = vim.fn.getbufvar(bufnr,'&filetype')
	local ft = vim.api.nvim_buf_get_option(bufnr,'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return nil
	end

	for _,client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, ft) ~= -1 then
			return client.name
		end
	end
	return nil
end

function M.lsp_name(bufnr)
	local name = lsp_name(bufnr)
	return name or false
	-- if name then
		-- return separator .. " " .. name
	-- end
	-- return false
end

function M.lsp_icon(bufnr, icon)
	local name = lsp_name(bufnr)
	if name then
		return icon
	end
	return false
end

function M.spell(bufnr)
	local s = vim.fn.getbufvar(bufnr, "&spell")
	-- local s = vim.api.nvim_buf_get_option(bufnr, "spell")
	local lang = string.upper(vim.api.nvim_buf_get_option(bufnr, "spelllang"))
	return s ~= 0 and "["..lang.."]" or false
end

function M.diagnostics(bufnr, icons, colors)
	if next(vim.lsp.buf_get_clients(0)) == nil then return '' end
	-- local types = {'Error', 'Warning', 'Information', 'Hint'}
	local types = {
		vim.diagnostic.severity.ERROR,
		vim.diagnostic.severity.WARN,
		vim.diagnostic.severity.INFO,
		vim.diagnostic.severity.HINT,
	}
	-- local counts = {0,0,0,0}
	-- local active_clients = vim.lsp.get_active_clients()

	-- if active_clients then
	local ret = {}
	for _, severity in pairs(types) do
		-- counts[k] = counts[k] + #vim.diagnostic.get(bufnr, {severity = v})
		local count = #vim.diagnostic.get(bufnr, {severity = severity})
		if count > 0 then
			table.insert(ret, colorize(icons[severity].." "..count, colors[severity]))
		end
	end
	-- end
	-- return '('..table.concat(counts, ',')..')'
	return table.concat(ret, " ")
end

function M.column(_, icon)
	return "%#DiagnosticVirtualTextHint#  "..icon.."%02c"
end

function M.percent()
	return "%02p "
end

function M.lines(_, icon)
	return icon.."%l/%L"
end

function M.line_count()
	return "%L"
end

-- extension for scoll bar
function M.scrollbar(_, icons)
	local current_line = vim.fn.line('.')
	local total_lines = vim.fn.line('$')
	if total_lines == 1 then
		return "    "
	end
	local index = ((current_line - 1) / (total_lines - 1)) * (#icons - 1) + 1
	index = math.floor(index + 0.5)
	return icons[index]
end

function M.debug(bufnr)
	-- return " " ..vim.g.statusline_winid .. "/"..vim.fn.win_getid()
	return bufnr
end

return M


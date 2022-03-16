package.loaded['lib/sme-statusline/providers'] = nil
local M = {}

function M.separator(_, _)
	return "%="
end

-- function M.color(mode, colors)
-- 	local c = colors[mode] or colors._
-- 	return string.format("%%#%s#", c)
-- end
local function colorize(str, hi)
	return string.format("%%#%s#%s", hi, str)
end

function M.mode(_, icons, colors)
	local mode = vim.api.nvim_get_mode().mode
	local label = icons[mode] or mode
	label = "  "..label.."  "
	local color = colors.mode[mode] or colors.mode.n
	return string.format("%s%s%s%s",
		colorize("", color[1]), colorize(label, color[2]), colorize("", color[1]), colorize("", "NormalText"))
end

function M.readonly(bufnr, icon)
	return vim.api.nvim_buf_get_option(bufnr, 'readonly') and icon or ""
	-- local ft = vim.api.nvim_buf_get_option(bufnr,'filetype')
	-- return vim.fn.getbufvar(bufnr, '&readonly') == 0 and "" or icon
	-- return tostring(vim.api.nvim_buf_get_var(0, "modified"))
end

function M.modified(bufnr, icon)
	-- print(vim.api.nvim_buf_get_option(bufnr,'modified'))
	return vim.api.nvim_buf_get_option(bufnr, 'modified') and icon or ""
	-- return vim.fn.getbufvar(bufnr, '&modified') == 0 and "" or icon
end

function M.short_path()
	return vim.fn.pathshorten(vim.fn.expand("%:."))
end

function M.filename()
	return "%f"
end

function M.filetype(bufnr, icons)
	-- local ft = vim.fn.getbufvar(bufnr,'&filetype')
	local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
	local icon, color = icons.get_icon(ft)
	if icon then
		icon = "%#"..color.."#"..icon.."%#NormalText#"
	end
	return icon or ft
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
	return name or ""
	-- if name then
		-- return separator .. " " .. name
	-- end
	-- return ""
end

function M.lsp_icon(bufnr, icon)
	local name = lsp_name(bufnr)
	if name then
		return icon
	end
	return ""
end

function M.spell(bufnr)
	-- local s = vim.fn.getbufvar(bufnr, "&spell")
	local s = vim.api.nvim_buf_get_option(bufnr, "spell")
	local lang = string.upper(vim.api.nvim_buf_get_option(bufnr, "spelllang"))
	return s == 0 and "" or lang
end

function M.lsp_diagnostic(bufnr)
	if next(vim.lsp.buf_get_clients(0)) == nil then return '' end
	-- local types = {'Error', 'Warning', 'Information', 'Hint'}
	local types = {
		vim.diagnostic.severity.ERROR,
		vim.diagnostic.severity.WARN,
		vim.diagnostic.severity.INFO,
		vim.diagnostic.severity.HINT,
	}
	local counts = {0,0,0,0}
	local active_clients = vim.lsp.get_active_clients()

	if active_clients then
		for _, client in ipairs(active_clients) do
			for k,v in pairs(types) do
				-- counts[k] = counts[k] + #vim.lsp.diagnostic.get(bufnr, v, client.id)
				counts[k] = counts[k] + #vim.diagnostic.get(bufnr, {severity = v})
			end
		end
	end
	return '('..table.concat(counts, ',')..')'
end

function M.column()
	return "%2c"
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


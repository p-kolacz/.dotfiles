package.loaded['sme-statusline/providers'] = nil
local M = {}

function M.color(mode, colors)
	local c = colors[mode] or colors._
	return string.format("%%#%s#", c)
end

function M.mode_label(mode, labels)
	local label = labels[mode] or mode
	return string.format("  %s  ", label)
end

function M.readonly(bufnr, icon)
	return vim.fn.getbufvar(bufnr, '&readonly') == 0 and "" or icon
end

function M.modified(bufnr, icon)
	return vim.fn.getbufvar(bufnr, '&modified') == 0 and "" or icon
end

function M.filetype(bufnr, fticons, separator)
	local ft = vim.fn.getbufvar(bufnr,'&filetype')
	local icon = fticons[ft]
	if icon then
		icon = separator.." "..icon.." "
		-- icon = separator.." "..icon
	end
	return icon or separator.." "..ft.." "
end

local function lsp_name(bufnr)
	local buf_ft = vim.fn.getbufvar(bufnr,'&filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return nil
	end

	for _,client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
			return client.name
		end
	end
	return nil
end

function M.lsp(bufnr, separator)
	local name = lsp_name(bufnr)
	if name then
		return separator .. " " .. name
	end
	return ""
end


function M.lsp_icon(bufnr, icon, separator)
	local name = lsp_name(bufnr)
	if name then
		return separator.." "..icon.." "
	end
	return ""
end

function M.spell(bufnr, separator)
	local s = vim.fn.getbufvar(bufnr, "&spell")
	local lang = string.upper(vim.fn.getbufvar(bufnr, "&spelllang"))
	return s == 0 and "" or string.format("%s %s", separator, lang)
end

function M.lsp_diagnostic(bufnr)
	if next(vim.lsp.buf_get_clients(0)) == nil then return '' end
	local types = {'Error', 'Warning', 'Information', 'Hint'}
	local counts = {0,0,0,0}
	local active_clients = vim.lsp.get_active_clients()

	if active_clients then
		for _, client in ipairs(active_clients) do
			for k,v in pairs(types) do
				counts[k] = counts[k] + vim.lsp.diagnostic.get_count(bufnr, v, client.id)
			end
		end
	end
	return '('..table.concat(counts, ',')..')'
end

-- extension for scoll bar
function M.scrollbar(icons)
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


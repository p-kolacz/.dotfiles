local M = {}

local function map(key, url, desc)
	local action = string.format(':silent exe "!$BROWSER %s"<cr>', url)
	nnoremap_buffer(key, action, desc)
end

function M.map_manual(url)
	map('<leader>hm', url, vim.bo.filetype..' manual')
end

function M.map_api(url)
	map('<leader>ha', url, vim.bo.filetype..' API')
end

return M


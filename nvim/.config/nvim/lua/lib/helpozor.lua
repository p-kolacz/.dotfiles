local M = {}

M.Type = {
	MANUAL     = { "hm", "manual" },
	TUTORIAL   = { "ht", "tutorial" },
	API        = { "ha", "API" },
	FUNCTIONS  = { "hf", "functions" },
	CHEATSHEET = { "hc", "cheat sheet" },
	STYLEGUIDE = { "hs", "style guide" },
	CUSTOM1    = { "h1", "1" },
	CUSTOM2    = { "h2", "2" },
	CUSTOM3    = { "h3", "3" },
}

function M.map(help_type, uri, desc)
	local action = string.format(":silent !xdg-open '%s'<cr>", uri:gsub("#", "\\#"))
	nnoremap_buffer("<leader>"..help_type[1], action, desc or help_type[2])
end

function M.edit_ft_notes()
	vim.cmd(string.format("edit %s/doc/%s.md", vim.fn.stdpath("config"), vim.bo.filetype))
end

return M


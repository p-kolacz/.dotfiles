local M = {}

local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/all/opt/'
local GIHUB_URL = 'https://github.com/'

function M.add(repo)
	local t = vim.fn.split(repo, '/')
	local name = t[2]
	if not name then
		print('Invalid repo name: '..repo)
		return
	end
	local dir = PLUGIN_HOME..name
	if vim.fn.isdirectory(dir) == 0 then
		vim.cmd(string.format('!git clone --depth 1 %s%s.git %s', GIHUB_URL, repo, dir))
	end
	vim.cmd('packadd! '..name)
end

function M.update()
	vim.cmd(string.format('!ls -d %s* | xargs -P10 -I{} git -C {} pull', PLUGIN_HOME))
end

vim.cmd('command! UpdatePlugins lua require"sme-plug".update()')

return M


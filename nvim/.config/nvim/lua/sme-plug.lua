local M = {}

local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/all/opt/'
local GIHUB_URL = 'https://github.com/'

function M.add(repo, git_opts)
	git_opts = git_opts or ''
	local t = vim.fn.split(repo, '/')
	local name = t[2]
	if not name then
		print('Invalid repo name: '..repo)
		return
	end
	local dir = PLUGIN_HOME..name
	if vim.fn.isdirectory(dir) == 0 then
		vim.cmd(string.format('!git clone --depth 1 %s %s%s.git %s', git_opts, GIHUB_URL, repo, dir))
		vim.cmd('packadd! '..name)
		vim.cmd('helptags ALL')
	else
		vim.cmd('packadd! '..name)
	end
end

function M.update()
	vim.cmd(string.format('!ls -d %s* | xargs -P10 -I{} git -C {} pull', PLUGIN_HOME))
	vim.cmd('helptags ALL')
end

vim.cmd('command! PlugUpdate lua require"sme-plug".update()')

return M


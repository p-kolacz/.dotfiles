local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/all/opt/'
local GIHUB_URL = 'https://github.com/'

local function plugin(repo, git_opts)
	local t = vim.fn.split(repo, '/')
	local name = t[#t]
	local dir = PLUGIN_HOME..name
	if vim.fn.isdirectory(dir) == 0 then
		repo = repo:find("https://") == 1 and repo or GIHUB_URL..repo
		vim.cmd(string.format('!git clone --depth 1 %s %s.git %s', git_opts or '', repo, dir))
		vim.cmd('packadd! '..name)
		vim.cmd('helptags ALL')
	else
		vim.cmd('packadd! '..name)
	end
end

function Plugin(repos, git_opts)
	repos = type(repos) == "table" and repos or {repos}
	for _,r in pairs(repos) do
		plugin(r, git_opts)
	end
end

vim.cmd('command! PlugUpdate lua require"sme-plug".update()')

return  {
	update = function()
		vim.cmd(string.format('!ls -d %s* | xargs -P10 -I{} git -C {} pull', PLUGIN_HOME))
		vim.cmd('helptags ALL')
	end
}


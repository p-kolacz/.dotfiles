package.loaded['sme-cheatsh'] = nil

local M = {}

local Curl = 'curl https://cheat.sh/'

function M.cword()
	local ft = vim.bo.filetype
	local cw = vim.fn.expand('<cword>')
	vim.cmd('split')
	vim.cmd(string.format('terminal %s%s/%s', Curl, ft, cw))
end

function M.query(keywords)
	keywords = string.gsub(keywords, '%s', '+')
	local ft = vim.bo.filetype
	vim.cmd('split')
	vim.cmd(string.format('terminal %s%s/%s', Curl, ft, keywords))
end

function M.setup()
	vim.cmd('command! -nargs=0 CheatshCword lua require"sme-cheatsh".cword()')
	vim.cmd('command! -nargs=+ Cheatsh lua require"sme-cheatsh".query(<q-args>)')
end

return M


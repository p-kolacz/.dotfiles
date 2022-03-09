Plugin {
	"https://github.com/tpope/vim-commentary",
	"https://github.com/tpope/vim-surround",
	"https://github.com/tpope/vim-repeat",
	"https://github.com/michaeljsmith/vim-indent-object",
}

-- C-_ means C-/ and C-? means backspace but <BS> also works
nnoremap("<C-_>", ":Commentary<cr><down>")
nnoremap("<BS>",  ":Commentary<cr>")
vnoremap("<BS>",  ":Commentary<cr>")
nnoremap("<leader>cc", "yypkgccj", 'duplicomment') -- was nmap


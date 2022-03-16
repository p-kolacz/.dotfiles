-- Filetype to nvim-web-devicons bridge

local M = {}

local map = {
	dosbatch = "bat",
	dosini = "ini",
	clojure = "clj",
	csv_semicolon = "csv",
	gdscript = "gd",
	make = "makefile",
	mysql = "sql",
	perl = "pl",
	python = "py",
	ruby = "rb",
	rust = "rs",
	text = "txt",
	typescript = "ts",
	typescriptreact = "ts",
	typescriptcommon = "ts",
}

local icons = require "nvim-web-devicons"

function M.get_icon(filetype, opts)
	return icons.get_icon(nil, map[filetype] or filetype, opts)
end

return M


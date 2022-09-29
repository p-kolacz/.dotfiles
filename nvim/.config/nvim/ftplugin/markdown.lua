set.isfname:append("32")
-- set.foldmethod = "indent"
set.foldexpr = "nvim_treesitter#foldexpr()"

nnoremap_buffer("gf", ":e <cfile>.md<cr>")

Help.map(Help.Type.CHEATSHEET, "https://devhints.io/markdown")


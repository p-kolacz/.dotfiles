setlocal.foldenable = false

Help.map(Help.Type.MANUAL, "https://www.gnu.org/software/recutils/manual/")
Help.map(Help.Type.API, "https://www.gnu.org/software/recutils/manual/Concept-Index.html#Concept-Index")

nnoremap_buffer("<localleader>b", ":silent !xdg-open 'https://brickset.com/search?query=<c-r>=expand(\"<cword>\")<cr>&scope=All'<cr>", "brickset")


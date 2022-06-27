Plugin 'https://github.com/SirVer/ultisnips'

mapgroup("<leader>cs", "+Snippets")
nnoremap("<leader>csf", ":UltiSnipsEdit<CR>", "edit filetype snippets")
nnoremap("<leader>csa", ":UltiSnipsEdit!all<CR>", "edit all snippets")

let.UltiSnipsExpandTrigger       = '<tab>'
let.UltiSnipsJumpForwardTrigger  = '<tab>'
let.UltiSnipsJumpBackwardTrigger = '<s-tab>'


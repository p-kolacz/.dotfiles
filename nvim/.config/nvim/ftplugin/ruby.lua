nnoremap_buffer("<localleader>m", ":Emodel<cr>", "model")
nnoremap_buffer("<localleader>v", ":Eview<cr>", "view")
nnoremap_buffer("<localleader>c", ":Econtroller<cr>", "controller")
-- nnoremap_buffer("<localleader>a", ":A<cr>", "alternate")
-- nnoremap_buffer("<localleader>r", ":R<cr>", "related")
nnoremap_buffer("<localleader>r", ":e config/routes.rb<cr>", "routes")

mapgroup("<localleader>R", "+Rails")
nnoremap_buffer("<localleader>Rs", ":Server<cr>")
nnoremap_buffer("<localleader>Rc", ":Console<cr>")



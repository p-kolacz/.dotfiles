 " _____    _                                             _
" |_   _|__| | ___  ___  ___ ___  _ __   ___   _ ____   _(_)_ __ ___
 "  | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \ | '_ \ \ / / | '_ ` _ \
 "  | |  __/ |  __/\__ \ (_| (_) | |_) |  __/_| | | \ V /| | | | | | |
 "  |_|\___|_|\___||___/\___\___/| .__/ \___(_)_| |_|\_/ |_|_| |_| |_|
 "                               |_|
" https://github.com/nvim-telescope/telescope.nvim

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

" https://github.com/nvim-telescope/telescope.nvim#pickers

" File pickers
nnoremap <C-space>		:Telescope find_files<cr>
nnoremap <leader>gf		:Telescope git_files<cr>
nnoremap <leader>fc		:Telescope grep_string<cr>
nnoremap <leader>ff		:Telescope live_grep<cr>
nnoremap <leader>fb		:Telescope file_browser theme=get_dropdown<cr>

" Vim pickers
nnoremap <leader>vb		:Telescope buffers<cr>
nnoremap <leader>fh		:Telescope oldfiles<cr>
nnoremap <leader>vc		:Telescope commands theme=get_dropdown<cr>
nnoremap <leader>vx		:Telescope command_history theme=get_dropdown<cr>
nnoremap <leader>ht		:Telescope help_tags<cr>
nnoremap <leader>vq		:Telescope quickfix<cr>
nnoremap <leader>vl		:Telescope loclist<cr>
nnoremap <leader>vo		:Telescope vim_options theme=get_dropdown<cr>
nnoremap <leader>vr		:Telescope registers<cr>
nnoremap <leader>su		:Telescope spell_suggest theme=get_dropdown<cr>
nnoremap <leader>vk		:Telescope keymaps<cr>
nnoremap <leader>vf		:Telescope filetypes theme=get_dropdown<cr>
nnoremap <leader>vh		:Telescope highlights<cr>
nnoremap <leader>fl		:Telescope current_buffer_fuzzy_find theme=get_dropdown<cr>

" LSP Pickers

" Git Pickers
nnoremap <leader>gcc	:Telescope git_commits<cr>
nnoremap <leader>gcb	:Telescope git_bcommits<cr>
nnoremap <leader>gb		:Telescope git_branches<cr>
nnoremap <leader>gs		:Telescope git_status<cr>

" Treesitter
nnoremap <leader>tt		:Telescope treesitter<cr>

" Symbols
nnoremap <leader>cie	:lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>
nnoremap <leader>cik	:lua require'telescope.builtin'.symbols{ sources = {'kaomoji'} }<cr>
nnoremap <leader>cim	:lua require'telescope.builtin'.symbols{ sources = {'math'} }<cr>
nnoremap <leader>cil	:lua require'telescope.builtin'.symbols{ sources = {'latex'} }<cr>

" Ultisnips
nnoremap <leader>cs		:Telescope ultisnips ultisnips theme=get_dropdown<cr>


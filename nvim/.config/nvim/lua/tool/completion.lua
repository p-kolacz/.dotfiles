Plugin {
	"https://github.com/hrsh7th/nvim-cmp",
	'https://github.com/hrsh7th/cmp-nvim-lsp',
	'https://github.com/hrsh7th/cmp-buffer',
	'https://github.com/hrsh7th/cmp-path',
	'https://github.com/hrsh7th/cmp-cmdline',
	'https://github.com/quangnguyen30192/cmp-nvim-ultisnips',
	'https://github.com/hrsh7th/cmp-calc',
	'https://github.com/hrsh7th/cmp-emoji',
}

set.completeopt = "menu,menuone,noselect"
-- set.completeopt = "menu,menuone"
set.pumheight = 10

local cmp = require'cmp'
local mapping = {
	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	['<C-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	['<C-e>'] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}

local sources1 = {
	{ name = 'nvim_lsp' },
	{ name = 'ultisnips' },
	{ name = 'path' },
	{ name = 'emoji' },
	{ name = 'calc' },
}
local sources2 = {
	-- { name = "buffer", keyword_length = 5, max_item_count = 5 },
	{
		name = "buffer",
		option = {
			keyword_length = 3,
			get_bufnrs = function()
				local bufs = {}
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					bufs[vim.api.nvim_win_get_buf(win)] = true
				end
				return vim.tbl_keys(bufs)
			end
		},
	},
}

local kind_icons = { Text = "", Method = "", Function = "", Constructor = "", Field = "ﰠ", Variable = "", Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ", Unit = "塞", Value = "", Enum = "", Keyword = "", Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "", Constant = "", Struct = "פּ", Event = "", Operator = "", TypeParameter = "" }

local fields = {
	cmp.ItemField.Kind,
	cmp.ItemField.Abbr,
	cmp.ItemField.Menu
}

local function format(entry, vim_item)
	-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
	vim_item.kind = kind_icons[vim_item.kind]    -- This concatonates the icons with the name of the item kind
	vim_item.menu = ({
		buffer = "﬘",
		nvim_lsp = "",
		ultisnips = "",
		emoji = "",
		calc = "",
		latex_symbols = "[LaTeX]",
		luasnip = "[LuaSnip]",
		nvim_lua = "[Lua]",
	})[entry.source.name]
	return vim_item
end

cmp.setup {
	experimental = {
		ghost_text = true,
	},
	-- view = {
	-- 	entries = 'native'
	-- },
	sources = cmp.config.sources(sources1, sources2),
	-- sources = cmp.config.sources({
      -- { name = 'nvim_lsp' },
      -- -- { name = 'vsnip' }, -- For vsnip users.
      -- -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- -- { name = 'snippy' }, -- For snippy users.
    -- }, {
      -- { name = 'buffer' },
    -- }),
	formatting = {
		fields = fields,
		format = format,
	},
	completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
	documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║", },
	mapping = mapping,

	snippet = { -- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
LSP_CAPABILITIES = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


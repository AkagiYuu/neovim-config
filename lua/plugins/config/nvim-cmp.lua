local cmp = require("cmp")
local luasnip = require("luasnip")

local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
		-- completion = {
		--     border = 'single',
		--     winhighlight = 'FloatBorder:Normal'
		-- },
		-- documentation = {
		--     border = 'single',
		--     winhighlight = 'FloatBorder:Normal'
		-- },
	},
	mapping = {
		["<Down>"] = {
			i = cmp.mapping.select_next_item({
				behavior = "insert",
			}),
		},
		["<Up>"] = {
			i = cmp.mapping.select_prev_item({
				behavior = "insert",
			}),
		},
		["<C-e>"] = {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-y>"] = {
			i = cmp.mapping.confirm({
				select = false,
			}),
		},
		["<Tab>"] = {
			i = function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end,
			s = function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end,
			c = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
		},

		["<S-Tab>"] = {
			i = function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end,
			c = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end,
		},
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}),
	source_priority = {
		nvim_lsp = 1000,
		luasnip = 750,
		buffer = 500,
		path = 250,
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = function(_, vim_item)
			vim_item.kind = cmp_kinds[vim_item.kind] or ""
			return vim_item
		end,
	},
})

cmp.setup.cmdline("/", {
	sources = { {
		name = "buffer",
	} },
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})

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
	},
	mapping = {
		["<Down>"] = {
			i = cmp.mapping.select_next_item({
				behavior = "select",
			}),
		},
		["<Up>"] = {
			i = cmp.mapping.select_prev_item({
				behavior = "select",
			}),
		},
		["<C-e>"] = {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = {
			i = function(fallback)
				if cmp.visible() then
					cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					})
				elseif luasnip.expand_or_jumpable() then
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
	sources = {
		{ name = "copilot", max_item_count = 2 },
		{ name = "luasnip", max_item_count = 2 },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "rg", keyword_length = 5 },
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = function(_, vim_item)
			vim_item.kind = cmp_kinds[vim_item.kind] or ""
			return vim_item
		end,
	},
	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({ {
		name = "path",
	}, {
		name = "cmdline",
	} }),
})

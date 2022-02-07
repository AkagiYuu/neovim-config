local cmp = require("cmp")
local lspkind = require("lspkind")

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
	-- REQUIRED
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	mapping = {
		-- ['<c-@>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		--[[ ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping. ]]
		["<C-n>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Down>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Up>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if vim.fn["vsnip#available"](1) == 1 then
		-- 		feedkey("<Plug>(vsnip-jump-next)", "")
		-- 	-- else
  --  --              feedkey('<Tab>', 'n')<Plug>(cmp.u.k.recursive:
  --           else
  --               fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function()
		-- 	if vim.fn["vsnip#jumpable"](-1) == 1 then
		-- 		feedkey("<Plug>(vsnip-jump-prev)", "")
		-- 	end
		-- end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
		}),
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=] },
	}),
})

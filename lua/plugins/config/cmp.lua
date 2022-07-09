local cmp = require('cmp')
local luasnip = require('luasnip')

local cmp_kinds = require('icons.cmp')

local source_map = {
    cmp_tabnine = '[tabnine]',
    buffer = '[buffer]',
    path = '[path]',
    rg = '[rg]',
    calc = '[calc]',
}
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered { border = 'single' },
        documentation = cmp.config.window.bordered { border = 'single' },
    },
    mapping = {
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<Down>'] = {
            i = cmp.mapping.select_next_item { behavior = 'select' },
        },
        ['<Up>'] = {
            i = cmp.mapping.select_prev_item {
                behavior = 'select',
            },
        },
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-f>'] = cmp.mapping.scroll_docs(-5),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if  cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's', 'c' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if  cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's', 'c' }),
    },
    sources = cmp.config.sources({
        -- { name = 'cmp_tabnine', max_item_count = 2 },
        { name = 'luasnip', max_item_count = 2 },
        { name = 'nvim_lsp' },
        { name = 'crates' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'calc' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'rg', keyword_length = 5 },
    }),

    -- completion = {
    --     completeopt = 'menu,menuone',
    -- },

    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            vim_item.kind = cmp_kinds[vim_item.kind] or ''
            vim_item.menu = source_map[entry.source.name] or ''
            return vim_item
        end,
    },
    experimental = {
        ghost_text = true,
    },
}

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
        { name = 'path' },
    },
})

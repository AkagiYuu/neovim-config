local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
    catppuccin.setup {
        transparent_background = true,
        term_colors = true,
        compile = { enabled = true },
        styles = {
            comments     = { 'italic' },
            conditionals = { 'italic' },
            loops        = { 'italic' },
            functions    = { 'italic' },
            keywords     = { 'italic' },
        },
        integrations = {
            nvimtree = {
                show_root = true,
                transparent_panel = true,
            },
            native_lsp = {
                underlines = {
                    errors      = { 'undercurl' },
                    hints       = { 'undercurl' },
                    warnings    = { 'undercurl' },
                    information = { 'undercurl' },
                },
            },
            -- telescope = false,
            lsp_saga = true,
            which_key = true,
            dashboard = false,
            -- lightspeed = true,
            telekasten = false,
            symbols_outline = false,
            vimwiki = false,
            beacon = false,
        },
        custom_highlights = {
            CursorLine                 = { bg = 'NONE' },
            DiagnosticVirtualTextError = { bg = 'NONE' },
            DiagnosticVirtualTextWarn  = { bg = 'NONE' },
            DiagnosticVirtualTextInfo  = { bg = 'NONE' },
            DiagnosticVirtualTextHint  = { bg = 'NONE' },
            WhichKeyFloat              = { bg = 'NONE' },
            NormalFloat                = { bg = 'NONE' },
            LspFloatWinNormal          = { bg = 'NONE' },
            TelescopeSelection         = { bg = 'NONE' },
        },
    }
    vim.g.catppuccin_flavour = 'mocha'
    vim.cmd('colorscheme catppuccin')
end

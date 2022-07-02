local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
    vim.g.catppuccin_flavour = 'frappe'
    catppuccin.setup {
        transparent_background = true,
        term_colors = true,
        integrations = {
            nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = true,
            },
            native_lsp = {
                underlines = {
                    errors = 'undercurl',
                    hints = 'undercurl',
                    warnings = 'undercurl',
                    information = 'undercurl',
                },
            },
            lsp_trouble = true,
            lsp_saga = true,
            which_key = true,
            dashboard = false,
            lightspeed = false,
            ts_rainbow = true,
        },
    }
    vim.cmd([[colorscheme catppuccin]])
end

local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
    catppuccin.setup {
        transparent_background = true,
        term_colors = true,
        styles = {
            comments = 'italic',
            conditionals = 'italic',
            loops = 'italic',
            functions = 'italic',
            keywords = 'italic',
            -- strings = 'NONE',
            -- variables = 'NONE',
            -- numbers = 'NONE',
            -- booleans = 'NONE',
            -- properties = 'NONE',
            -- types = 'NONE',
            -- operators = 'NONE',
        },
        integrations = {
            nvimtree = {
                -- enabled = true,
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
            -- telescope = false,
            lsp_trouble = true,
            lsp_saga = true,
            which_key = true,
            -- dashboard = false,
            -- lightspeed = true,
            ts_rainbow = true,
        },
    }
    vim.cmd("colorscheme catppuccin")
end

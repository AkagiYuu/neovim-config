local saga = require 'lspsaga'
saga.init_lsp_saga({
    diagnostic_header = { ' ', ' ', ' ', 'ﴞ ' },
    -- show diagnostic source
    show_diagnostic_source = true,
    -- add bracket or something with diagnostic source,just have 2 elements
    diagnostic_source_bracket = {},
    -- use emoji lightbulb in default
    code_action_icon = '💡',
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    -- separator in finder
    finder_separator = '  ',
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 10,
    finder_action_keys = {
        open = 'o', vsplit = 's', split = 'i', quit = 'q', scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
        quit = 'q', exec = '<CR>'
    },
    -- rename_action_keys = {
    --   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
    -- },
    definition_preview_icon = '  ',
    -- "single" "double" "rounded" "bold" "plus"
    border_style = "single",
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = {metals = {'sbt', 'scala'}}
    server_filetype_map = {},
})

local saga = require('lspsaga')
saga.init_lsp_saga {
    move_in_saga = {
        prev = '<Up>',
        next = '<Down>',
    },
    code_action_keys = {
        quit = 'q',
        exec = '<CR>',
    },
    rename_action_quit = '<Esc>',
    border_style = 'single',
    -- symbol_in_winbar = true,
    winbar_separator = '>',
    winbar_show_file = true,
}

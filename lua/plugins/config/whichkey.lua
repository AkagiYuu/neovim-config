local which_key = require('which-key')

which_key.setup {
    popup_mappings = {
        scroll_down = '<Down>',
        scroll_up = '<Up>',
    },
    window = { border = 'rounded' },
    plugins = {
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
    },
}

which_key.register({
    f = {
        name = 'Telescope',
        g = 'Git',
    },
    d = {
        name = 'Diagnostic/Debug'
    }
}, { prefix = '<leader>' })

which_key.register({
    ['<c-w>'] = { name = ' Windows' },
    ["'"] = { name = ' Marks' },
    ['"'] = { name = ' Registers' },
    ['z'] = { name = 'ﬡ Folds/View/Spelling' },
    ['g'] = { name = ' Miscellaneous' },
}, { prefix = '' })

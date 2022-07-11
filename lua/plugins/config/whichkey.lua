local which_key = require('which-key')

which_key.setup {
    icons = {
      breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
      separator = '  ', -- symbol used between a key and it's label
      group = '+', -- symbol prepended to a group
    },
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
        name = 'Find',
        ['<Enter>'] = { function() require('telescope.builtin').builtin() end, 'All picker' },
        r = { function() require('telescope.builtin').resume() end, 'Resume' },
        f = { function() require('telescope.builtin').find_files() end, 'File' },
        g = { function() require('telescope.builtin').live_grep() end, 'Live grep' },
        ['?'] = { function() require('telescope.builtin').help_tags() end, ' Help' },
        o = { function() require('telescope.builtin').oldfiles() end, 'Recently opened files' },
        a = { function() require('telescope.builtin').autocommands() end, 'Auto commands' },
        k = { function() require('telescope.builtin').keymaps() end, 'Keymaps' },
        b = { function() require('telescope').extensions.file_browser.file_browser() end, 'File browser' },
        ['/'] = { function() require('telescope.builtin').current_buffer_fuzzy_find() end, ' Find' },
        c = { function() require('telescope.builtin').commands() end, ' Commands' },
    },
    g = {
        name = 'Git',
        c = { function() require('telescope.builtin').git_commits() end, 'View commit' },
        b = { function() require('telescope.builtin').git_branches() end, 'View branches' },
        ['?'] = { function() require('telescope.builtin').git_status() end, 'Git status' },
    },
    p = {
        name = 'Packer',
        i = { ':PackerInstall<CR>', 'Install' },
        u = { ':PackerUpdate<CR>', 'Update' },
        r = { ':PackerClean<CR>', 'Clean' },
        s = { ':PackerSync<CR>', 'Sync' },
        c = { ':PackerCompile<CR>', 'Compile' },
    },
    b = {
        name = 'ﴵ Buffers',
        C = { ':bdelete! <CR>', 'Close Current Buffer' },
        e = { ':noh<CR>', 'Erase Search Highlights' },
        n = { ':ene <BAR> startinsert<CR>', 'New Buffer' },
        c = { ':BufferLinePickClose<CR>', 'Close Buffer' },
        l = { ':CybuNext<CR>', 'Move Buffer Right' },
        h = { ':CybuPrev<CR>', 'Move buffer Left' },
        m = { ':TZFocus<CR>', 'Maximize Current Buffer' }
    },
}, { prefix = '<leader>' })

which_key.register({
    ['<c-w>'] = { name = ' Windows' },
    ["'"] = { name = ' Marks' },
    ['"'] = { name = ' Registers' },
    ['z'] = { name = 'ﬡ Folds/View/Spelling' },
    ['g'] = { name = ' Miscellaneous' },
}, { prefix = '' })

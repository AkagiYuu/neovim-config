local hint = [[
                 _f_: files             _b_: files browser
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files         _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _a_: autocommands      _/_: search in file
  🭅█ ▁     █🭐
  ██🬿      🭊██   _h_: vim help          _c_: execute command
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _k_: keymap            _;_: commands history
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _r_: registers         _?_: search history

                 _<Enter>_: Telescope           _q_
]]

local telescope = {
    name = 'Telescope',
    hint = hint,
    config = {
        color = 'teal',
        invoke_on_body = true,
        hint = {
            position = 'bottom',
            border = 'rounded',
        },
    },
    mode = 'n',
    body = '<Leader>f',
    heads = {
        {
            'f',
            function()
                require('telescope.builtin').find_files()
            end,
        },
        {
            'g',
            function()
                require('telescope.builtin').live_grep()
            end,
        },
        {
            'h',
            function()
                require('telescope.builtin').help_tags()
            end,
            { desc = 'Vim help' },
        },
        {
            'o',
            function()
                require('telescope.builtin').oldfiles()
            end,
            { desc = 'Recently opened files' },
        },
        {
            'a',
            function()
                require('telescope.builtin').autocommands()
            end,
        },
        {
            'k',
            function()
                require('telescope.builtin').keymaps()
            end,
        },
        {
            'r',
            function()
                require('telescope.builtin').registers()
            end,
        },
        { 'b', ':Telescope file_browser<cr>', { desc = 'Projects', silent = true } },
        {
            '/',
            function()
                require('telescope.builtin').current_buffer_fuzzy_find()
            end,
            { desc = 'Search in file' },
        },
        {
            '?',
            function()
                require('telescope.builtin').search_history()
            end,
            { desc = 'Search history' },
        },
        {
            ';',
            function()
                require('telescope.builtin').command_history()
            end,
            { desc = 'Command-line history' },
        },
        {
            'c',
            function()
                require('telescope.builtin').commands()
            end,
            { desc = 'Execute command' },
        },
        {
            '<Enter>',
            function()
                require('telescope.builtin').builtin()
            end,
            { exit = true, desc = 'List all pickers' },
        },
        { 'q', nil, { exit = true, nowait = true } },
    },
}

return telescope

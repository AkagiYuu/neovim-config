local hint = [[
    ^^^^^^     Move     ^^^^^^   ^^     Split
    ^^^^^^--------------^^^^^^   ^^---------------
    ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    _s_: horizontally
    _h_ ^ ^ _l_   _H_ ^ ^ _L_    _v_: vertically
    ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    _q_: close
    focus^^^^^^   window^^^^^^   ^ ^
    ^ ^ ^ ^ ^ ^   ^ ^ ^ ^ ^ ^
]]

local window = {
    name = 'Window',
    hint = hint,
    config = {
        timeout = 4000,
        invoke_on_body = true,
        hint = {
            border = 'rounded',
            position = 'bottom'
        }
    },
    mode = 'n',
    body = '<C-w>',
    heads = {
        { 'h', '<C-w>h' },
        { 'j', '<C-w>j' },
        { 'k', [[<cmd>try | wincmd k | catch /^Vim\%((\a\+)\)\=:E11:/ | close | endtry<CR>]] },
        { 'l', '<C-w>l' },

        { 'H', '<Cmd>WinShift left<CR>' },
        { 'J', '<Cmd>WinShift down<CR>' },
        { 'K', '<Cmd>WinShift up<CR>' },
        { 'L', '<Cmd>WinShift right<CR>' },

        { 's', '<C-w>s' },
        { 'v', '<C-w>v' },

        -- { '<C-h>', function() splits.resize_left(2) end },
        -- { '<C-j>', function() splits.resize_down(2) end },
        -- { '<C-k>', function() splits.resize_up(2) end },
        -- { '<C-l>', function() splits.resize_right(2) end },
        -- { '=', '<C-w>=', { desc = 'equalize' } },

        -- { 'b', '<Cmd>BufExplorer<CR>', { exit = true, desc = 'choose buffer' } },
        { 'q', [[<Cmd>try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry<CR>]],
            { desc = 'close window' } },
        { '<Esc>', nil, { exit = true, desc = false } }
    }
}
return window
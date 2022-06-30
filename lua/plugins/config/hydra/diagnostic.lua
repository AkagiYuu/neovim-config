local hint = [[
 _d_: next diagnostic         _l_: current line diagnostic
 _D_: previous diagnostic     _q_: exit
]]
local diagnostic = {
    name = 'Diagnostic',
    hint = hint,
    config = {
        timeout = 4000,
        invoke_on_body = true,
        hint = {
            position = 'bottom',
            border = 'rounded'
        },
    },
    mode = { 'n' },
    body = '<leader>d',
    heads = {
        { 'l', function() require("lspsaga.diagnostic").show_line_diagnostics() end },
        { 'd', function() require("lspsaga.diagnostic").goto_next() end },
        { 'D', function() require("lspsaga.diagnostic").goto_prev() end },
        { 'q', nil, { exit = true, nowait = true } }
    }
}
return diagnostic

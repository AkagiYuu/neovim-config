local hint = [[
 ^^^               Debug                  ^          Diagnostic      ^ 
 ^^^--------------------------------------^  ------------------------^ 
 _c_: Continue       _p_: Toggle breakpoint  _d_: Next diagnostic
 _i_: Step in        _o_: Step over          _D_: Previous diagnostics 
 _u_: Step out       _b_: Step back          _l_: Line diagnostic
 _s_: Start debug    _q_: Stop debug         _t_: Toggle virtual line
]]
local diagnostic = {
    name = 'Diagnostic',
    hint = hint,
    config = {
        color = 'pink',
        timeout = 1000,
        invoke_on_body = true,
        hint = {
            position = 'bottom',
            border = 'rounded',
        },
    },
    mode = { 'n' },
    body = '<leader>d',
    heads = {
        {
            's',
            function()
                require 'dap'.continue()
                require 'dapui'.open()
            end,
            { nowait = true },
        },
        {
            'q',
            function()
                require 'dap'.close()
                require 'dapui'.close()
            end,
            { nowait = true },
        },
        { 'c', function() require 'dap'.continue() end, { nowait = true } },
        { 'p', function() require 'dap'.toggle_breakpoint() end, { nowait = true } },
        { 'i', function() require 'dap'.step_into() end, { nowait = true } },
        { 'o', function() require 'dap'.step_over() end, { nowait = true } },
        { 'b', function() require 'dap'.step_back() end, { nowait = true } },
        { 'u', function() require 'dap'.step_out() end, { nowait = true } },
        { 'd', function() require('lspsaga.diagnostic').goto_next() end, { nowait = true }, },
        { 'D', function() require('lspsaga.diagnostic').goto_prev() end, { nowait = true }, },
        { 'l', function() require('lspsaga.diagnostic').show_line_diagnostics() end, { nowait = true }, },
        {
            't',
            function()
                local virtual_lines_enable = not vim.diagnostic.config().virtual_lines
                vim.diagnostic.config {
                                virtual_lines = virtual_lines_enable,
                                virtual_text = not virtual_lines_enable
                }
            end,
            { nowait = true },
        },
    },
}
return diagnostic

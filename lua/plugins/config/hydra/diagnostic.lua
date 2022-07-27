local hint = [[
_c_: Continue           _p_: Toggle breakpoint   
_i_: Step in            _o_: Step over
_u_: Step out           _b_: Step back
_s_: Start debug        _q_: Stop debug

_d_: Next diagnostic    _D_: Previous diagnostic
_l_: Line diagnostic    _t_: Toggle virtual lines
]]
local diagnostic = {
    name = 'Diagnostic',
    hint = hint,
    config = {
        timeout = 4000,
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
            's', function()
                require 'dap'.continue()
                require 'dapui'.open()
            end
        },
        {
            'q', function()
                require 'dap'.close()
                require 'dapui'.close()
            end
        },
        { 'c', function() require 'dap'.continue() end },
        { 'p', function() require 'dap'.toggle_breakpoint() end },
        { 'i', function() require 'dap'.step_into() end },
        { 'o', function() require 'dap'.step_over() end },
        { 'b', function() require 'dap'.step_back() end },
        { 'u', function() require 'dap'.step_out() end },
        { 'd', function() require('lspsaga.diagnostic').goto_next() end, },
        { 'D', function() require('lspsaga.diagnostic').goto_prev() end, },
        { 'l', function() require('lspsaga.diagnostic').show_line_diagnostics() end, },
        {
            't', function()
                local virtual_lines_enable = not vim.diagnostic.config().virtual_lines
                vim.diagnostic.config {
                    virtual_lines = virtual_lines_enable,
                    virtual_text = not virtual_lines_enable
                }
            end
        },
    },
}
return diagnostic

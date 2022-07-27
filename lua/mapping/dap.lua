local map = vim.keymap.set
map("n", '<leader>dp', function() require 'dap'.toggle_breakpoint() end, {
    desc = 'Toggle Breakpoint'
})
map("n", '<leader>db', function() require 'dap'.step_back() end, {
    desc = 'Step Back'
})
map("n", '<leader>dc', function() require 'dap'.continue() end, {
    desc = 'Continue'
})
map("n", '<leader>dC', function() require 'dap'.run_to_cursor() end, {
    desc = 'Run To Cursor'
})
map("n", '<leader>di', function() require 'dap'.step_into() end, {
    desc = 'Step Into'
})
map("n", '<leader>do', function() require 'dap'.step_over() end, {
    desc = 'Step Over'
})
map("n", '<leader>du', function() require 'dap'.step_out() end, {
    desc = 'Step Out'
})
map("n", '<leader>ds', function()
    require 'dap'.continue()
    require 'dapui'.open()
end, { desc = 'Start' })
map("n", '<leader>dq', function()
    require 'dap'.close()
    require 'dapui'.close()
end, { desc = 'Quit' })

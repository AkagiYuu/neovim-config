local dap = require('dap')
dap.defaults.fallback.external_terminal = {
    command = 'kitty',
    args = { '-e' },
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}
dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = '${fileDirname}/build/${fileBasenameNoExtension}',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},

    runInTerminal = true,
  },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.cpp
require('dapui').setup {}


vim.fn.sign_define('DapBreakpoint', {
      text = '',
      texthl = 'DapBreakpoint',
})
vim.fn.sign_define('DapBreakpointCondition', {
    text = '',
    texthl = 'DapBreakpointCondition',
})
vim.fn.sign_define('DapLogPoint', {
    text = '',
    texthl = 'DapLogPoint',
})

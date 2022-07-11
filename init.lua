pcall(require, 'impatient')

require('option')
require('lsp')
require('theme')
require('autocmd')
require('icons')

vim.defer_fn(function()
    require('mapping')
    require('plugins')

    vim.api.nvim_exec_autocmds('User', { pattern = 'Defer' })
    vim.cmd([[ rshada ]])
    vim.opt.spell = true
end, 1000)

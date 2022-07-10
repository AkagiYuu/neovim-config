pcall(require, 'impatient')

require('option')
require('theme')
require('autocmd')
require('lsp')
require('icons')

vim.defer_fn(function()
    require('mapping')
    require('plugins')

    vim.cmd([[ rshada ]])
    vim.opt.spell = true
end, 1000)

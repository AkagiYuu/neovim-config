pcall(require, 'impatient')

require('option')
require('plugins')
require('theme')
require('autocmd')
require('icons')

vim.defer_fn(function()
    require('mapping')
    vim.cmd([[ rshada ]])
    vim.opt.spell = true
end, 1000)

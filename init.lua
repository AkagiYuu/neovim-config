pcall(require, 'impatient')

require('option')
require('theme')
require('autocmd')
require('icons')

vim.defer_fn(function()
    require('lsp')
    require('mapping')
    require('plugins')

    vim.api.nvim_exec_autocmds('User', { pattern = 'Defer' })
    if vim.g.started_by_firenvim then
        vim.opt.showtabline = 1
        vim.opt.laststatus = 0
        vim.opt.guifont = {
            "Rec Mono Semicasual:h12",
            "nonicons:h12"
        }
    end
    vim.cmd.rshada()
    vim.opt.spell = true
end, 1000)

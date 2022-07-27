require('kanagawa').setup {
    transparent = true,
}
vim.cmd.colorscheme('kanagawa')
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })

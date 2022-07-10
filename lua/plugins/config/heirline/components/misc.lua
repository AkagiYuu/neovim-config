local M = {}

local misc = require('plugins.config.heirline.utils.misc')

M.fold_method = {
    condition = function() return vim.wo.foldenable end,
    hl = {
        fg = 'green_pale',
        bold = true,
    },
    { provider = '  ' },
    { provider = function() return string.format('%s[%d]', vim.wo.foldmethod, vim.wo.foldlevel) end },
}

M.spell_check = {
    provider = ' 暈',
    condition = function() return vim.wo.spell end,
    hl = { fg = 'yellow', bold = true },
}

M.help_file_name = {
    condition = function() return vim.bo.filetype == 'help' end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ':t')
    end,
    hl = { fg = 'blue' },
}

M.search_result = { provider = misc.search_results }

return M

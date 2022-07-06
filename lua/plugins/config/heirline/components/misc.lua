local M = {}

local fold_method = require('plugins.config.heirline.modules.misc').fold_method

M.fold_method = function(colors)
    return {
        condition = function()
            return vim.wo.foldenable
        end,
        {
            hl = {
                fg = colors.green_pale,
                bold = true,
            },
            {
                provider = '  ',
            },
            {
                provider = fold_method,
            },
        },
    }
end

M.spell_check = function(colors)
    return {
        provider = ' 暈',
        condition = function()
            return vim.wo.spell
        end,
        hl = {
            fg = colors.yellow,
            bold = true,
        },
    }
end

M.help_file_name = function(colors)
    return {
        condition = function()
            return vim.bo.filetype == 'help'
        end,
        provider = function()
            local filename = vim.api.nvim_buf_get_name(0)
            return vim.fn.fnamemodify(filename, ':t')
        end,
        hl = {
            fg = colors.blue,
        },
    }
end

M.search_result = {
    provider = require('plugins.config.heirline.modules.misc').search_results,
}

return M

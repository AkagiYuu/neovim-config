local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('plugins.config.heirline.colors')
local seperators = require('icons.heirline')

--#region Components
local space = {
    provider = ' ',
}
local spring = {
    provider = '%=',
}
local null = {
    provider = '',
}

local vim_mode = require('plugins.config.heirline.components.vim_mode')(seperators)
local git = require('plugins.config.heirline.components.git')(utils, conditions)

local file = require('plugins.config.heirline.components.file')
local file_info = file.info(utils, conditions)

local location = require('plugins.config.heirline.components.location')
local locallist = location.locallist
local cursor_location = location.cursor

local lsp = require('plugins.config.heirline.components.lsp')

local misc = require('plugins.config.heirline.components.misc')
local fold_method = misc.fold_method
local spell_check = misc.spell_check
local help_file_name = misc.help_file_name
local search_result = misc.search_result

--#endregion

--#region Active Status Line
local active_left_segment = {
    hl = {
        fg = 'grey',
    },
    vim_mode,
    utils.make_flexible_component(3, fold_method, null),
    utils.surround({ ' ', ' ' }, 'statusline_bg', git),
}

local active_middle_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,
    utils.surround({ ' ', ' ' }, 'statusline_bg', file_info),
}

local active_right_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,
    hl = {
        fg = 'grey',
    },
    lsp.name(utils, conditions),
    lsp.diagnostic(conditions, colors),
    spell_check,
    file.type(utils),
    space,
    search_result,
    {
        hl = function(self)
            return {
                fg = 'light_bg',
                bg = self:mode_color(),
            }
        end,
        {
            provider = seperators.left_filled,
            hl = function(self)
                return {
                    fg = self:mode_color(),
                    bg = 'statusline_bg',
                }
            end,
        },
        {
            provider = '',
        },

        space,
        locallist,
        cursor_location,
    },
    space,
}

local active_status_line = {
    condition = conditions.is_active,
    hl = {
        fg = utils.get_highlight('StatusLine').fg,
        bg = 'NONE',
    },

    utils.surround({ '', seperators.right_filled }, 'statusline_bg', active_left_segment),

    spring,
    utils.surround({ seperators.left_filled, seperators.right_filled }, 'statusline_bg', active_middle_segment),

    spring,
    utils.surround({ seperators.left_filled, '' }, 'statusline_bg', active_right_segment),
}
--#endregion

--#region Inactive Status Line
local inactive_left_slant = {
    provider = seperators.slant_right_2,
    hl = {
        fg = 'short_bg',
        bg = 'mid_bg',
    },
}

local inactive_right_slant = {
    provider = seperators.slant_right_2,
    hl = {
        fg = 'mid_bg',
        bg = 'short_bg',
    },
}
local inactive_right_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,

    hl = {
        fg = 'mid_bg',
        bg = 'green_pale',
    },
    {
        {
            provider = seperators.slant_left,
            hl = {
                fg = 'green_pale',
                bg = 'short_bg',
            },
        },
        {
            provider = '',
        },
        locallist,
        cursor_location,
    },
}

local inactive_status_line = {
    condition = function()
        return not conditions.is_active()
    end,
    hl = {
        fg = 'white',
        bg = 'short_bg',
    },
    {
        hl = {
            bg = 'mid_bg',
        },
        git,
        space,
        inactive_right_slant,
    },

    spring,
    {
        inactive_left_slant,
        space,
        hl = {
            bg = 'mid_bg',
        },
        file_info,
        space,
        inactive_right_slant,
    },

    spring,
    inactive_right_segment,
}
--#endregion

local disabled_buffers = {
    condition = function()
        return conditions.buffer_matches {
            filetype = { 'NvimTree', 'dbui', 'packer', 'startify', 'fugitive', 'fugitiveblame' },
            buftype = { 'nofile', 'help', 'quickfix', 'terminal' },
        }
    end,
    provider = ' ',
}

local status_line = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(self.filename, ':e')
        self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(self.filename, extension, {
            default = true,
        })
        self.mode = vim.fn.mode(1)
    end,
    static = {
        mode_colors = {
            n = 'green',
            i = 'red',
            v = 'nord_blue',
            V = 'nord_blue',
            ['\22'] = 'nord_blue',
            c = 'yellow',
            s = 'purple',
            S = 'purple',
            ['\19'] = 'purple',
            R = 'orange',
            r = 'orange',
            ['!'] = 'red',
            t = 'red',
        },
        mode_color = function(self)
            local mode = conditions.is_active() and vim.fn.mode() or "n"
            return self.mode_colors[mode]
        end,
    },

    stop_when = function(_, out)
        return out ~= ''
    end,
    help_file_name,
    disabled_buffers,
    active_status_line,
    inactive_status_line,
}

require('heirline').setup(status_line)

local conditions = require('heirline.conditions')
local heirline = require('heirline.utils')
local mode_color = require('plugins.config.heirline.modules.mode').color
local colors = require('plugins.config.heirline.colors')
local icons = require('theme.icon').heirline

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

local vim_mode = require('plugins.config.heirline.components.vim_mode')(colors, icons)
local git = require('plugins.config.heirline.components.git')(heirline, conditions, colors)

local file = require('plugins.config.heirline.components.file')
local file_info = file.info(heirline, conditions, colors, icons)

local location = require('plugins.config.heirline.components.location')
local locallist = location.locallist(colors)
local cursor_location = location.cursor(colors)

local lsp = require('plugins.config.heirline.components.lsp')

local misc = require('plugins.config.heirline.components.misc')
local fold_method = misc.fold_method(colors)
local spell_check = misc.spell_check(colors)
local help_file_name = misc.help_file_name(colors)
local search_result = misc.search_result

--#endregion

--#region Active Status Line
local active_left_segment = {
    hl = {
        fg = colors.grey_fg,
    },
    vim_mode,
    heirline.make_flexible_component(3, fold_method, null),
    heirline.surround({ ' ', ' ' }, colors.statusline_bg, git),
}

local active_middle_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,
    heirline.surround({ ' ', ' ' }, colors.statusline_bg, file_info),
}

local active_right_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,
    hl = {
        fg = colors.grey_fg,
    },
    lsp.name(heirline, conditions),
    lsp.diagnostic(conditions, colors),
    spell_check,
    file.type(heirline),
    space,
    search_result,
    {
        hl = function(self)
            return {
                fg = colors.light_bg,
                bg = mode_color(self.mode),
            }
        end,
        {
            provider = icons.left_filled,
            hl = function(self)
                return {
                    fg = mode_color(self.mode),
                    bg = colors.statusline_bg,
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
        fg = heirline.get_highlight('StatusLine').fg,
        bg = 'NONE',
    },

    heirline.surround({ '', icons.right_filled }, colors.statusline_bg, active_left_segment),

    spring,
    heirline.surround({ icons.left_filled, icons.right_filled }, colors.statusline_bg, active_middle_segment),

    spring,
    heirline.surround({ icons.left_filled, '' }, colors.statusline_bg, active_right_segment),
}
--#endregion

--#region Inactive Status Line
local inactive_left_slant = {
    provider = icons.slant_right_2,
    hl = {
        fg = colors.short_bg,
        bg = colors.mid_bg,
    },
}

local inactive_right_slant = {
    provider = icons.slant_right_2,
    hl = {
        fg = colors.mid_bg,
        bg = colors.short_bg,
    },
}
local inactive_right_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,

    hl = {
        fg = colors.mid_bg,
        bg = colors.green_pale,
    },
    {
        {
            provider = icons.slant_left,
            hl = {
                fg = colors.green_pale,
                bg = colors.short_bg,
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
        fg = colors.white,
        bg = colors.short_bg,
    },
    {
        hl = {
            bg = colors.mid_bg,
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
            bg = colors.mid_bg,
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

    stop_when = function(_, out)
        return out ~= ''
    end,
    help_file_name,
    disabled_buffers,
    active_status_line,
    inactive_status_line,
}

require('heirline').setup(status_line)

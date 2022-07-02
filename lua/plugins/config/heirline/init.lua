local conditions = require('heirline.conditions')
local heirline = require('heirline.utils')
local util = require('plugins.config.heirline.modules')
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

local vim_mode = {
    init = function(self)
        self.mode_ch = self.mode:sub(1, 1) -- get only the first mode character
    end,
    hl = function(self)
        return {
            fg = util.mode_color(self.mode_ch),
            bold = true,
        }
    end,
    {
        hl = function(self)
            return {
                fg = colors.statusline_bg,
                bg = util.mode_color(self.mode_ch),
                bold = true,
            }
        end,
        provider = '  ',
    },
    {
        provider = function(self)
            return '  %2(' .. util.mode_name(self.mode) .. '%) '
        end,
    },
}

local fold_method = {
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
            provider = util.fold_method,
        },
    },
}

local git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
    end,
    heirline.make_flexible_component(2, {
        {
            provider = '  ',
            hl = {
                fg = colors.git.add,
            },
        },
        {
            provider = function(self)
                return self.status_dict.head
            end,
        },
    }, null),
    {
        condition = function(self)
            return self.has_changes == self.status_dict.added ~= 0
                or self.status_dict.removed ~= 0
                or self.status_dict.changed ~= 0
        end,
        heirline.make_flexible_component(
            4,
            {
                util.git_count('added', 'add', '  '),
                util.git_count('removed', 'del', '  '),
                util.git_count('changed', 'change', ' 柳'),
            },
            { util.git_count('removed', 'del', '  '), util.git_count('changed', 'change', ' 柳') },
            { util.git_count('removed', 'del', '  ') },
            null
        ),
    },
}

local file_size = {
    provider = function(self)
        local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
        local index = 1
        local fsize = vim.fn.getfsize(self.filename)

        if fsize < 0 then
            fsize = 0
        end

        while fsize > 1024 and index < 7 do
            fsize = fsize / 1024
            index = index + 1
        end
        return string.format(index == 1 and '%g%s' or '%.2f%s', fsize, suffix[index])
    end,
    hl = {
        fg = colors.grey_fg,
    },
}

local file_lock_info = {
    {
        provider = function()
            if vim.bo.modified then
                return ' '
            end
        end,
        hl = {
            fg = colors.green,
        },
    },
    {
        provider = function()
            if not vim.bo.modifiable or vim.bo.readonly then
                return ' '
            end
        end,
        hl = {
            fg = colors.orange,
        },
    },
}

local file_name = {
    init = function(self)
        self.filename = vim.fn.fnamemodify(self.filename, ':.')
        if self.filename == '' then
            return '[No Name]'
        end
    end,
    heirline.make_flexible_component(1, {
        provider = function(self)
            return self.filename
        end,
    }, {
        provider = function(self)
            return vim.fn.pathshorten(self.filename)
        end,
    }),
}

local file_icon = {
    provider = function(self)
        return self.icon and (self.icon .. ' ')
    end,
    hl = function(self)
        return {
            fg = self.icon_color,
        }
    end,
}

local folder_name = {
    condition = function()
        return conditions.is_git_repo()
    end,
    {
        provider = icons.folder_icon,
        hl = {
            fg = colors.folder,
        },
    },
    {
        provider = util.git_root,
    },
    space,
}

local fileinfo = {
    heirline.make_flexible_component(
        3,
        { folder_name, file_icon, file_name, file_lock_info, space, file_size },
        { folder_name, file_icon, file_name, file_lock_info },
        { folder_name, file_name },
        { file_name }
    ),
}

local locallist = {
    provider = util.locallist_count,
    condition = function()
        return #vim.fn.getloclist(0) > 0
    end,
    hl = {
        fg = colors.purple,
    },
}

local cursor_location = {
    {
        provider = '%l/%L|%c ',
        hl = {
            bold = true,
        },
    },
    {
        provider = ' %P',
        hl = function(self)
            return {
                fg = util.mode_color(self.mode),
                bg = colors.mid_bg,
            }
        end,
    },
}
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
    heirline.surround({ ' ', ' ' }, colors.statusline_bg, fileinfo),
}

local active_right_segment = {
    condition = function()
        return vim.fn.expand('%:t') ~= ''
    end,
    hl = {
        fg = colors.grey_fg,
    },
    {
        static = {
            icon = '  ',
        },
        condition = conditions.lsp_attached,
        heirline.make_flexible_component(2, {
            {
                provider = function(self)
                    return self.icon .. util.lsp_client_names()
                end,
            }, -- { provider = util.get_lsp_progress },
        }, {
            {
                provider = function(self)
                    return self.icon .. util.lsp_client_names()
                end,
            },
        }, null),
    },

    { -- Diagnostics {{{
        condition = conditions.has_diagnostics,

        static = {
            error_icon = '  ',
            warn_icon = '  ',
            info_icon = '  ',
            hint_icon = '  ',
        },

        init = function(self)
            self.errors = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.ERROR,
            })
            self.warnings = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.WARN,
            })
            self.hints = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.HINT,
            })
            self.info = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.INFO,
            })
        end,

        {
            provider = function(self)
                return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
            end,
            hl = {
                fg = colors.diag.error,
            },
        },
        {
            provider = function(self)
                return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
            end,
            hl = {
                fg = colors.diag.warn,
            },
        },
        {
            provider = function(self)
                return self.info > 0 and (self.info_icon .. self.info .. ' ')
            end,
            hl = {
                fg = colors.diag.info,
            },
        },
        {
            provider = function(self)
                return self.hints > 0 and (self.hint_icon .. self.hints)
            end,
            hl = {
                fg = colors.diag.hint,
            },
        },
    },

    { -- Spell check {{{
        provider = ' 暈',
        condition = function()
            return vim.wo.spell
        end,
        hl = {
            fg = colors.yellow,
            bold = true,
        },
    },

    heirline.make_flexible_component(-- Filetype {{{
        2,
        {
            hl = function(self)
                return {
                    fg = self.icon_color,
                    bold = true,
                }
            end,
            space,
            {
                provider = function(self)
                    return self.icon or ''
                end,
            },
            space,
            {
                provider = function()
                    return vim.bo.filetype
                end,
            },
        },
        null
    ),

    space,
    {
        provider = util.search_results,
    },

    space,
    { -- Cursor Location {{{
        hl = function(self)
            return {
                fg = colors.light_bg,
                bg = util.mode_color(self.mode),
            }
        end,
        {
            provider = icons.left_rounded,
            hl = function(self)
                return {
                    fg = util.mode_color(self.mode),
                    bg = colors.light_bg,
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
}

local active_status_line = {
    condition = conditions.is_active,
    hl = {
        fg = heirline.get_highlight('StatusLine').fg,
        bg = heirline.get_highlight('StatusLine').bg,
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
        fileinfo,
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

local help_file_name = {
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

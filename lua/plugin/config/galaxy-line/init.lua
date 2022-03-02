-- https://github.com/CosmicNvim/CosmicNvim
local galaxy = require('galaxyline')
local gls = galaxy.section
local diag = require('galaxyline.providers.diagnostic')
local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.providers.fileinfo')
local u = require("plugin.config.galaxy-line.util")

-- local theme = require('catppuccin.core.color_palette')
-- local colors = {
--     white = theme.white,
--     bg = theme.gray2,
--     bg_highlight = theme.black4,
--     normal = theme.maroon,
--     insert = theme.pink,
--     command = theme.red,
--     visual = theme.yellow,
--     replace = theme.flamingo,
--     diffAdd = theme.blue,
--     diffModified = theme.teal,
--     diffDeleted = theme.red,
--     trace = theme.red,
--     hint = theme.white,
--     info = theme.teal,
--     error = theme.flamingo,
--     warn = theme.red,
--     floatBorder = theme.black4,
--     selection_caret = theme.maroon,
-- }
-- local theme_colors = require('kanagawa.colors').setup()

-- local colors = {
--   white = theme_colors.fujiWhite,
--   bg = theme_colors.sumiInk0,
--   bg_highlight = theme_colors.sumiInk2,
--   normal = theme_colors.sumiInk4,
--   insert = theme_colors.waveBlue2,
--   command = theme_colors.boatYellow2,
--   visual = theme_colors.dragonBlue,
--   replace = theme_colors.autumnRed,
--   diffAdd = theme_colors.autumnGreen,
--   diffModified = theme_colors.autumnYellow,
--   diffDeleted = theme_colors.autumnRed,
--   trace = theme_colors.surimiOrange,
--   hint = theme_colors.dragonBlue,
--   info = theme_colors.waveAqua1,
--   error = theme_colors.samuraiRed,
--   warn = theme_colors.roninYellow,
--   floatBorder = theme_colors.sumiInk4,
--   selection_caret = theme_colors.oniViolet,
-- }
  local theme_colors = {
    -- Background Colors
    bg = '#22272e',
    bg2 = '#1e2228',

    -- foreground colors
    fg = '#adbac7',
    fg_dark = '#636e7b',
    fg_gutter = '#768390',
    fg_light = '#adbac7',
    fg_term = '#768390',

    -- Background Highlights Colors
    bg_highlight = '#2d333b',
    bg_search = '#3f3e30',
    -- bg_visual = '#444c56',
    bg_visual_selection = '#264466',
    border = '#444c56',

    -- Cursor & LineNumber Colors
    cursor = '#6cb6ff',
    cursor_line_nr = '#adbac7',
    line_nr = '#768390',

    -- LSP & Diagnostic Colors
    error = '#e5534b',
    -- warning = '#cca700',
    -- info = '#75beff',
    -- hint = '#eeeeb3',
    lsp = { ref_txt = '#28575d' },

    -- Auto-Complication Colors
    pmenu = { bg = '#2d333b', sbar = '#363b44' },

    -- Git & Diff Colors
    git = {
      add = '#6bc46d',
      change = '#daaa3f',
      delete = '#b34642',
      conflict = '#daaa3f',
      ignore = '#545d68',
      --   renamed = '#73c991',
    },
    -- diff = {
    --   add = '#293d34',
    --   add_fg = '#6bc46d',
    --   change = '#452700',
    --   change_fg = '#daaa3f',
    --   delete = '#432b30',
    --   delete_fg = '#e5534b',
    -- },

    -- Syntax Colors
    syntax = {
      comment = '#768390',
      constant = '#6cb6ff',
      string = '#96d0ff',
      variable = '#6cb6ff',
      keyword = '#f47067',
      func = '#dcbdfb',
      func_param = '#adbac7',
      match_paren_bg = '#266a70',
      tag = '#8ddb8c',
      html_arg = '#ff938a',
      param = '#f69d50',
      json_label = '#6cb6ff',
    },

    -- Terminal Colors
    -- orange = '#d18616',
    black = '#545d68',
    bright_black = '#636e7b',
    white = '#909dab',
    bright_white = '#cdd9e5',
    red = '#f47067',
    bright_red = '#ff938a',
    green = '#57ab5a',
    bright_green = '#6bc46d',
    yellow = '#c69026',
    bright_yellow = '#daaa3f',
    blue = '#539bf5',
    bright_blue = '#6cb6ff',
    magenta = '#b083f0',
    bright_magenta = '#dcbdfb',
    cyan = '#39c5cf',
    bright_cyan = '#56d4dd',

    -- Plugin Colors
    git_signs = { add = '#2b6a30', change = '#966600', delete = '#ad2e2c' },
  }
  local colors = {
    white = theme_colors.bright_white,
    bg = theme_colors.bg,
    bg_highlight = theme_colors.bg_highlight,
    normal = theme_colors.blue,
    insert = theme_colors.green,
    command = theme_colors.bright_magenta,
    visual = theme_colors.yellow,
    replace = theme_colors.red,
    diffAdd = theme_colors.git.add,
    diffModified = theme_colors.git.change,
    diffDeleted = theme_colors.git.delete,
    trace = theme_colors.orange,
    hint = theme_colors.hint,
    info = theme_colors.info,
    error = theme_colors.error,
    warn = theme_colors.warn,
    floatBorder = theme_colors.border,
    selection_caret = theme_colors.magenta,
  }
local set_highlight = function(hi, colors)
    local hi_str = ''

    for k, v in pairs(colors) do
        hi_str = hi_str .. k .. '=' .. v .. ' '
    end

    vim.cmd(('hi %s %s'):format(hi, hi_str))
end
local icons = {
    rounded_left_filled = '',
    rounded_right_filled = '',
    arrow_left_filled = '', -- e0b2
    arrow_right_filled = '', -- e0b0
    arrow_left = '', -- e0b3
    arrow_right = '', -- e0b1
    ghost = '',
    star = '★',
    scorpio = '♏︎',
    rocket = '🚀',
    warn = '',
    info = '',
    error = '',
    hint = '',
    perf = ' ',
    note = '',
    branch = '',
    file = '',
    dotdotdot = '…',
    information = '',
    symlink = '',
    line_number = '',
    debug = ' ',
    flame = ' ',
    check = ' ',
    trace = '✎',
    file1 = '',
    file2 = '',
    clock = '',
    word = '',
    diff_add = ' ',
    diff_modified = ' ',
    diff_remove = ' ',
    main = "💫",
    vs = ''
}

local main_icon = icons.main

local get_mode = function()
    local mode_colors = {
        [110] = {'NORMAL', colors.normal, colors.bg_highlight},
        [105] = {'INSERT', colors.insert, colors.bg_highlight},
        [99] = {'COMMAND', colors.command, colors.bg_highlight},
        [116] = {'TERMINAL', colors.normal, colors.bg_highlight},
        [118] = {'VISUAL', colors.visual, colors.bg_highlight},
        [22] = {'V-BLOCK', colors.visual, colors.bg_highlight},
        [86] = {'V-LINE', colors.visual, colors.bg_highlight},
        [82] = {'REPLACE', colors.replace, colors.bg_highlight},
        [115] = {'SELECT', colors.replace, colors.bg_highlight},
        [83] = {'S-LINE', colors.replace, colors.bg_highlight}
    }

    local mode_data = mode_colors[vim.fn.mode():byte()]
    if mode_data ~= nil then
        return mode_data
    end
end

local check_git_and_buffer = function()
    return condition.check_git_workspace() and condition.buffer_not_empty()
end

local check_buffer_and_width = function()
    return condition.buffer_not_empty() and condition.hide_in_width()
end

local FilePathShortProvider = function()
    local fp = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.:h')
    local tbl = u.split(fp, '/')
    local len = #tbl

    if len > 2 and tbl[1] ~= '~' then
        return icons.dotdotdot .. '/' .. table.concat(tbl, '/', len - 1) .. '/'
    else
        return fp .. '/'
    end
end

local LineColumnProvider = function()
    local line_column = fileinfo.line_column()
    line_column = line_column:gsub('%s+', '')
    return ' ' .. icons.line_number .. line_column
end

local PercentProvider = function()
    local line_column = fileinfo.current_line_percent()
    line_column = line_column:gsub('%s+', '')
    return line_column .. ' ☰ '
end

local BracketProvider = function(icon, cond)
    return function()
        local result

        if type(cond) == 'boolean' then
            result = cond
        else
            result = cond()
        end

        if result == nil then
            return
        end

        if type(result) == 'number' then
            if result > 0 then
                return icon
            end
        end

        if type(result) == 'boolean' and result == true then
            return icon
        end

        if type(result) == 'string' then
            if #result > 0 then
                return icon
            end
        end
    end
end

galaxy.short_line_list = {'packer', 'NvimTree', 'floaterm', 'fugitive', 'fugitiveblame'}

gls.left = {{
    Ghost = {
        provider = BracketProvider(main_icon, true),
        highlight = 'GalaxyViModeInv'
    }
}, {
    ViModeLeftBracket = {
        provider = BracketProvider(icons.arrow_right_filled, true),
        highlight = 'GalaxyViMode'
    }
}, {
    ViMode = {
        provider = function()
            local m = get_mode()
            if m == nil then
                return
            end

            local label, mode_color, mode_nested = unpack(m)
            set_highlight('GalaxyViMode', {
                guibg = mode_color,
                guifg = mode_nested
            })
            set_highlight('GalaxyViModeInv', {
                guibg = mode_nested,
                guifg = mode_color
            })
            set_highlight('GalaxyViModeNested', {
                guibg = mode_nested,
                guifg = 'StatusLine'
            })
            set_highlight('GalaxyViModeNestedInv', {
                guibg = 'StatusLine',
                guifg = mode_nested
            })
            set_highlight('GalaxyPercentBracket', {
                guibg = 'StatusLine',
                guifg = mode_color
            })
            set_highlight('GalaxyGitLCBracket', {
                guibg = mode_nested,
                guifg = mode_color
            })

            if condition.buffer_not_empty() then
                set_highlight('GalaxyViModeBracket', {
                    guibg = mode_nested,
                    guifg = mode_color
                })
            else
                if condition.check_git_workspace() then
                    set_highlight('GalaxyGitLCBracket', {
                        guibg = 'StatusLine',
                        guifg = mode_color
                    })
                end
                set_highlight('GalaxyViModeBracket', {
                    guibg = 'StatusLine',
                    guifg = mode_color
                })
            end
            return '  ' .. label .. ' '
        end
    }
}, {
    ViModeBracket = {
        provider = BracketProvider(icons.arrow_right_filled, true),
        highlight = 'GalaxyViModeBracket'
    }
}, {
    GitIcon = {
        provider = BracketProvider('  ' .. icons.branch .. ' ', true),
        condition = check_git_and_buffer,
        highlight = 'GalaxyViModeInv'
    }
}, {
    GitBranch = {
        provider = function()
            local vcs = require('galaxyline.providers.vcs')
            local branch_name = vcs.get_git_branch()
            if not branch_name then
                return ' no git '
            end
            if string.len(branch_name) > 28 then
                return string.sub(branch_name, 1, 25) .. icons.dotdotdot
            end
            return branch_name .. ' '
        end,
        condition = check_git_and_buffer,
        highlight = 'GalaxyViModeInv',
        separator = icons.arrow_right,
        separator_highlight = 'GalaxyViModeInv'
    }
}, {
    FileIcon = {
        provider = function()
            local icon = fileinfo.get_file_icon()
            if condition.check_git_workspace() then
                return ' ' .. icon
            end

            return '  ' .. icon
        end,
        condition = condition.buffer_not_empty,
        highlight = 'GalaxyViModeInv'
    }
}
-- , {
--     FilePath = {
--         provider = FilePathShortProvider,
--         condition = check_buffer_and_width,
--         highlight = 'GalaxyViModeInv'
--     }
-- }
, {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = 'GalaxyViModeInv',
        separator = icons.arrow_right_filled,
        separator_highlight = 'GalaxyViModeNestedInv'
    }
}, {
    DiffAdd = {
        provider = 'DiffAdd',
        icon = ' ' .. icons.diff_add,
        condition = check_git_and_buffer,
        highlight = {colors.diffAdd, 'StatusLine'}
    }
}, {
    DiffModified = {
        provider = 'DiffModified',
        condition = check_git_and_buffer,
        icon = ' ' .. icons.diff_modified,
        highlight = {colors.diffModified, 'StatusLine'}
    }
}, {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = check_git_and_buffer,
        icon = ' ' .. icons.diff_remove,
        highlight = {colors.diffDeleted, 'StatusLine'}
    }
}}

gls.right = { -- Error
{
    DiagnosticErrorLeftBracket = {
        provider = BracketProvider(icons.rounded_left_filled, diag.get_diagnostic_error),
        highlight = 'DiagnosticError',
        condition = condition.buffer_not_empty
    }
}, {
    DiagnosticError = {
        provider = diag.get_diagnostic_error,
        highlight = 'DiagnosticErrorInv',
        icon = '  ' .. icons.error .. ' ',
        condition = condition.buffer_not_empty
    }
}, {
    DiagnosticErrorRightBracket = {
        provider = BracketProvider(icons.rounded_right_filled .. ' ', diag.get_diagnostic_error),
        highlight = 'DiagnosticError',
        condition = condition.buffer_not_empty
    }
}, -- Warning
{
    DiagnosticWarnLeftBracket = {
        provider = BracketProvider(icons.rounded_left_filled, diag.get_diagnostic_warn),
        highlight = 'DiagnosticWarn',
        condition = condition.buffer_not_empty
    }
}, {
    DiagnosticWarn = {
        provider = diag.get_diagnostic_warn,
        highlight = 'DiagnosticWarnInv',
        icon = '  ' .. icons.warn .. ' ',
        condition = condition.buffer_not_empty
    }
}, {
    DiagnosticWarnRightBracket = {
        provider = BracketProvider(icons.rounded_right_filled .. ' ', diag.get_diagnostic_warn),
        highlight = 'DiagnosticWarn',
        condition = condition.buffer_not_empty
    }
}, -- Hint
{
    DiagnosticHintLeftBracket = {
        provider = BracketProvider(icons.rounded_left_filled, diag.get_diagnostic_hint),
        highlight = 'DiagnosticHint',
        condition = condition.buffer_not_empty
    }
}, {
    DiagnosticHint = {
        provider = diag.get_diagnostic_hint,
        icon = '  ' .. icons.hint .. ' ',
        highlight = 'DiagnosticHintInv',
        condition = condition.buffer_not_empty
    }
}, {
    DiagnosticHintRightBracket = {
        provider = BracketProvider(icons.rounded_right_filled .. ' ', diag.get_diagnostic_hint),
        highlight = 'DiagnosticHint',
        condition = condition.buffer_not_empty
    }
}, -- Git
{
    GitBranchRightBracket = {
        provider = BracketProvider(icons.arrow_left_filled, true),
        condition = check_buffer_and_width,
        highlight = 'GalaxyViModeNestedInv'
    }
}
, {
    LSPStatus = {
        provider = function()
            local clients = u.get_active_lsp_client_names()
            local client_str = ''

            if #clients < 1 then
                return client_str
            end

            for i, client in ipairs(clients) do
                client_str = client_str .. client
                if i < #clients then
                    client_str = client_str .. ', '
                end
            end

            if client_str:len() < 1 then
                return
            end

            return ' ' .. client_str
        end,
        highlight = 'GalaxyViModeInv',
        condition = check_buffer_and_width
    }
}
, {
    LSPStatusArrow = {
        provider = BracketProvider('  ' .. icons.arrow_left, true),
        highlight = 'GalaxyViModeInv',
        condition = check_buffer_and_width
    }
}

, -- Editor info
{
    LineColumn = {
        provider = {LineColumnProvider, function()
            return ' '
        end},
        highlight = 'GalaxyViMode',
        separator = icons.arrow_left_filled,
        separator_highlight = 'GalaxyGitLCBracket'
    }
}, {
    PerCent = {
        provider = {PercentProvider},
        highlight = 'GalaxyViMode',
        separator = icons.arrow_left .. ' ',
        separator_highlight = 'GalaxyViModeLeftBracket'
    }
}}

gls.short_line_left = {{
    GhostLeftBracketShort = {
        provider = BracketProvider(icons.rounded_left_filled, true),
        highlight = {colors.white, 'StatusLine'}
    }
}, {
    GhostShort = {
        provider = BracketProvider(main_icon, true),
        highlight = {'StatusLine', colors.white}
    }
}, {
    GhostRightBracketShort = {
        provider = BracketProvider(icons.rounded_right_filled, true),
        highlight = {colors.white, 'StatusLine'}
    }
}, {
    FileIconShort = {
        provider = {function()
            return '  '
        end, 'FileIcon'},
        condition = function()
            return condition.buffer_not_empty() and vim.bo.filetype ~= 'NvimTree'
        end,
        highlight = {require('galaxyline.providers.fileinfo').get_file_icon, 'StatusLine'}
    }
}
, {
    FilePathShort = {
        provider = FilePathShortProvider,
        condition = function()
            return condition.buffer_not_empty() and vim.bo.filetype ~= 'NvimTree'
        end,
        highlight = {colors.white, 'StatusLine'}
    }
}
, {
    FileNameShort = {
        provider = 'FileName',
        condition = function()
            return condition.buffer_not_empty() and vim.bo.filetype ~= 'NvimTree'
        end,
        highlight = {colors.white, 'StatusLine'}
    }
}}

gls.short_line_right = {{
    GitRootShortLeftBracket = {
        provider = BracketProvider(icons.arrow_left_filled, true),
        condition = condition.buffer_not_empty,
        highlight = {colors.white, 'StatusLine'}
    }
}

, {
    GitRootShortRightBracket = {
        provider = BracketProvider(icons.rounded_right_filled, true),
        condition = condition.buffer_not_empty,
        highlight = {colors.white, 'StatusLine'}
    }
}}

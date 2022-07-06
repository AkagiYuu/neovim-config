local colors = require('plugins.config.heirline.colors')
local M = {}

local mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'skyblue',
    LINES = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow',
}

local mode_names = {
    n = { 'Normal', '' },
    no = { 'Op·Pending', '' },
    nov = { 'Op·Pending', '' },
    noV = { 'Op·Pending', '' },
    niI = { '(Normal)', '' },
    niR = { '(Normal)', '' },
    niV = { '(Normal)', '' },
    nt = { 'Normal', '' },
    v = { 'Visual', '' },
    V = { 'V·Line', '' },
    [''] = { 'V·Block', '' },
    s = { 'Select', '' },
    S = { 'S·Line', '' },
    [''] = { 'S·Block', '' },
    i = { 'Insert', '' },
    ic = { 'Ins·Compl', 'C' },
    ix = { 'Ins·Compl', 'X' },
    R = { 'Replace', '' },
    Rv = { 'Replace', '' },
    Rx = { 'Replace', '' },
    c = { 'Command', '' },
    cv = { 'Vim·Ex', 'Q' },
    ce = { 'Ex', '-' },
    r = { 'Prompt', '-' },
    rm = { 'More', '-' },
    ['r?'] = { 'Confirm', '-' },
    ['!'] = { 'Shell', '' },
    t = { 'Terminal', '' },
    [''] = { 'Empty', '-' },
}

local mode_alias = {
    n = 'NORMAL',
    no = 'OP',
    nov = 'OP',
    noV = 'OP',
    ['no'] = 'OP',
    niI = 'NORMAL',
    niR = 'NORMAL',
    niV = 'NORMAL',
    nt = 'NORMAL',
    v = 'VISUAL',
    V = 'LINES',
    [''] = 'BLOCK',
    s = 'SELECT',
    S = 'SELECT',
    [''] = 'BLOCK',
    i = 'INSERT',
    ic = 'INSERT',
    ix = 'INSERT',
    R = 'REPLACE',
    Rc = 'REPLACE',
    Rv = 'V-REPLACE',
    Rx = 'REPLACE',
    c = 'COMMAND',
    cv = 'COMMAND',
    ce = 'COMMAND',
    r = 'ENTER',
    rm = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    t = 'TERM',
    ['null'] = 'NONE',
}

---Returns the designated colour for the mode.
---@param mode string
---@return string
function M.color(mode)
    return colors[ mode_colors[ mode_alias[mode] ] ]
end

---Return human-readable mode name.
---@param original string original mode name
---@return string
M.info = function(original)
    return mode_names[original] or { original, ''}
end

return M

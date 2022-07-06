local M = {}

local mode_colors = {
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


---Returns the designated colour for the mode.
---@param mode string
---@return string
function M.color(mode)
    return mode_colors[mode]
end

---Return human-readable mode name.
---@param original string original mode name
---@return string
M.info = function(original)
    return mode_names[original] or { original, '' }
end

return M

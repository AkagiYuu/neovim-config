local M = {}


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

---Return human-readable mode name.
---@param original string original mode name
---@return string
M.info = function(original)
    return mode_names[original] or { original, '' }
end

return M

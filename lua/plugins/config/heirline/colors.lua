local utils = require('heirline.utils')

require('heirline').load_colors {
    white = '#b5bcc9',
    red = utils.get_highlight('DiagnosticError').fg,
    red_dark = utils.get_highlight('DiffDelete').bg,
    green = utils.get_highlight('String').fg,
    green_pale = utils.get_highlight('DiagnosticHint').fg,
    blue = utils.get_highlight('Function').fg,
    nord_blue = utils.get_highlight('DiagnosticInfo').fg,
    grey = utils.get_highlight('NonText').fg,
    orange = utils.get_highlight('Constant').fg,
    purple = utils.get_highlight('Statement').fg,
    cyan = utils.get_highlight('Special').fg,
    yellow = utils.get_highlight('DiagnosticWarn').fg,
    -- folder = utils.get_highlight('NvimTreeFolderName').fg,

    short_bg = '#34393D',
    statusline_bg = '#181f26',
    light_bg = '#222930',
    mid_bg = '#2B3033',
}

return {
    diag = {
        warn = utils.get_highlight('DiagnosticWarn').fg,
        error = utils.get_highlight('DiagnosticError').fg,
        hint = utils.get_highlight('DiagnosticHint').fg,
        info = utils.get_highlight('DiagnosticInfo').fg,
    },
    git = {
        del = utils.get_highlight('GitSignsDelete').fg,
        add = utils.get_highlight('GitSignsAdd').fg,
        change = utils.get_highlight('GitSignsChange').fg,
    },
}

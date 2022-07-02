local utils = require('heirline.utils')

return {
    white = '#b5bcc9',
    grey_fg = '#737D87',
    short_bg = '#34393D',
    red = '#EF949C',
    red_dark = '#B34B4B',
    green = '#B0E5CA',
    green_pale = '#839C8F',
    nord_blue = '#9aa8cf',
    yellow = '#fbdf90',
    yellow_pale = '#B39E67',
    purple = '#9F78E1',
    statusline_bg = '#181f26',
    light_bg = '#222930',
    light_bg2 = '#1d242b',
    mid_bg = '#2B3033',
    orange = utils.get_highlight('DiagnosticWarn').fg,
    folder = utils.get_highlight('NvimTreeFolderName').fg,
    cyan = utils.get_highlight('Special').fg,
    diag = {
        warn = utils.get_highlight('DiagnosticWarn').fg,
        error = utils.get_highlight('DiagnosticError').fg,
        hint = utils.get_highlight('DiagnosticHint').fg,
        info = utils.get_highlight('DiagnosticInfo').fg,
    },
    git = {
        del = '#A3214C',
        add = '#3D5213',
        change = '#537196',
    },
}

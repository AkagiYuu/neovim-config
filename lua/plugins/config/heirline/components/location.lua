local location = {}

location.locallist = {
    provider = require('plugins.config.heirline.utils.misc').locallist_count,
    condition = function() return #vim.fn.getloclist(0) > 0 end,
    hl = { fg = 'purple' },
}

location.cursor = {
    {
        provider = '%l/%L|%c ',
        hl = { bold = true, },
    },
    {
        provider = ' %P',
        hl = function(self)
            return {
                fg = self:mode_color(),
                bg = 'mid_bg',
            }
        end,
    },
}

return location

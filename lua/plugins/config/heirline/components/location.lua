local location = {}
local locallist_count = require('plugins.config.heirline.modules.misc').locallist_count
local mode_color = require('plugins.config.heirline.modules.mode').color

location.locallist = function(colors)
    return {
        provider = locallist_count,
        condition = function()
            return #vim.fn.getloclist(0) > 0
        end,
        hl = {
            fg = colors.purple,
        },
    }
end

location.cursor = function(colors)
    return {
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
                    fg = mode_color(self.mode),
                    bg = colors.mid_bg,
                }
            end,
        },
    }
end

return location

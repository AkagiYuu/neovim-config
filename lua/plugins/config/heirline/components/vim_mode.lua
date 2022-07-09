local mode = require('plugins.config.heirline.utils.mode')

return function(seperators)
    return {
        hl = function(self)
            return {
                fg = self:mode_color(),
                bold = true,
            }
        end,
        {
            hl = function(self)
                return {
                    fg = 'statusline_bg',
                    bg = self:mode_color(),
                    bold = true,
                }
            end,
            provider = function(self)
                return ' ' .. mode.info(self.mode)[2] .. ' '
            end,
        },
        {
            provider = function(self)
                return seperators.right_filled .. '  %2(' .. mode.info(self.mode)[1] .. '%) '
            end,
        },
    }
end

local mode = require('plugins.config.heirline.utils.mode')

return function(seperators)
    return {
        hl = function(self)
            return {
                fg = mode.color(self.mode),
                bold = true,
            }
        end,
        {
            hl = function(self)
                return {
                    fg = 'statusline_bg',
                    bg = mode.color(self.mode),
                    bold = true,
                }
            end,
            provider = function(self)
                print(self.mode)
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

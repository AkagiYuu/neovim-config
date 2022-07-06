local mode = require('plugins.config.heirline.modules.mode')

return function(colors, icons)
    return {
        init = function(self)
            self.mode_ch = self.mode:sub(1, 1) -- get only the first mode character
        end,
        hl = function(self)
            return {
                fg = mode.color(self.mode_ch),
                bold = true,
            }
        end,
        {
            hl = function(self)
                return {
                    fg = colors.statusline_bg,
                    bg = mode.color(self.mode_ch),
                    bold = true,
                }
            end,
            provider = function(self)
                return ' ' .. mode.info(self.mode)[2] .. ' '
            end,
        },
        {
            provider = function(self)
                return icons.right_filled .. '  %2(' .. mode.info(self.mode)[1] .. '%) '
            end,
        },
    }
end

return function(seperators)
    return {
        static = {
            mode_names = {
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
            },
            mode_info = function(self) return self.mode_names[self.mode] or { self.mode, '' } end
        },
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
            provider = function(self) return ' ' .. self:mode_info()[2] .. ' ' end,
        },
        {
            provider = function(self) return seperators.right_filled .. '  %2(' .. self:mode_info()[1] .. '%) ' end,
        },
    }
end

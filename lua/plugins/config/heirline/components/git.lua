return function(heirline, conditions, colors)
    local git_count = require('plugins.config.heirline.utils.git').git_count
    local null = { provider = '' }

    return {
        condition = conditions.is_git_repo,

        init = function(self) self.git_status = vim.b.gitsigns_status_dict end,
        heirline.make_flexible_component(2,
            {
                {
                    provider = '  ',
                    hl = { fg = colors.git.add },
                },
                { provider = function(self) return self.git_status.head end },
            },
            null
        ),
        {
            condition = function(self)
                return self.has_changes == self.git_status.added ~= 0
                    or self.git_status.removed ~= 0
                    or self.git_status.changed ~= 0
            end,
            heirline.make_flexible_component(4,
                {
                    git_count('added', 'add', '  '),
                    git_count('removed', 'del', '  '),
                    git_count('changed', 'change', '  '),
                },
                {
                    git_count('removed', 'del', '  '),
                    git_count('changed', 'change', '  ')
                },
                { git_count('removed', 'del', '  ') },
                null
            ),
        },
    }
end

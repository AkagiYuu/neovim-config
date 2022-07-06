local git = require('plugins.config.heirline.modules.git')
return function(heirline, conditions, colors)

    local null = {
        provider = '',
    }

    return {
        condition = conditions.is_git_repo,

        init = function(self)
            self.status_dict = vim.b.gitsigns_status_dict
        end,
        heirline.make_flexible_component(2, {
            {
                provider = '  ',
                hl = {
                    fg = colors.git.add,
                },
            },
            {
                provider = function(self)
                    return self.status_dict.head
                end,
            },
        }, null),
        {
            condition = function(self)
                return self.has_changes == self.status_dict.added ~= 0
                    or self.status_dict.removed ~= 0
                    or self.status_dict.changed ~= 0
            end,
            heirline.make_flexible_component(
                4,
                {
                    git.git_count('added', 'add', '  '),
                    git.git_count('removed', 'del', '  '),
                    git.git_count('changed', 'change', '  '),
                },
                { git.git_count('removed', 'del', '  '), git.git_count('changed', 'change', '  ') },
                { git.git_count('removed', 'del', '  ') },
                null
            ),
        },
    }
end

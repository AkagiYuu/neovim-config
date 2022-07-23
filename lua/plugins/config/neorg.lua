require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
        ['core.norg.concealer'] = {
            config = {
                dim_code_blocks = {
                    enabled = true,
                    content_only = true,
                    adaptive = true,
                },
                icon_preset = 'diamond'
            }
        },
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    notes = '~/Idea',
                },
                autochdir = true, -- Automatically change the directory to the current workspace's root every time
                index = 'main.norg', -- The name of the main (root) .norg file
            }
        },
        ['core.presenter'] = { config = { zen_mode = 'truezen' } }
    }
}

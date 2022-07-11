require('nvim-tree').setup {
    hijack_cursor = true,
    filesystem_watchers = {
        enable = true,
    },
    view = {
        side = 'right',
        preserve_window_proportions = true,
        signcolumn = 'no',
    },
    renderer = {
        highlight_opened_files = 'name',
        group_empty = true,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = { git_placement = 'after' }
    },
}

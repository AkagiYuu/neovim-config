require('nvim-tree').setup {
    hijack_cursor = true,
    filesystem_watchers = {
        enable = true,
    },
    view = {
        side = 'right',
        preserve_window_proportions = true,
    },
    renderer = {
        highlight_opened_files = 'name',
        group_empty = true,
        highlight_git = true,
        -- icons = {
        -- 	glyphs = {
        -- 		default = get("file"),
        -- 		symlink = get("file-symlink-file"),
        -- 		folder = {
        -- 			default = get("file-directory-fill"),
        -- 			open = get("file-directory-open-fill"),
        -- 			symlink = get("file-directory-fill"),
        -- 			symlink_open = get("file-directory-open-fill"),
        -- 			empty = get("file-directory-open-fill"),
        -- 			empty_open = get("file-directory-open-fill"),
        -- 			arrow_open = get("chevron-down"),
        -- 			arrow_closed = get("chevron-right"),
        -- 		},
        -- 	}
        -- }
    },
}

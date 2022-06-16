require("nvim-tree").setup({
	hijack_cursor = true,
	filesystem_watchers = {
		enable = true,
	},
	view = {
		side = "right",
		preserve_window_proportions = true,
	},
	renderer = {
		highlight_opened_files = "name",
		group_empty = true,
		highlight_git = true,
	},
})

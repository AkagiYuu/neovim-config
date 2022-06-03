require("nvim-tree").setup({
	hijack_cursor = true,
	renderer = {
		highlight_opened_files = "name",
		group_empty = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	},
})

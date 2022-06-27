require("which-key").setup {
	popup_mappings = {
		scroll_down = "<Down>",
		scroll_up = "<Up>",
	},
	window = { border = "rounded" },
	plugins = {
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
	}
}

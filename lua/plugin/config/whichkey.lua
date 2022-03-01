require("which-key").setup({
	popup_mappings = {
		scroll_down = "<Down>", -- binding to scroll down inside the popup
		scroll_up = "<Up>", -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	ignore_missing = false,
})

local colors = {
	lightbg = "#4C566A",
	black = "#3B4252",
	red = "#BF616A",
	green = "#A3BE8C",
	yellow = "#EBCB8B",
	blue = "#81A1C1",
	purple = "#B48EAD",
	cyan = "#88C0D0",
	white = "#E5E9F0",
}
require("staline").setup({
	mode_colors = {
		n = colors.cyan,
		i = colors.blue,
		c = colors.yellow,
		v = colors.purple,
		V = colors.purple,
	},
	mode_icons = {
		n = " NORMAL",
		i = " INSERT",
		c = " COMMAND",
		v = " VISUAL",
		V = " VISUAL",
	},
})

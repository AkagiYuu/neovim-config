-- local colors = {
-- 	lightbg = "#4C566A",
-- 	black = "#3B4252",
-- 	red = "#BF616A",
-- 	green = "#A3BE8C",
-- 	yellow = "#EBCB8B",
-- 	blue = "#81A1C1",
-- 	purple = "#B48EAD",
-- 	cyan = "#88C0D0",
-- 	white = "#E5E9F0",
-- }
-- require("staline").setup({
-- 	defaults = {
-- 		left_separator = "",
-- 		right_separator = "",
-- 		full_path = false,
-- 		mod_symbol = "  ",
-- 		lsp_client_symbol = " ",
-- 		line_column = "[%l/%L] 並%p%% ", -- `:h stl` to see all flags.
-- 		fg = "#000000", -- Foreground text color.
-- 		bg = "none", -- Default background is transparent.
-- 		inactive_color = "#303030",
-- 		inactive_bgcolor = "none",
-- 		true_colors = false, -- true lsp colors.
-- 		font_active = "none", -- "bold", "italic", "bold,italic", etc
-- 		branch_symbol = " ",
-- 	},
-- 	mode_colors = {
-- 		n = colors.cyan,
-- 		i = colors.blue,
-- 		c = colors.yellow,
-- 		v = colors.purple,
-- 		V = colors.purple,
-- 	},
-- 	mode_icons = {
-- 		n = " NORMAL",
-- 		i = " INSERT",
-- 		c = " COMMAND",
-- 		v = " VISUAL",
-- 		V = " VISUAL",
-- 	},
-- 	sections = {
-- 		left = { "-mode", "left_sep_double", "", "branch" },
-- 		mid = { "file_name" },
-- 		right = { "right_sep_double", "-line_column" },
-- 	},
-- 	special_table = {
-- 		NvimTree = { "NvimTree", " " },
-- 		packer = { "Packer", " " },
-- 	},
-- 	lsp_symbols = {
-- 		Error = " ",
-- 		Info = " ",
-- 		Warn = " ",
-- 		Hint = "",
-- 	},
-- })
require("staline").setup({
	sections = {
		left = {
			"▊",
			" ",
			{ "Evil", " " },
			" ", -- The mode and evil sign
			"file_size",
			" ", -- Filesize
			{ "StalineFile", "file_name" },
			" ", -- Filename in different highlight
		},
		mid = { "lsp_name" }, -- "lsp_name" is still a little buggy
		right = {
			{ "StalineEnc", vim.bo.fileencoding:upper() },
			"  ", -- Example for custom section
			{ "StalineEnc", "cool_symbol" },
			" ", -- the cool_symbol for your OS
			{ "StalineGit", "branch" },
			" ",
			"▊", -- Branch Name in different highlight
		},
	},
	defaults = {
		bg = "#202328",
		branch_symbol = " ",
	},
	mode_colors = {
		n = "#38b1f0",
		i = "#9ece6a", -- tc mode
	},
})
vim.cmd([[
    hi Evil        guifg=#f36365 guibg=#202328
    hi StalineEnc  guifg=#7d9955 guibg=#202328
    hi StalineGit  guifg=#8583b3 guibg=#202328
    hi StalineFile guifg=#c37cda guibg=#202328
]])

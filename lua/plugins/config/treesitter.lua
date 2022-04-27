require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indentation = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	},
	autotag = {
		enable = true,
	},
})

vim.g.neon_style = "doom"
vim.g.neon_transparent = true
vim.g.neon_italic_comment = false
vim.g.neon_bold = true
--
-- vim.cmd([[colorscheme neon]])
local catppuccin = require("catppuccin") --Change CursorLine in mapper.lua

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	styles = {
		comments = "NONE",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "italic",
	},
	integrations = {
		treesitter = true,
		lsp_trouble = true,
		lsp_saga = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		lightspeed = true,
	},
})
catppuccin.remap({CursorLine = {bg = "NONE"}})
vim.cmd([[colorscheme catppuccin]])
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "NONE",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,        -- do not set background color
    overrides = {
        CursorLine = { bg = "NONE" }
    },
})
-- vim.cmd("colorscheme kanagawa")
require('material').setup({

	italics = {
		comments = false, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},

	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
	},

	high_visibility = {
		darker = true -- Enable higher contrast text for darker style
	},

	disable = {
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
	},
	custom_highlights = {
        CursorLine = { bg = "NONE" }
    } -- Overwrite highlights with your own
})
vim.g.material_style = "deep ocean"
-- vim.cmd 'colorscheme material'

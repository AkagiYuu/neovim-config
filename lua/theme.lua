-- vim.g.neon_style = "doom"
-- vim.g.neon_transparent = true
-- vim.g.neon_italic_comment = false
-- vim.g.neon_bold = true
--
-- vim.cmd([[colorscheme neon]])
-- local catppuccin = require("catppuccin") --Change CursorLine in mapper.lua

-- catppuccin.setup({
-- 	transparent_background = true,
-- 	term_colors = true,
-- 	styles = {
-- 		comments = "NONE",
-- 		functions = "italic",
-- 		keywords = "italic",
-- 		strings = "NONE",
-- 		variables = "italic",
-- 	},
-- 	integrations = {
-- 		treesitter = true,
-- 		lsp_trouble = true,
-- 		lsp_saga = true,
-- 		nvimtree = {
-- 			enabled = true,
-- 			show_root = false,
-- 			transparent_panel = true,
-- 		},
-- 		indent_blankline = {
-- 			enabled = true,
-- 			colored_indent_levels = true,
-- 		},
-- 	},
-- })
-- catppuccin.remap({CursorLine = {bg = "NONE"}})
-- vim.cmd([[colorscheme catppuccin]])
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
vim.cmd("colorscheme kanagawa")

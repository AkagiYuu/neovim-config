local theme = vim.g.theme or "catppuccin"
require("theme." .. theme)

vim.cmd [[
	hi CursorLine guibg=NONE
	hi WhichKeyFloat guibg=NONE
	hi NormalFloat guibg=NONE
]]

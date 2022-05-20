-- local ok, catppuccin = pcall(require, "catppuccin")
-- if ok then
-- 	catppuccin.setup({
-- 		-- transparent_background = true,
-- 		term_colors = true,
-- 		styles = {
-- 			comments = "bold",
-- 			variables = "NONE",
-- 		},
-- 		integration = {
-- 			lsp_trouble = true,
-- 			lsp_saga = true,
-- 			which_key = true,
-- 			dashboard = false,
-- 			lightspeed = true,
-- 			ts_rainbow = true,
-- 		},
-- 	})
-- 	catppuccin.remap({ CursorLine = { bg = "NONE" } })
-- 	vim.cmd([[colorscheme catppuccin]])
-- end

vim.g.vscode_style = "dark"
-- Enable transparent background
vim.g.vscode_transparent = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
pcall(vim.cmd,[[colorscheme vscode]])

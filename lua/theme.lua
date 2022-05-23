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
if not vim.g.nvui then
	vim.g.vscode_transparent = 1
	vim.g.vscode_disable_nvimtree_bg = true
end
pcall(vim.cmd, [[colorscheme vscode]])

local ok, catppuccin = pcall(require, "catppuccin")
if ok then
	catppuccin.setup({
		transparent_background = true,
		term_colors = true,
		styles = {
			comments = "bold",
			variables = "NONE",
		},
		integration = {
			nvimtree = {
				enabled = true,
				show_root = true,
				transparent_panel = true,
			},
			lsp_trouble = true,
			lsp_saga = true,
			which_key = true,
			dashboard = false,
			lightspeed = true,
			ts_rainbow = true,
		},
	})
	catppuccin.remap({ CursorLine = { bg = "NONE" } })
	vim.g.catppuccin_flavour = "frappe"
	vim.cmd([[colorscheme catppuccin]])
end

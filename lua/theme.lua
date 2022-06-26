local ok, catppuccin = pcall(require, "catppuccin")
if ok then
    vim.g.catppuccin_flavour = "frappe"
	catppuccin.setup({
		transparent_background = true,
		term_colors = true,
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
	vim.cmd([[colorscheme catppuccin]])
end

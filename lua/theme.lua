local ok, catppuccin = pcall(require, "catppuccin")
local highlight = vim.api.nvim_set_hl

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
	vim.cmd([[colorscheme catppuccin]])
end

highlight(0, "CursorLine", { bg = "NONE" })
highlight(0, "WhichKeyFloat", { bg = "BLACK" })
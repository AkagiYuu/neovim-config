require("bufferline").setup({
	options = {
		max_name_length = 10,
		max_prefix_length = 15,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				highlight = "Directory",
			},
		},
		show_close_icon = false,
		persist_buffer_sort = true,
		enforce_regular_tabs = true,
	},
})

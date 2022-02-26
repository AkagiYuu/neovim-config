require("bufferline").setup({
	options = {
		numbers = function(opts)
			return string.format("%s", opts.id)
		end,
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		max_name_length = 18,
		max_prefix_length = 15,
        tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", text_align = "center", highlight = "Directory" },
		},
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = false,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = "id",
	},
})

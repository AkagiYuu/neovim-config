vim.cmd([[
 function! Quit_vim(a,b,c,d)
     qa
 endfunction
]])
require("bufferline").setup({
	options = {
		max_name_length = 10,
		max_prefix_length = 15,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", text_align = "center", highlight = "Directory" },
		},
		show_close_icon = false,
		persist_buffer_sort = true,
		enforce_regular_tabs = true,
		custom_areas = {
			right = function()
				return {
					{ text = "%@Quit_vim@ %X" },
				}
			end,
		},
	},
})

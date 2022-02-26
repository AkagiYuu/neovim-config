local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		-- file_sorter = require("telescope.sorters").get_fzy_sorter,
		-- prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		mappings = {
			n = {
				["<A-p>"] = action_layout.toggle_preview,
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
			},
			i = {
				["<A-p>"] = action_layout.toggle_preview,
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
				["<esc>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
})

telescope.load_extension("notify")

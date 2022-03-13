local telescope = require("telescope")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

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
	pickers = {
		commands = {
			layout_strategies = "vertical",
			layout_config = {
				prompt_position = "top",
				anchor = "N",
				height = function(_, _, max_lines)
					return math.min(max_lines, 20)
				end,
			},
		},
		keymaps = {
			layout_strategies = "vertical",
			layout_config = {
				prompt_position = "top",
				anchor = "N",
				height = function(_, _, max_lines)
					return math.min(max_lines, 20)
				end,
			},
		},
        lsp_references = {
            theme = "cursor"
        }
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("notify")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

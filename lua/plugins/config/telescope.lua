local telescope = require("telescope")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",

		mappings = {
			-- n = {
			-- 	["<A-p>"] = action_layout.toggle_preview,
			-- 	["<C-Up>"] = actions.preview_scrolling_up,
			-- 	["<C-Down>"] = actions.preview_scrolling_down,
			-- },
			i = {
				["<A-p>"] = action_layout.toggle_preview,
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
				["<Esc>"] = actions.close,
            },
		},
		preview = {
			timeout = 1000,
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

telescope.load_extension("file_browser")

local api = vim.api
local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local colors = {
	bg = "#282c34",
	fg = "#DCD7BA",
	yellow = "#DCA561",
	cyan = "#658594",
	darkblue = "#223249",
	green = "#98BB6C",
	orange = "#FFA066",
	violet = "#957FB8",
	magenta = "#D27E99",
	blue = "#7E9CD8",
	red = "#FF5D62",
}

local mode_colors = {
	NORMAL = colors.green,
	INSERT = colors.red,
	VISUAL = colors.magenta,
	OP = colors.green,
	BLOCK = colors.blue,
	REPLACE = colors.violet,
	["V-REPLACE"] = colors.violet,
	ENTER = colors.cyan,
	MORE = colors.cyan,
	SELECT = colors.orange,
	COMMAND = colors.orange,
	SHELL = colors.green,
	TERM = colors.green,
	NONE = colors.yellow,
}

local comps = {
	vi_mode = {
		left = {
			provider = function()
				return " " .. vi_mode_utils.get_vim_mode() .. " "
			end,
			hl = function()
				return {
					name = vi_mode_utils.get_mode_highlight_name(),
					bg = vi_mode_utils.get_mode_color(),
					fg = colors.bg,
				}
			end,
			right_sep = " ",
		},
		right = {
			-- provider = '▊',
			provider = "",
			hl = function()
				return {
					name = vi_mode_utils.get_mode_highlight_name(),
					fg = vi_mode_utils.get_mode_color(),
				}
			end,
			left_sep = " ",
			right_sep = " ",
		},
	},
	file = {
		info = {
			provider = {
				name = "file_info",
				opts = {
					type = "relative-short",
					file_readonly_icon = "  ",
					-- file_readonly_icon = '  ',
					-- file_readonly_icon = '  ',
					-- file_readonly_icon = '  ',
					-- file_modified_icon = '',
					file_modified_icon = "",
					-- file_modified_icon = 'ﱐ',
					-- file_modified_icon = '',
					-- file_modified_icon = '',
					-- file_modified_icon = '',
				},
			},
			hl = {
				fg = colors.blue,
				style = "bold",
			},
		},
		encoding = {
			provider = "file_encoding",
			left_sep = " ",
			hl = {
				fg = colors.violet,
				style = "bold",
			},
		},
		type = {
			provider = "file_type",
		},
		position = {
			provider = "position",
			left_sep = " ",
			hl = {
				fg = colors.cyan,
				-- style = 'bold'
			},
		},
	},
	line_percentage = {
		provider = "line_percentage",
		left_sep = " ",
		hl = {
			style = "bold",
		},
	},
	scroll_bar = {
		provider = "scroll_bar",
		left_sep = " ",
		hl = {
			fg = colors.blue,
			style = "bold",
		},
	},
	diagnos = {
		err = {
			provider = "diagnostic_errors",
			-- left_sep = ' ',
			enabled = function()
				return lsp.diagnostics_exist("Error")
			end,
			hl = {
				fg = colors.red,
			},
		},
		warn = {
			provider = "diagnostic_warnings",
			-- left_sep = ' ',
			enabled = function()
				return lsp.diagnostics_exist("Warn")
			end,
			hl = {
				fg = colors.yellow,
			},
		},
		info = {
			provider = "diagnostic_info",
			-- left_sep = ' ',
			enabled = function()
				return lsp.diagnostics_exist("Info")
			end,
			hl = {
				fg = colors.blue,
			},
		},
		hint = {
			provider = "diagnostic_hints",
			-- left_sep = ' ',
			enabled = function()
				return lsp.diagnostics_exist("Hint")
			end,
			hl = {
				fg = colors.cyan,
			},
		},
	},
	lsp = {
		name = {
			provider = "lsp_client_names",
			-- left_sep = ' ',
			right_sep = " ",
			icon = " ",
			--   icon = '慎',
			hl = {
				fg = colors.yellow,
			},
		},
	},
	git = {
		branch = {
			provider = "git_branch",
			icon = " ",
			left_sep = " ",
			hl = {
				fg = colors.violet,
				style = "bold",
			},
		},
		add = {
			provider = "git_diff_added",
			hl = {
				fg = colors.green,
			},
		},
		change = {
			provider = "git_diff_changed",
			hl = {
				fg = colors.orange,
			},
		},
		remove = {
			provider = "git_diff_removed",
			hl = {
				fg = colors.red,
			},
		},
	},
}

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[3], comps.diagnos.err)
table.insert(components.active[3], comps.diagnos.warn)
table.insert(components.active[3], comps.diagnos.hint)
table.insert(components.active[3], comps.diagnos.info)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)
table.insert(components.active[3], comps.vi_mode.right)

-- TreeSitter
-- local ts_utils = require("nvim-treesitter.ts_utils")
-- local ts_parsers = require("nvim-treesitter.parsers")
-- local ts_queries = require("nvim-treesitter.query")
--   table.insert(components.active[2], {
--     provider = function()
--       local node = require("nvim-treesitter.ts_utils").get_node_at_cursor()
--       return ("%d:%s [%d, %d] - [%d, %d]")
--         :format(node:symbol(), node:type(), node:range())
--     end,
--     enabled = function()
--       local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
--       return ok and ts_parsers.has_parser()
--     end
--   })

-- require'feline'.setup {}
require("feline").setup({
	colors = {
		bg = colors.bg,
		fg = colors.fg,
	},
	components = components,
	vi_mode_colors = mode_colors,
	force_inactive = {
		filetypes = { "packer", "NvimTree", "fugitive", "fugitiveblame" },
		buftypes = { "terminal" },
		bufnames = {},
	},
})
require('feline').winbar.setup()

local g = vim.g
g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_group_empty = 1
require("nvim-tree").setup({
	auto_close = true,
	hijack_cursor = true,
})

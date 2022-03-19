local g = vim.g
g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_group_empty = 1
require("nvim-tree").setup({
	auto_close = true,
	-- auto_reload_on_write = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
})

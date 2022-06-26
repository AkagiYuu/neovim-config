local map = vim.keymap.set

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, {
	desc = "Find files",
	silent = true,
})
map("n", "<C-f>", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, {
	desc = "Find in current buffer",
	silent = true,
})
map("n", "<C-p>", function()
	require("telescope.builtin").commands()
end, {
	desc = "Command list",
	silent = true,
})
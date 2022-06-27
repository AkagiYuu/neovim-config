local map = vim.keymap.set

map("n", "<F3>", ":NvimTreeToggle<cr>", {
	desc = "Toggle file tree",
	silent = true,
})

map("n", "<C-\\>", ":ToggleTerm<CR>", {
	silent = true,
	desc = "Open terminal",
})
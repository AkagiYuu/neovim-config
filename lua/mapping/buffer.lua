local map = vim.keymap.set

map("n", "<Tab>", ":CybuNext<cr>", {
	desc = "Go to next tab",
	silent = true,
})
map("n", "<S-Tab>", ":CybuPre<cr>", {
	desc = "Go to previous tab",
	silent = true,
})
map("n", "<C-T>", ":BufferLinePick<CR>", {
	silent = true,
	desc = "Pick a buffer",
})
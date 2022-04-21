local map = vim.keymap.set

map("x", "$", "g_", { silent = true })

-- Horizontal Scroll
map("n", "<C-Left>", "20zh")
map("n", "<C-Right>", "20zl")

-- Naivigate between window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<F3>", function()
	require("nvim-tree").toggle(false)
end, { desc = "Toggle file tree" })

-- Terminal
map("n", "<C-\\>", ":ToggleTerm<CR>")

-- Telescope
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<C-f>", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Find in current buffer" })
map("n", "<F1>", function()
	require("telescope.builtin").help_tags()
end, { desc = "Help" })
map("n", "<C-e>", function()
	require("telescope.builtin").file_browser()
end, { desc = "File browser" })
map({ "n", "i" }, "<S-F12>", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Find references" })
map("n", "<C-p>", function()
	require("telescope.builtin").commands()
end, { desc = "Command list" })

-- Buffer line
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<C-T>", ":BufferLinePick<CR>")
map("n", "<A-Right>", ":BufferLineMoveNext<CR>")
map("n", "<A-Left>", ":BufferLineMovePrev<CR>")

-- Lsp
map("n", "<C-F12>", function()
	vim.lsp.buf.implementation()
end, { desc = "Search for implementation" })
map("n", "<leader>gw", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "Print current workspace" })
map("n", "<F12>", function()
	vim.lsp.buf.definition()
end, { desc = "Search for definition" })

--Lspsaga
-- map("n", "<S-F12>", ":Lspsaga lsp_finder<CR>")
map("n", "<F2>", ":Lspsaga rename<cr>")
map("n", "ca", ":Lspsaga code_action<cr>")
map("n", "ca", ":<c-u>Lspsaga range_code_action<cr>")
map("n", "K", ":Lspsaga hover_doc<cr>")
map("n", "<leader>gs", ":Lspsaga signature_help<CR>")
map("n", "<leader>pd", ":Lspsaga preview_definition<CR>")

--Trouble
map("n", "<leader>xx", ":TroubleToggle<cr>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>")
map("n", "<leader>xq", ":TroubleToggle quickfix<cr>")
map("n", "<leader>xl", ":TroubleToggle loclist<cr>")
-- map("n", "gR", ":TroubleToggle lsp_references<cr>")

--Format
map("n", "<A-f>", function()
	vim.lsp.buf.formatting()
end, { desc = "Format" })
map("v", "<A-f>", function()
	vim.lsp.buf.range_formatting()
end, { desc = "Format" })

--Moving line
map("n", "<A-j>", ":m .+1<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

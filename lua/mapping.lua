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

--Resize window
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")

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
map("n", "<C-p>", function()
    require("telescope.builtin").commands()
end, { desc = "Command list" })

-- Buffer line
map("n", "<Tab>", function()
    require("cybu").cycle("next")
end)
map("n", "<S-Tab>", function()
    require("cybu").cycle("prev")
end)
map("n", "<C-T>", ":BufferLinePick<CR>")

-- Lsp
map("n", "<C-F12>", vim.lsp.buf.implementation, { desc = "Search for implementation" })
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Search for definition" })

--Lspsaga
map("n", "<S-F12>", function()
    require("lspsaga.provider").lsp_finder()
end)
map("n", "<F2>", function()
    require("lspsaga.rename").rename()
end, { desc = "Rename" })
map("n", "<A-cr>", function()
    require("lspsaga.codeaction").code_action()
end, { desc = "Code action" })
map("x", "<A-cr>", function()
    require("lspsaga.codeaction").range_code_action()
end, { desc = "Code action" })
map("n", "K", function()
    require("lspsaga.signaturehelp").signature_help()
end, { desc = "Signature help" })
map("n", "<leader>pd", function()
    require("lspsaga.provider").preview_definition()
end, { desc = "Preview definition" })

--Trouble
map("n", "<leader>xx", ":TroubleToggle<cr>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>")
map("n", "<leader>xq", ":TroubleToggle quickfix<cr>")
map("n", "<leader>xl", ":TroubleToggle loclist<cr>")

--Format
map("n", "<A-f>", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format" })
map("v", "<A-f>", vim.lsp.buf.range_formatting, { desc = "Format" })

--Moving line
map("n", "<A-j>", ":m .+1<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map( "i" , "<C-cr>", ":Copilot<CR>")

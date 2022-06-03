local map = vim.keymap.set

map("x", "$", "g_", { silent = true })

map("n", "<C-Left>", "20zh", {
    silent = true,
    desc = "Scroll left"
})
map("n", "<C-Right>", "20zl", {
    silent = true,
    desc = "Scroll right"
})

map("n", "<C-h>", "<C-w>h", {
    silent = true,
    desc = "Move to left window"
})
map("n", "<C-j>", "<C-w>j", {
    silent = true,
    desc = "Move to window below"
})
map("n", "<C-k>", "<C-w>k", {
    silent = true,
    desc = "Move to window above"
})
map("n", "<C-l>", "<C-w>l", {
    silent = true,
    desc = "Move to right window"
})

map("n", "<C-Up>", ":resize -2<CR>", { silent = true })
map("n", "<C-Down>", ":resize +2<CR>", { silent = true })

map("n", "<F3>", function()
    require("nvim-tree").toggle(false)
end, {
    desc = "Toggle file tree" ,
    silent = true
})

map("n", "<C-\\>", ":ToggleTerm<CR>", {
    silent = true,
    desc = "Open terminal"
})

-- Telescope
map("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, {
    desc = "Find files",
    silent = true
})
map("n", "<C-f>", function()
    require("telescope.builtin").current_buffer_fuzzy_find()
end, {
    desc = "Find in current buffer",
    silent = true
})
map("n", "<F1>", function()
    require("telescope.builtin").help_tags()
end, {
    desc = "Help",
    silent = true
})
map("n", "<C-p>", function()
    require("telescope.builtin").commands()
end, {
    desc = "Command list",
    silent = true
})

-- Buffer line
map("n", "<Tab>", function()
    require("cybu").cycle("next")
end, {
    desc = "Go to next tab",
    silent = true
})
map("n", "<S-Tab>", function()
    require("cybu").cycle("prev")
end, {
    desc = "Go to previous tab",
    silent = true
})
map("n", "<C-T>", ":BufferLinePick<CR>", {
    silent = true,
    desc = "Pick a buffer"
})

-- Lsp
map("n", "<C-F12>", vim.lsp.buf.implementation, {
    desc = "Search for implementation",
    silent = true
})
map("n", "<F12>", vim.lsp.buf.definition, {
    desc = "Search for definition",
    silent = true
})

--Lspsaga
map("n", "<S-F12>", function()
    require("lspsaga.provider").lsp_finder()
end, {
    desc = "Search for implementation and definition",
    silent = true
})
map("n", "<F2>", function()
    require("lspsaga.rename").rename()
end, {
    desc = "Rename",
    silent = true
})
map("n", "<A-cr>", function()
    require("lspsaga.codeaction").code_action()
end, {
    desc = "Code action",
    silent = true
})
map("x", "<A-cr>", function()
    require("lspsaga.codeaction").range_code_action()
end, {
    desc = "Code action",
    silent = true
})
map("n", "K", function()
    require("lspsaga.hover").render_hover_doc()
end, {
    desc = "Hover doc",
    silent = true
})
map("n", "<leader>sh", function()
    require("lspsaga.signaturehelp").signature_help()
end, {
    desc = "Signature help",
    silent = true
})
map("n", "<leader>pd", function()
    require("lspsaga.provider").preview_definition()
end, {
    desc = "Preview definition",
    silent = true
})

--Trouble
map("n", "<leader>d", ":TroubleToggle<cr>", {
    silent = true,
    desc = "Toggle diagnostics window"
})

--Format
map("n", "<A-f>", function()
    vim.lsp.buf.format({ async = true })
end, {
    desc = "Format",
    silent = true
})
map("v", "<A-f>", vim.lsp.buf.range_formatting, {
    desc = "Format",
    silent = true
})

map("n", "<A-j>", ":m .+1<CR>==", {
    silent = true,
    desc = "Move line down"
})
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {
    silent = true,
    desc = "Move line down"
})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {
    silent = true,
    desc = "Move line down"
})
map("n", "<A-k>", ":m .-2<CR>==", {
    silent = true,
    desc = "Move line up"
})
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {
    silent = true,
    desc = "Move line up"
})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", {
    silent = true,
    desc = "Move line up"
})

map( "i" , "<C-cr>", ":Copilot<CR>", {
    silent = true,
    desc = "Open copilot window"
})

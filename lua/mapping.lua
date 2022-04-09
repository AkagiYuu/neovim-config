local nvim_set_keymap = vim.api.nvim_set_keymap
local map = function(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true
	}
	-- if opts then
	-- 	options = vim.tbl_extend("force", options, opts)
	-- end
	nvim_set_keymap(mode, lhs, rhs, options)
end

map("x", "$", "g_")

-- Horizontal Scroll
map("n", "<C-Left>", "20zh")
map("n", "<C-Right>", "20zl")

-- Naivigate between window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<S-e>", ":NvimTreeToggle<CR>")
map("i", "<S-e>", ":NvimTreeToggle<CR>")

-- Terminal
-- map("n", "<C-\\>", ":ToggleTerm<CR>")
-- map("i", "<C-\\>", ":ToggleTerm<CR>")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<cr>")
map("n", "<F1>", ":Telescope help_tags<cr>")
map("n", "<C-e>", ":Telescope file_browser<cr>")
map("n", "<S-F12>", ":Telescope lsp_references<cr>")
map("n", "<C-p>", ":Telescope commands<cr>")

-- Buffer line
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<C-T>", ":BufferLinePick<CR>")
map("n", "<A-Right>", ":BufferLineMoveNext<CR>")
map("n", "<A-Left>", ":BufferLineMovePrev<CR>")

-- Lsp
map("n", "<C-F12>", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>gw", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<F12>", ":lua vim.lsp.buf.definition()<CR>")

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
map("n", "<A-f>", ":lua vim.lsp.buf.formatting_sync()<CR>")
map("v", "<A-f>", ":lua vim.lsp.buf.range_formatting()<CR>")

--Moving line
map("n", "<A-j>", ":m .+1<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
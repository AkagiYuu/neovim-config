local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("x", "$", "g_")

-- Horizontal Scroll
map("n", "<C-Left>", "20zh")
map("n", "<C-Right>", "20zl")

-- Fix search highlighting in the current buffer.
map("n", "i", ":noh<cr>i")

-- Naivigate between window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Terminal
map("n", "<C-leader>", ":ToggleTerm<CR>")
map("i", "<C-leader>", ":ToggleTerm<CR>")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
map("n", "<C-e>", ":Telescope file_browser<cr>")
map("n", "<leader>fc", ":Telescope colorscheme<cr>")

-- Buffer line
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<C-T>", ":BufferLinePick<CR>", { silent = true })
map("n", "<A-Right>", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "<A-Left>", ":BufferLineMovePrev<CR>", { silent = true })

-- Lsp
map("n", "<C-F12>", ":lua vim.lsp.buf.implementation()<CR>", { silent = true })
map("n", "<leader>gw", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { silent = true })
map("n", "<F12>", ":lua vim.lsp.buf.definition()<CR>", { silent = true })

--Lspsaga
map("n", "<leader>gh", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<F2>", ":Lspsaga rename<cr>", { silent = true })
map("n", "ca", ":Lspsaga code_action<cr>", { silent = true })
map("n", "ca", ":<c-u>Lspsaga range_code_action<cr>", { silent = true })
map("n", "K", ":Lspsaga hover_doc<cr>", { silent = true })
map("n", "<leader>gs", ":Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>pd", ":Lspsaga preview_definition<CR>", { silent = true })
map("n", "<leader>gd", ":Lspsaga show_line_diagnostics<CR>", { silent = true })
map("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })

--Snippets
map("i", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
map("s", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
map("i", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
map("s", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })

--Trouble
map("n", "<leader>xx", ":TroubleToggle<cr>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>")
map("n", "<leader>xq", ":TroubleToggle quickfix<cr>")
map("n", "<leader>xl", ":TroubleToggle loclist<cr>")
map("n", "gR", ":TroubleToggle lsp_references<cr>")

--Format
map("n", "<A-f>", ":lua vim.lsp.buf.formatting_sync()<CR>")
map("v", "<A-f>", ":lua vim.lsp.buf.range_formatting()<CR>")

--Moving line
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("s", "<A-j>", ":m '>+1<CR>gv=gv")
map("s", "<A-k>", ":m '<-2<CR>gv=gv")

-- Refactor
map("v", "<Leader>re", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>")
map("v", "<Leader>rf", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>")
map("v", "<Leader>ri", "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>")
map("v", "<Leader>rv", "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>")

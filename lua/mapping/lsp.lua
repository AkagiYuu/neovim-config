local map = vim.keymap.set

--#region Built-in
map("n", "<C-F12>", vim.lsp.buf.implementation, {
    desc = "Search for implementation",
    silent = true,
})
map("n", "<F12>", vim.lsp.buf.definition, {
    desc = "Search for definition",
    silent = true,
})
map("n", "<A-f>", function() vim.lsp.buf.format { async = true } end, {
    desc = "Format",
    silent = true,
})
map("v", "<A-f>", vim.lsp.buf.range_formatting, {
    desc = "Format",
    silent = true,
})
--#endregion


--#region Lspsaga
map("n", "<S-F12>", function() require 'lspsaga.provider'.lsp_finder() end, {
    desc = "Search for implementation and definition",
    silent = true,
})
map("n", "<F2>", function() require('lspsaga.rename').lsp_rename() end, {
    desc = "Rename",
    silent = true,
})
map("n", "<A-cr>", function() require('lspsaga.codeaction').code_action() end, {
    desc = "Code action",
    silent = true,
})
map("x", "<A-cr>", function() require('lspsaga.codeaction').range_code_action() end, {
    desc = "Code action",
    silent = true,
})
map("n", "K", function() require('lspsaga.hover').render_hover_doc() end, {
    desc = "Hover doc",
    silent = true,
})
map("n", "<leader>sh", function() require('lspsaga.signaturehelp').signature_help() end, {
    desc = "Signature help",
    silent = true,
})
map("n", "<leader>pd", function() require 'lspsaga.provider'.preview_definition() end, {
    desc = "Preview definition",
    silent = true,
})
--#endregion

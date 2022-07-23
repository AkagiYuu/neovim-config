vim.diagnostic.config {
    virtual_lines = true,
    virtual_text = false,
    update_in_insert = true,
    signs = true,
}

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

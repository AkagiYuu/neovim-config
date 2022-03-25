local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        formatting.stylua,
        diagnostics.codespell,
        codeactions.eslint_d,
    },
})

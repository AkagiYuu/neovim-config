local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
    sources = {
        formatting.uncrustify,
        formatting.stylua,
        formatting.ptop,
        diagnostics.codespell,
        diagnostics.write_good,
        codeactions.refactoring,
        codeactions.eslint_d,
        completion.spell
    },
})

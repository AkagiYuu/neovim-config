local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
        formatting.prettier,
        formatting.codespell,
        formatting.fish_indent,
		diagnostics.codespell,
        diagnostics.fish,
		codeactions.proselint,
	},
})

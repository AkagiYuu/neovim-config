local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		diagnostics.codespell,
		codeactions.eslint_d,
	},
})

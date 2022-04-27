-- https://github.com/glepnir/lspsaga.nvim/issues/145
require("lspsaga").init_lsp_saga({
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = false,
	},
})

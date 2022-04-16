local nvim_create_autocmd = vim.api.nvim_create_autocmd

nvim_create_autocmd("User", {
	command = "set scrolloff=7",
	pattern = "LightspeedLeave",
})

nvim_create_autocmd({
	"CursorHold",
	"FocusGained",
	"FocusLost",
}, {
	command = "checktime",
})

nvim_create_autocmd("InsertCharPre", {
	callback = function()
		require("plugins.config.lspsaga_config").lspsaga_open_signature_help()
	end,
})

nvim_create_autocmd("TermOpen", {
	command = "setlocal nonumber nospell",
	pattern = "term://*",
})

nvim_create_autocmd("QuitPre", {
	command = "wshada",
})

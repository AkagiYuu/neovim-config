local notify = require("notify")
local lsp_handler = require(... .. ".lsp_handler")

notify.setup({
	stages = "fade_in_slide_out",
	timeout = 1000,
	background_colour = "#000000",
})

vim.notify = notify

vim.lsp.handlers["$/progress"] = lsp_handler.progress
vim.lsp.handlers["window/showMessage"] = lsp_handler.show_message

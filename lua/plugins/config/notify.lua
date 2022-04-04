local notify = require("notify")

notify.setup({
	stages = "slide",
	render = "minimal",
	timeout = 3000,
	background_colour = "NONE",
})

vim.notify = notify

local notify = require("notify")

notify.setup({
	stages = "static",
	render = "minimal",
	timeout = 3000,
	background_colour = "#000000ff",
})

vim.notify = notify
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	local lvl = ({
		"ERROR",
		"WARN",
		"INFO",
		"DEBUG",
	})[result.type]
	notify({ result.message }, lvl, {
		title = "LSP | " .. client.name,
		timeout = 10000,
		keep = function()
			return lvl == "ERROR" or lvl == "WARN"
		end,
	})
end

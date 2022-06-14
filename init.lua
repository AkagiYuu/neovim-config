pcall(require, "impatient")

local util = require("util")

util.disableBuiltins()
util.load({ "option", "autocmd", "theme" })

vim.defer_fn(function()
	require("mapping")
	require("plugins")

	vim.cmd([[ rshada ]])

	if vim.loop.os_uname().version:match("Windows") then
		util.usePowerShell()
	end
end, 1000)

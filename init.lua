pcall(require, "impatient")

local util = require("util")

util.disableBuiltins()
util.load({ "option", "theme", "autocmd" })

local main
main = vim.loop.new_async(vim.schedule_wrap(function()
	util.load({ "mapping" })
	require("plugins")

	vim.cmd([[ rshada! ]])
	util.setCursorPosition()

	if vim.loop.os_uname().version:match("Windows") then
		util.usePowerShell()
	end

	main:close()
end))
main:send()

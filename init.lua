local _, impatient = pcall(require, "impatient")
local util = require("util")

util.disableBuiltins()
util.load({ "option", "theme", "autocmd" })

local main
main = vim.loop.new_async(vim.schedule_wrap(function()
	util.load({ "mapping" })
	require("plugins")

	vim.defer_fn(function()
		vim.cmd([[
            rshada!
        ]])
		if vim.loop.os_uname().version:match("Windows") then
			local opt = vim.opt
			opt.shell = "pwsh"
            -- stylua: ignore
            opt.shellcmdflag =
                "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
			opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
			opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
			opt.shellquote = ""
			opt.shellxquote = ""
		end
	end, 800)

	require("ginit")
	-- User custom config
	util.loadUserSettings()
	main:close()
end))
main:send()

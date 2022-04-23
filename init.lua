local load = function(modules)
	for _, module in ipairs(modules) do
		local ok, err = pcall(require, module)
		if not ok then
			error("Error loading " .. module .. "\n\n" .. err)
		end
	end
end
load({ "impatient", "option", "theme" })

local main
main = vim.loop.new_async(vim.schedule_wrap(function()
	load({ "autocmd", "mapping" })
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
	if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/custom/init.lua") == 1 then
		local ok, err = pcall(require, "custom")
		if not ok then
			vim.notify("Error loading custom/init.lua\n\n" .. err)
		end
		return
	end
	main:close()
end))
main:send()

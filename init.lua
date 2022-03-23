vim.g.did_load_filetypes = 0
-- vim.cmd([[
-- 	filetype off
--     filetype plugin indent off
-- ]])
require("impatient")
require("option")
require("mapping")
require("theme")

local main
main = vim.loop.new_async(vim.schedule_wrap(function()
	require("plugins")
	require("plugins.config.telescope")

	vim.opt.shadafile = ""
	vim.defer_fn(function()
		vim.cmd([[
            rshada!
            doautocmd BufRead
            " filetype on
            " filetype plugin indent on
            silent! bufdo e
        ]])
	end, 15)

	main:close()
end))
main:send()

-- User custom config
if vim.fn.filereadable(vim.fn.stdpath "config" .. "/lua/custom/init.lua") == 1 then
   local ok, err = pcall(require, "custom")
   if not ok then
      vim.notify("Error loading custom/init.lua\n\n" .. err)
   end
   return
end

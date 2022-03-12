-- vim.g.do_filetype_lua = 1
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
	require("plugin")

	require("feline").setup()
	-- require("plugin.config.galaxy-line")
	require("plugin.config.bufferline")
	require("plugin.config.telescope")
	


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

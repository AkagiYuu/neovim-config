require("impatient")
vim.g.did_load_filetypes = 1
vim.cmd([[
	filetype off
  filetype plugin indent off
]])
require("option")
require("theme")

require("mapping")



local main
main = vim.loop.new_async(vim.schedule_wrap(function()
	require("plugin")

	require("feline").setup()
	-- require("plugin.config.galaxy-line")
	require("plugin.config.bufferline")




	require("plugin.config.telescope")
	require("plugin.config.indent")
	require("plugin.config.lspsaga_config")
	require("plugin.config.whichkey")

	vim.opt.shadafile = ""
	vim.defer_fn(function()
		vim.cmd([[
                rshada!
                doautocmd BufRead
                filetype on
                filetype plugin indent on
                silent! bufdo e
            ]])
	end, 15)

	main:close()
end))
main:send()

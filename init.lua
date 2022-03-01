require("impatient")
vim.g.did_load_filetypes = 1
vim.cmd([[
	filetype off
  filetype plugin indent off
]])

local uv = vim.loop

require("theme")
require("alpha").setup(require("alpha.themes.startify").config)

require("plugin.config.lspconfig")

require("plugin.config.galaxy-line")

local main
main = uv.new_async(vim.schedule_wrap(function()
	require("plugin")

	require("plugin.config.bufferline")
	require("plugin.config.notify")
	require("plugin.config.treesitter")

	require("plugin.config.nvim-cmp")
	require("plugin.config.null-ls")
	require("plugin.config.telescope")
	require("plugin.config.indent")
	require("plugin.config.lspsaga_config")
	require("todo-comments").setup()
	require("gitsigns").setup()
	require("plugin.config.whichkey")
	require("mapping")
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

require("option")

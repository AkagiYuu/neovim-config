pcall(require, "impatient")

require("util").disableBuiltins()

require("plugins")
require("option")
require("autocmd")
require("theme")

vim.defer_fn(function()
	require("mapping")
	vim.cmd([[ rshada ]])
    vim.opt.spell = true
end, 1000)

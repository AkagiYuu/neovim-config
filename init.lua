pcall(require, "impatient")

require("util").disableBuiltins()

require("plugins")
require("theme")
require("option")
require("autocmd")

vim.defer_fn(function()
	require("mapping")
	vim.cmd([[ rshada ]])
    vim.opt.spell = true
end, 1000)
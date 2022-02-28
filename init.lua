require("impatient")
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
	require('gitsigns').setup()
    require("plugin.config.whichkey")

    require("mapping")

    main:close()
end))
main:send()
-- local main
-- main = uv.new_async(vim.schedule_wrap(function()
--     require("plugin")

--     require("plugin.config.bufferline")
--     require("plugin.config.notify")
--     require("plugin.config.treesitter")

--     main:close()
-- end))
-- main:send()

-- local second
-- second = uv.new_async(vim.schedule_wrap(function()
--     require("plugin.config.null-ls")
--     require("plugin.config.telescope")
--     require("plugin.config.indent")
--     require("plugin.config.lspsaga_config")

--     second:close()
-- end))
-- second:send()

-- local last
-- last = uv.new_async(vim.schedule_wrap(function()

--     require("todo-comments").setup()
--     require("plugin.config.whichkey")

--     require("mapping")

--     last:close()
-- end))
-- last:send()

require("option")

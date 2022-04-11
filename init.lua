local present, impatient = pcall(require, "impatient")
local modules = {
	"option",
	"autocmd",
	"mapping"
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end
require("theme")

local main
main = vim.loop.new_async(vim.schedule_wrap(function()
    require("plugins")

    vim.defer_fn(function()
        vim.cmd([[
            rshada!
            autocmd QuitPre * :wshada
        ]])
    end, 800)
    main:close()
end))
main:send()

-- User custom config
if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/custom/init.lua") == 1 then
    local ok, err = pcall(require, "custom")
    if not ok then
        vim.notify("Error loading custom/init.lua\n\n" .. err)
    end
    return
end

require('ginit')

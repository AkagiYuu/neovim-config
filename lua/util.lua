local M = {}
local g = vim.g

M.disableBuiltins = function()
    g.loaded_gzip = 1
    g.loaded_zip = 1
    g.loaded_zipPlugin = 1
    g.loaded_tar = 1
    g.loaded_tarPlugin = 1
    g.loaded_getscript = 1
    g.loaded_getscriptPlugin = 1
    g.loaded_vimball = 1
    g.loaded_vimballPlugin = 1
    g.loaded_2html_plugin = 1
    g.loaded_matchit = 1
    g.loaded_matchparen = 1
    g.loaded_logiPat = 1
    g.loaded_rrhelper = 1
    g.loaded_netrw = 1
    g.loaded_netrwPlugin = 1
    g.loaded_netrwSettings = 1
    g.loaded_netrwFileHandlers = 1
end

M.loadUserSettings = function()
    if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/custom/init.lua") == 1 then
		local ok, err = pcall(require, "custom")
		if not ok then
			vim.notify("Error loading custom/init.lua\n\n" .. err)
		end
		return
	end
end

M.load = function(modules)
	for _, module in ipairs(modules) do
		local ok, err = pcall(require, module)
		if not ok then
			error("Error loading " .. module .. "\n\n" .. err)
		end
	end
end

return M
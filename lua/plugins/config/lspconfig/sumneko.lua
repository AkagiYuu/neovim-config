local M = {}

M.setting = function(options)
	if _G.config.dev then
		return require("lua-dev").setup(options)
	end

	return options
end

return M

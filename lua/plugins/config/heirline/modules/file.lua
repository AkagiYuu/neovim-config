local M = {}


local short_filename = function(short)
	if #vim.fn.expand("%:p") == 0 then
		return "-"
	end
	if short then
		return vim.fn.expand("%:t")
	end
	return vim.fn.expand("%:~")
end

local file_readonly = function()
	if vim.bo.filetype == "help" then
		return ""
	end
	local icon = ""
	if vim.bo.readonly == true then
		return " " .. icon .. " "
	end
	return ""
end

M.dir_name = function(_, opts)
	if opts.short then
		return vim.fn.expand("%:h"):match("[^/\\]+$") or ""
	end
	return vim.fn.expand("%:h") or ""
end

M.filename = function(_, opts)
	local short = opts.short or false
	local file = short_filename(short)

	if vim.fn.empty(file) == 1 then
		return ""
	end
	if string.len(file_readonly()) ~= 0 then
		return file .. file_readonly()
	end

	local icon = ""
	if vim.bo.modifiable and vim.bo.modified then
		return file .. " " .. icon .. "  "
	end
	return file .. " "
end

return M
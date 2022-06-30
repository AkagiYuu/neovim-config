local M = {}
local g = vim.g
local api = vim.api
local fn = vim.fn

M.disableBuiltins = function()
	g.do_filetype_lua = 1 -- use filetype.lua
	g.did_load_filetypes = 0 -- don't use filetype.vim
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

---Set cursor to previous position
M.setCursorPosition = function()
	-- Return if the file doesn't exist, like a new and unsaved file
	if fn.empty(fn.glob(fn.expand("%"))) ~= 0 then
		return
	end

	local cursor_position = api.nvim_buf_get_mark(0, '"')
	local row = cursor_position[1]

	if row > 0 and row <= api.nvim_buf_line_count(0) then
		-- If the last row is visible within this window, like in a very short
		-- file, just set the cursor position to the saved position
		api.nvim_win_set_cursor(0, cursor_position)

		if api.nvim_buf_line_count(0) - row > ((fn.line("w$") - fn.line("w0")) / 2) - 1 then
			api.nvim_input("zz")
		end
	end

	-- If the row is within a fold, make the row visible and recenter the screen
	if api.nvim_eval("foldclosed('.')") ~= -1 then
		api.nvim_input("zvzz")
	end
end

return M

local colors = require('plugins.config.heirline.colors')
local M = {}

-- ---Returns .git folder path if the current workspace is a git repo.
-- ---@return string
-- local get_git_dir = function()
--     for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
--         if vim.fn.isdirectory(dir .. '/.git') == 1 then
--             return dir
--         end
--     end

--     return ''
-- end

-- ---Returns the git root of the current file.
-- ---@return string
-- M.git_root = function()
--     local git_dir = get_git_dir()
--     if not git_dir then
--         return ''
--     end

--     --   local root = git_dir:gsub("/.git/?", "")
--     -- sub_root is a path to a worktree if exists.
--     local sub_root = git_dir:match('/([^/]+)/.git/worktrees/.+$')
--     local repo = ''
--     if sub_root then
--         repo = ' [' .. sub_root .. ']'
--     end
--     return repo
-- end

M.git_count = function(property, color, icon)
    return {
        condition = function(self) return self.git_status[property] and self.git_status[property] > 0 end,
        {
            provider = icon,
            hl = { fg = colors.git[color] },
        },
        {
            provider = function(self) return self.git_status[property] end,
        },
    }
end

return M

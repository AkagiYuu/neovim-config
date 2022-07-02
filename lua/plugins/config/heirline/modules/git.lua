local colors = require('plugins.config.heirline.colors')
local M = {}

---Return parent path for specified entry (either file or directory), nil if
-- there is none. Adapted from from galaxyline.
---@param path string
---@return string
local parent_pathname = function(path)
    local i = path:find('[\\/:][^\\/:]*$')
    if not i then
        return
    end
    return path:sub(1, i - 1)
end

---Returns the git directory for the current file. Adapted from from
-- galaxyline.
---@param path string
---@return string
local get_git_dir = function(path)
    -- Checks if provided directory contains git directory
    local function has_git_dir(dir)
        local git_dir = dir .. '/.git'
        if vim.fn.isdirectory(git_dir) == 1 then
            return git_dir
        end
    end

    -- Get git directory from git file if present
    local function has_git_file(dir)
        local gitfile = io.open(dir .. '/.git')
        if gitfile ~= nil then
            local git_dir = gitfile:read():match('gitdir: (.*)')
            gitfile:close()

            return git_dir
        end
    end

    -- Check if git directory is absolute path or a relative
    local function is_path_absolute(dir)
        local patterns = {
            '^/', -- unix
            '^%a:[/\\]', -- windows
        }
        for _, pattern in ipairs(patterns) do
            if string.find(dir, pattern) then
                return true
            end
        end
        return false
    end

    -- If path nil or '.' get the absolute path to current directory
    if not path or path == '.' then
        path = vim.fn.getcwd()
    end

    local git_dir
    -- Check in each path for a git directory, continues until found or reached
    -- root directory
    while path do
        -- Try to get the git directory checking if it exists or from a git file
        git_dir = has_git_dir(path) or has_git_file(path)
        if git_dir ~= nil then
            break
        end
        -- Move to the parent directory, nil if there is none
        path = parent_pathname(path)
    end

    if not git_dir then
        return
    end

    if is_path_absolute(git_dir) then
        return git_dir
    end
    return path .. '/' .. git_dir
end

---Returns the git root of the current file.
---@return string
M.git_root = function()
    local git_dir = get_git_dir(nil)
    if not git_dir then
        return ''
    end

    --   local root = git_dir:gsub("/.git/?", "")
    -- sub_root is a path to a worktree if exists.
    local sub_root = git_dir:match('/([^/]+)/.git/worktrees/.+$')
    local repo = ''
    if sub_root then
        repo = ' [' .. sub_root .. ']'
    end
    return repo
end

M.git_count = function(prop, colour, icon)
    return {
        condition = function(self)
            return self.status_dict[prop] and self.status_dict[prop] > 0
        end,
        {
            provider = icon,
            hl = {
                fg = colors.git[colour],
            },
        },
        {
            provider = function(self)
                return self.status_dict[prop]
            end,
        },
    }
end
return M

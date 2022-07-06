local file = {}

local space = {
    provider = ' ',
}
local null = {
    provider = '',
}

local size = function(colors)
    return {
        provider = function(self)
            local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
            local index = 1
            local fsize = vim.fn.getfsize(self.filename)

            if fsize < 0 then
                fsize = 0
            end

            while fsize > 1024 and index < 7 do
                fsize = fsize / 1024
                index = index + 1
            end
            return string.format(index == 1 and '%g%s' or '%.2f%s', fsize, suffix[index])
        end,
        hl = {
            fg = colors.grey_fg,
        },
    }
end

local lock_info = function(colors)
    return {
        {
            provider = function()
                if vim.bo.modified then
                    return ' '
                end
            end,
            hl = {
                fg = colors.green,
            },
        },
        {
            provider = function()
                if not vim.bo.modifiable or vim.bo.readonly then
                    return ' '
                end
            end,
            hl = {
                fg = colors.orange,
            },
        },
    }
end

local name = function(heirline)
    return {
        init = function(self)
            self.filename = vim.fn.fnamemodify(self.filename, ':.')
            if self.filename == '' then
                return '[No Name]'
            end
        end,
        heirline.make_flexible_component(1, {
            provider = function(self)
                return self.filename
            end,
        }, {
            provider = function(self)
                return vim.fn.pathshorten(self.filename)
            end,
        }),
    }
end

local icon = {
    provider = function(self)
        return self.icon and (self.icon .. ' ')
    end,
    hl = function(self)
        return {
            fg = self.icon_color,
        }
    end,
}

local folder_name = function(conditions,colors,icons)
    return {
        condition = function()
            return conditions.is_git_repo()
        end,
        {
            provider = icons.folder_icon,
            hl = {
                fg = colors.folder,
            },
        },
        {
            provider = require('plugins.config.heirline.modules.git').git_root,
        },
        space,
    }
end

file.info = function(heirline,conditions,colors,icons)
    local file_folder_name = folder_name(conditions, colors, icons)
    local file_name = name(heirline)
    local file_lock_info = lock_info(colors)
    local file_size = size(colors)

    return {
        heirline.make_flexible_component(
            3,
            { file_folder_name, icon, file_name, file_lock_info, space, file_size },
            { file_folder_name, icon, file_name, file_lock_info },
            { file_folder_name, file_name },
            { file_name }
        ),
    }
end

file.type = function(heirline)
    return heirline.make_flexible_component(
        2,
        {
            hl = function(self)
                return {
                    fg = self.icon_color,
                    bold = true,
                }
            end,
            space,
            {
                provider = function(self)
                    return self.icon or ''
                end,
            },
            space,
            {
                provider = function()
                    return vim.bo.filetype
                end,
            },
        },
        null
    )
end

return file

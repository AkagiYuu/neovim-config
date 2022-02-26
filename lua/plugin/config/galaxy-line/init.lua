local gps = require("nvim-gps")
require("nvim-gps").setup({
    depth = 3
})

local gl = require("galaxyline")
local vcs = require("galaxyline.providers.vcs")
local condition = require("galaxyline.condition")
local devicons = require("nvim-web-devicons")

local utils = require("plugin.config.galaxy-line.utils")
local icons = {
    dos = "", -- e70f
    unix = "", -- f17c
    mac = "", -- f179
    code = "", -- e000
    paste = "", -- f691
    dot = "", -- f62e
    duck = " ", -- f6e4
    page = "☰", -- 2630
    buffer = "﬘", -- fb18
    line_number = "", -- e0a1
    connected = "", -- f817
    disconnected = "", -- f818
    gears = "", -- f085
    poop = "💩", -- 1f4a9
    question = "", -- f128
    bug = "", -- f188
    git = {
        logo = "", -- f7a1
        branch = "" -- f418
    },
    square = {
        plus = "", -- f0fe
        minus = "", -- f146
        dot = "" -- f264
    },
    circle = {
        plus = "", -- f055
        minus = "", -- f056
        dot = "" -- f192
    },
    file = {
        locked = "", -- f023
        not_modifiable = "", -- f05e
        unsaved = "", -- f0c7
        modified = "" -- f040
    },
    diagnostic = {
        ok = "", -- f058
        error = "", -- f057
        warning = "", -- f06a
        info = "", -- f05a
        -- hint = "", -- f834
        hint = "" -- f059
    },
    sep = {
        -- right_filled = "", -- e0b6
        -- left_filled = "", -- e0b4
        -- right_filled = " ", -- e0ca
        -- left_filled = " ", -- e0c8
        -- right_filled = "", -- e0b2
        -- left_filled = "", -- e0b0
        right_filled = "", -- e0b2
        left_filled = "", -- e0b0
        -- right = "", -- e0b3
        -- left = "", -- e0b1
        -- right = "", -- e0b7
        -- left = "", -- e0b5
        right = "", -- e621
        left = "" -- e621
    }
}
local tokyonight = {
    none = "NONE",
    bg_highlight = "#292e42",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    dark5 = "#737aa2",
    comment = "#565f89",
    blue0 = "#3d59a1",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#b4f9f8",
    blue7 = "#394b70",
    cyan = "#7dcfff",
    purple = "#9d7cd8",
    teal = "#1abc9c",
    red1 = "#db4b4b",
    blue = "#F8F8F2",
    red = "#db4b4b",
    green = "#9ece6a",
    orange = "#ff9e64",
    yellow = "#e0af68",
    magenta = "#bb9af7",
    fg = "#65a380",
    bg0 = "#1f2335",
    bg = "#51afef"
}
local colors = {
    n = {tokyonight.blue, tokyonight.bg},
    i = {tokyonight.green, tokyonight.bg},
    ic = {tokyonight.green, tokyonight.bg},
    R = {tokyonight.red, tokyonight.bg},
    v = {tokyonight.orange, tokyonight.bg},
    V = {tokyonight.orange, tokyonight.bg},
    c = {tokyonight.yellow, tokyonight.bg},
    s = {tokyonight.orange, tokyonight.bg},
    S = {tokyonight.orange, tokyonight.bg},
    t = {tokyonight.blue7, tokyonight.bg},
    nt = {tokyonight.blue, tokyonight.bg},
    ["\22"] = {tokyonight.orange, tokyonight.bg},
    ["\19"] = {tokyonight.blue, tokyonight.bg},
    substrate = tokyonight.bg0,
    git_icon = tokyonight.orange,
    git_branch = tokyonight.fg,
    diff_add = tokyonight.green,
    diff_modified = tokyonight.orange,
    diff_remove = tokyonight.red,
    lsp_icon = tokyonight.magenta,
    lsp_name = tokyonight.fg,
    ok = tokyonight.green,
    error = tokyonight.red,
    warn = tokyonight.yellow,
    info = tokyonight.blue2,
    hint = tokyonight.teal,
    gps = "#61afef"
}

gl.short_line_list = {"packer", "Outline", "Mundo", "MundoDiff", "startify", "startuptime"}

local mode_map = {
    n = {"", "NORMAL"},
    i = {"", "INSERT"},
    ic = {"", "INSERT"},
    R = {"", "REPLACE"},
    v = {"", "VISUAL"},
    V = {"", "V-LINE"},
    c = {"ﲵ", "COMMAND"},
    s = {"", "SELECT"},
    S = {"", "S-LINE"},
    t = {"", "TERMINAL"},
    nt = {"", "TERMINAL"},
    ["\22"] = {"", "V-BLOCK"},
    ["\19"] = {"", "S-BLOCK"}
}

setmetatable(mode_map, {
    __index = function()
        return {icons.question, utils.get_current_mode()}
    end
})

local gls = gl.section

gls.left[1] = {
    ViMode = {
        provider = function()
            local icon, label = unpack(mode_map[utils.get_current_mode()])
            local fg, nested_fg = unpack(colors[utils.get_current_mode()])
            utils.highlight("GalaxyViMode", nested_fg, fg)
            utils.highlight("GalaxyViModeInv", fg, nested_fg)
            utils.highlight("GalaxyViModeNested", fg, nested_fg)
            utils.highlight("GalaxyViModeInvNested", nested_fg, colors.substrate)
            local mode = "  " .. icon .. " " .. label .. " "
            if vim.o.paste then
                mode = mode .. icons.sep.left .. " " .. icons.paste .. " Paste "
            end
            return mode
        end,
        separator = icons.sep.left_filled,
        separator_highlight = "GalaxyViModeInv"
    }
}
--[[ gls.left[2] = {
  FileFormat = {
    provider = function()
      local icon = icons[vim.bo.fileformat] or ""
      return " " .. icon .. " "
    end,
    highlight = "GalaxyViModeNested",
  },
} ]]
gls.left[3] = {
    FileIcon = {
        provider = function()
            local extension = vim.fn.expand("%:e")
            local icon, iconhl = devicons.get_icon(extension)
            if icon == nil then
                return ""
            end

            local fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name(iconhl), "fg")
            local _, bg = unpack(colors[utils.get_current_mode()])
            utils.highlight("GalaxyFileIcon", fg, bg)

            return " " .. icon .. " "
        end,
        condition = utils.buffer_not_empty
    }
}
gls.left[4] = {
    FileName = {
        provider = function()
            if vim.bo.buftype == "terminal" then
                return ""
            end
            if not utils.buffer_not_empty() then
                return ""
            end

            local fname
            if utils.wide_enough(140) then
                fname = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
                if #fname > 35 then
                    fname = vim.fn.expand("%:t")
                end
            else
                fname = vim.fn.expand("%:t")
            end
            if #fname == 0 then
                return ""
            end

            if vim.bo.readonly then
                fname = fname .. " " .. icons.file.locked
            end
            if not vim.bo.modifiable then
                fname = fname .. " " .. icons.file.not_modifiable
            end
            if vim.bo.modified then
                fname = fname .. " " .. icons.file.modified
            end

            return " " .. fname .. " "
        end,
        highlight = "GalaxyViModeNested",
        condition = utils.buffer_not_empty
    }
}
gls.left[5] = {
    LeftSep = {
        provider = function()
            return icons.sep.left_filled
        end,
        highlight = "GalaxyViModeInvNested"
    }
}
gls.left[6] = {
    GitIcon = {
        provider = function()
            local branch = vcs.get_git_branch()

            if utils.wide_enough(95) and branch ~= nil then
                return "  " .. icons.git.branch .. " "
            end

            return ""
        end,
        highlight = {colors.git_icon, colors.substrate}
    }
}
gls.left[7] = {
    GitBranch = {
        provider = function()
            local branch = vcs.get_git_branch()

            if utils.wide_enough(95) and branch ~= nil then
                return branch .. " "
            end

            return ""
        end,
        highlight = {colors.git_branch, colors.substrate}
    }
}
gls.left[8] = {
    DiffAdd = {
        provider = function()
            if condition.check_git_workspace() and utils.wide_enough(120) then
                return vcs.diff_add()
            end
            return ""
        end,
        icon = icons.circle.plus .. " ",
        highlight = {colors.diff_add, colors.substrate}
    }
}
gls.left[9] = {
    DiffModified = {
        provider = function()
            if condition.check_git_workspace() and utils.wide_enough(120) then
                return vcs.diff_modified()
            end
            return ""
        end,
        icon = icons.circle.dot .. " ",
        highlight = {colors.diff_modified, colors.substrate}
    }
}
gls.left[10] = {
    DiffRemove = {
        provider = function()
            if condition.check_git_workspace() and utils.wide_enough(120) then
                return vcs.diff_remove()
            end
            return ""
        end,
        icon = icons.circle.minus .. " ",
        highlight = {colors.diff_remove, colors.substrate},
        separator = icons.sep.left_filled,
        separator_highlight = {colors.substrate}
    }
}

gls.left[12] = {
    nvimGPS = {
        provider = function()
            return gps.get_location()
        end,
        condition = function()
            return gps.is_available()
        end,
        highlight = {colors.gps}
    }
}

gls.right[3] = {
    LspIcon = {
        provider = function()
            if utils.wide_enough(85) and utils.diagnostic_exists() then
                return icons.gears .. " "
            end
        end,
        highlight = {colors.lsp_icon, colors.substrate}
    }
}
gls.right[4] = {
    LspServer = {
        provider = function()
            if utils.wide_enough(85) and utils.diagnostic_exists() then
                local clients = utils.get_lsp_clients()
                return clients .. " "
            end
        end,
        highlight = {colors.lsp_name, colors.substrate}
    }
}
gls.right[5] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.error, colors.substrate}
    }
}
gls.right[6] = {
    Space = {
        provider = function()
            return ""
        end
    }
}
gls.right[7] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "   ",
        highlight = {colors.warn, colors.substrate}
    }
}
gls.right[8] = {
    RightSepNested = {
        provider = function()
            return icons.sep.right_filled
        end,
        highlight = "GalaxyViModeInvNested"
    }
}
--[[ gls.right[7] = {
  FileFormat = {
    provider = function()
      if not utils.buffer_not_empty() or not utils.wide_enough(80) then
        return ""
      end
      local icon = icons[vim.bo.fileformat] or ""
      return string.format("  %s %s ", icon, vim.bo.fileencoding)
    end,
    highlight = "GalaxyViModeNested",
  },
} ]]
--[[ gls.right[10] = {
  RightSep = {
    provider = function()
      return icons.sep.right_filled
    end,
    highlight = "GalaxyViModeInv",
  },
} ]]
gls.right[11] = {
    PositionInfo = {
        provider = function()
            if not utils.buffer_not_empty() or not utils.wide_enough(70) then
                return ""
            end

            return string.format(" %s %s:%s ", icons.line_number, unpack(vim.api.nvim_win_get_cursor(0)))
        end,
        highlight = "GalaxyViModeNested"
    }
}
gls.right[12] = {
    PercentInfo = {
        provider = function()
            if not utils.buffer_not_empty() or not utils.wide_enough(75) then
                return ""
            end

            local curr_line = vim.api.nvim_win_get_cursor(0)[1]
            local lines = vim.api.nvim_buf_line_count(0)

            return string.format(" %s %d%% ", icons.page, math.floor(100 * curr_line / lines))
        end,
        highlight = "GalaxyViMode",
        separator = icons.sep.right,
        separator_highlight = "GalaxyViMode"
    }
}

local short_map = {
    packer = "Packer",
    Outline = "Outline",
    Mundo = "History",
    MundoDiff = "Diff",
    startify = "Starfity",
    startuptime = "StartupTime"
}

gls.short_line_left[1] = {
    BufferType = {
        provider = function()
            local fg, nested_fg = unpack(colors[utils.get_current_mode()])
            utils.highlight("GalaxyViMode", nested_fg, fg)
            utils.highlight("GalaxyViModeInv", fg, nested_fg)
            utils.highlight("GalaxyViModeInvNested", nested_fg, colors.substrate)

            local name = short_map[vim.bo.filetype]
            if name == nil then
                return ""
            end

            return string.format("  %s ", name)
        end,
        highlight = "GalaxyViMode",
        condition = utils.has_filetype,
        separator = icons.sep.left_filled,
        separator_highlight = "GalaxyViModeInv"
    }
}
gls.short_line_left[2] = {
    ShortLeftSepNested = {
        provider = function()
            return icons.sep.left_filled
        end,
        highlight = "GalaxyViModeInvNested"
    }
}
gls.short_line_right[1] = {
    ShortRightSepNested = {
        provider = function()
            return icons.sep.right_filled
        end,
        highlight = "GalaxyViModeInvNested"
    }
}
gls.short_line_right[2] = {
    ShortRightSep = {
        provider = function()
            return icons.sep.right_filled
        end,
        highlight = "GalaxyViModeInv"
    }
}
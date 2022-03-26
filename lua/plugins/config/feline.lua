local feline = require("feline")
local lsp = require("feline.providers.lsp")
local lsp_severity = vim.diagnostic.severity
local b = vim.b

local assets = {
    left_semicircle = "",
    right_semicircle = "",
    right_semicircle_cut = "",
    left_semicircle_cut = "",
    vertical_bar_chubby = "█",
    vertical_bar_medium = "┃",
    vertical_bar_thin = "│",
    left_arrow_thin = "",
    right_arrow_thin = "",
    left_arrow_filled = "",
    right_arrow_filled = "",
    slant_left = "",
    slant_left_thin = "",
    slant_right = "",
    slant_right_thin = "",
    slant_left_2 = "",
    slant_left_2_thin = "",
    slant_right_2 = "",
    slant_right_2_thin = "",
    chubby_dot = "●",
    slim_dot = '•'
}

local clrs = {
    rosewater = "#F5E0DC", -- Rosewater
    flamingo = "#F2CDCD", -- Flamingo
    mauve = "#DDB6F2", -- Mauve
    pink = "#F5C2E7", -- Pink
    red = "#F28FAD", -- Red
    maroon = "#E8A2AF", -- Maroon
    peach = "#F8BD96", -- Peach
    yellow = "#FAE3B0", -- Yellow
    green = "#ABE9B3", -- Green
    blue = "#96CDFB", -- Blue
    sky = "#89DCEB", -- Sky
    teal = "#B5E8E0", -- Teal
    lavender = "#C9CBFF", -- Lavender
    white = "#D9E0EE", -- White
    gray2 = "#C3BAC6", -- Gray2
    gray1 = "#988BA2", -- Gray1
    gray0 = "#6E6C7E", -- Gray0
    black4 = "#575268", -- Black4
    black3 = "#302D41", -- Black3
    black2 = "#1E1E2E", -- Black2
    black1 = "#1A1826", -- Black1
    black0 = "#161320" -- Black0
}

local sett = {
    bkg = clrs.black3,
    diffs = clrs.mauve,
    extras = clrs.gray1,
    curr_file = clrs.maroon,
    curr_dir = clrs.flamingo
}

local mode_colors = {
    ["n"] = {"NORMAL", clrs.lavender},
    ["no"] = {"N-PENDING", clrs.lavender},
    ["i"] = {"INSERT", clrs.green},
    ["ic"] = {"INSERT", clrs.green},
    ["t"] = {"TERMINAL", clrs.green},
    ["v"] = {"VISUAL", clrs.flamingo},
    ["V"] = {"V-LINE", clrs.flamingo},
    [""] = {"V-BLOCK", clrs.flamingo},
    ["R"] = {"REPLACE", clrs.maroon},
    ["Rv"] = {"V-REPLACE", clrs.maroon},
    ["s"] = {"SELECT", clrs.maroon},
    ["S"] = {"S-LINE", clrs.maroon},
    [""] = {"S-BLOCK", clrs.maroon},
    ["c"] = {"COMMAND", clrs.peach},
    ["cv"] = {"COMMAND", clrs.peach},
    ["ce"] = {"COMMAND", clrs.peach},
    ["r"] = {"PROMPT", clrs.teal},
    ["rm"] = {"MORE", clrs.teal},
    ["r?"] = {"CONFIRM", clrs.mauve},
    ["!"] = {"SHELL", clrs.green}
}

local components = {
    active = {{}, {}, {}},
    inactive = {{}, {}, {}}
}

local invi_sep = {
    str = " ",
    hl = {
        fg = sett.bkg,
        bg = sett.bkg
    }
}

local function any_git_changes()
    local gst = b.gitsigns_status_dict
    if gst then
        if gst["added"] and gst["added"] > 0 or gst["removed"] and gst["removed"] > 0 or gst["changed"] and
            gst["changed"] > 0 then
            return true
        end
    end
    return false
end

-- Left
local vi_mode_hl = function()
    return {
        fg = sett.bkg,
        bg = mode_colors[vim.fn.mode()][2],
        style = "bold"
    }
end

components.active[1][1] = {
    provider = " ",
    hl = function()
        return {
            fg = sett.bkg,
            bg = mode_colors[vim.fn.mode()][2]
        }
    end
}

components.active[1][2] = {
    provider = function()
        return " " .. mode_colors[vim.fn.mode()][1] .. " "
    end,
    hl = vi_mode_hl
}

components.active[1][3] = {
    provider = assets.right_arrow_filled,
    hl = function()
        return {
            fg = mode_colors[vim.fn.mode()][2],
            bg = sett.bkg
        }
    end,
    enabled = function()
        return not any_git_changes()
    end
}

components.active[1][4] = {
    provider = assets.right_arrow_filled,
    hl = function()
        return {
            fg = mode_colors[vim.fn.mode()][2],
            bg = sett.diffs
        }
    end,
    enabled = function()
        return any_git_changes()
    end
}

components.active[1][5] = {
    provider = "git_diff_added",
    hl = {
        fg = sett.bkg,
        bg = sett.diffs
    },
    icon = "  "
}

components.active[1][6] = {
    provider = "git_diff_changed",
    hl = {
        fg = sett.bkg,
        bg = sett.diffs
    },
    icon = "  "
}

components.active[1][7] = {
    provider = "git_diff_removed",
    hl = {
        fg = sett.bkg,
        bg = sett.diffs
    },
    icon = "  "
}

components.active[1][8] = {
    provider = assets.right_arrow_filled,
    hl = {
        fg = sett.diffs,
        bg = sett.bkg
    },
    enabled = function()
        return any_git_changes()
    end
}

components.active[1][9] = {
    provider = "git_branch",
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 70
    end,
    hl = {
        fg = sett.extras,
        bg = sett.bkg
    },
    left_sep = invi_sep,
    right_sep = invi_sep
}

components.active[1][10] = {
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 90
    end,
    provider = 'line_percentage',
    hl = {
        fg = sett.extras,
        bg = sett.bkg
    },
    left_sep = invi_sep
}

components.active[1][11] = {
    provider = "position",
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 90
    end,
    hl = {
        fg = sett.extras,
        bg = sett.bkg
    },
    left_sep = invi_sep
}
-- Center

components.active[2][1] = {
    provider = "diagnostic_errors",
    enabled = function()
        return lsp.diagnostics_exist(lsp_severity.ERROR)
    end,

    hl = {
        fg = clrs.red,
        bg = sett.bkg
    },
    icon = "  "
}

components.active[2][2] = {
    provider = "diagnostic_warnings",
    enabled = function()
        return lsp.diagnostics_exist(lsp_severity.WARN)
    end,
    hl = {
        fg = '#d8a657',
        bg = sett.bkg
    },
    icon = "  "
}

components.active[2][3] = {
    provider = "diagnostic_info",
    enabled = function()
        return lsp.diagnostics_exist(lsp_severity.INFO)
    end,
    hl = {
        fg = clrs.sky,
        bg = sett.bkg
    },
    icon = "  "
}

components.active[2][4] = {
    provider = "diagnostic_hints",
    enabled = function()
        return lsp.diagnostics_exist(lsp_severity.HINT)
    end,
    hl = {
        fg = clrs.rosewater,
        bg = sett.bkg
    },
    icon = "  "
}

-- Right
components.active[3][1] = {
    provider = 'file_info',
    -- enabled = shortline or function(winid)
    -- 	return vim.api.nvim_win_get_width(winid) > 70
    -- end,
    hl = {
        fg = sett.bkg,
        bg = sett.curr_file
    },
    left_sep = {
        str = assets.left_arrow_filled,
        hl = {
            fg = sett.curr_file,
            bg = sett.bkg
        }
    }
}

components.active[3][2] = {
    provider = function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return "  " .. dir_name .. " "
    end,

    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80
    end,

    hl = {
        fg = sett.bkg,
        bg = sett.curr_dir
    },
    left_sep = {
        str = assets.left_arrow_filled,
        hl = {
            fg = sett.curr_dir,
            bg = sett.curr_file
        }
    }
}
components.inactive[1][1] = {
    provider = 'file_type',
    hl = {
        fg = 'black',
        bg = 'cyan',
        style = 'bold'
    },
    left_sep = {
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'cyan'
        }
    },
    right_sep = {{
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'cyan'
        }
    }, ' '}
}

local force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
}
force_inactive.filetypes = {
	'NvimTree',
	'packer',
	'startify',
  }

  force_inactive.buftypes = {
	'terminal'
  }

feline.setup({
    components = components,
	force_inactive = force_inactive,
})

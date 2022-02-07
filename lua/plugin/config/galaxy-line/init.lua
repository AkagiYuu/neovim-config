local gps = require('nvim-gps')
require("nvim-gps").setup({
    depth = 3,
})

local gl = require "galaxyline"
local vcs = require "galaxyline.providers.vcs"
local condition = require "galaxyline.condition"
local devicons = require "nvim-web-devicons"

local utils = require "plugin.config.galaxy-line.utils"
local appearance = require "plugin.config.galaxy-line.appearance"
local icons = appearance.icons
local theme_map = appearance.color_map["tokyonight"]
local colors = theme_map["dark"]

gl.short_line_list = {
  "packer",
  "Outline",
  "Mundo",
  "MundoDiff",
  "startify",
  "startuptime",
}

local mode_map = {
  n = { "", "NORMAL" },
  i = { "", "INSERT" },
  ic = { "", "INSERT" },
  R = { "", "REPLACE" },
  v = { "", "VISUAL" },
  V = { "", "V-LINE" },
  c = { "ﲵ", "COMMAND" },
  s = { "", "SELECT" },
  S = { "", "S-LINE" },
  t = { "", "TERMINAL" },
  nt = { "", "TERMINAL" },
  ["\22"] = { "", "V-BLOCK" },
  ["\19"] = { "", "S-BLOCK" },
}

setmetatable(mode_map, {
  __index = function()
    return { icons.question, utils.get_current_mode() }
  end,
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
    separator_highlight = "GalaxyViModeInv",
  },
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
      local extension = vim.fn.expand "%:e"
      local icon, iconhl = devicons.get_icon(extension)
      if icon == nil then
        return ""
      end

      local fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name(iconhl), "fg")
      local _, bg = unpack(colors[utils.get_current_mode()])
      utils.highlight("GalaxyFileIcon", fg, bg)

      return " " .. icon .. " "
    end,
    condition = utils.buffer_not_empty,
  },
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
        fname = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
        if #fname > 35 then
          fname = vim.fn.expand "%:t"
        end
      else
        fname = vim.fn.expand "%:t"
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
    condition = utils.buffer_not_empty,
  },
}
gls.left[5] = {
  LeftSep = {
    provider = function()
      return icons.sep.left_filled
    end,
    highlight = "GalaxyViModeInvNested",
  },
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
    highlight = { colors.git_icon, colors.substrate },
  },
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
    highlight = { colors.git_branch, colors.substrate },
  },
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
    highlight = { colors.diff_add, colors.substrate },
  },
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
    highlight = { colors.diff_modified, colors.substrate },
  },
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
    highlight = { colors.diff_remove, colors.substrate },
    separator = icons.sep.left_filled,
    separator_highlight = { colors.substrate},
  },
}

gls.left[12] = {
  nvimGPS = {
    provider = function()
        return gps.get_location()
    end,
    condition = function()
        return gps.is_available()
    end,
    highlight = { colors.gps },
  }
}

gls.right[3] = {
  LspIcon = {
    provider = function()
      if utils.wide_enough(85) and utils.diagnostic_exists() then
        return icons.gears .. " "
      end
    end,
    highlight = { colors.lsp_icon, colors.substrate },
  },
}
gls.right[4] = {
  LspServer = {
    provider = function()
      if utils.wide_enough(85) and utils.diagnostic_exists() then
        local clients = utils.get_lsp_clients()
        return clients .. " "
      end
    end,
    highlight = { colors.lsp_name, colors.substrate },
  },
}
gls.right[5] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.error, colors.substrate },
  }
}
gls.right[6] = {
  Space = {
    provider = function () return '' end
  }
}
gls.right[7] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '   ',
    highlight = { colors.warn, colors.substrate },
  }
}
gls.right[8] = {
  RightSepNested = {
    provider = function()
      return icons.sep.right_filled
    end,
    highlight = "GalaxyViModeInvNested",
  },
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
    highlight = "GalaxyViModeNested",
  },
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
    separator_highlight = "GalaxyViMode",
  },
}

local short_map = {
  packer = "Packer",
  Outline = "Outline",
  Mundo = "History",
  MundoDiff = "Diff",
  startify = "Starfity",
  startuptime = "StartupTime",
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
    separator_highlight = "GalaxyViModeInv",
  },
}
gls.short_line_left[2] = {
  ShortLeftSepNested = {
    provider = function()
      return icons.sep.left_filled
    end,
    highlight = "GalaxyViModeInvNested",
  },
}
gls.short_line_right[1] = {
  ShortRightSepNested = {
    provider = function()
      return icons.sep.right_filled
    end,
    highlight = "GalaxyViModeInvNested",
  },
}
gls.short_line_right[2] = {
  ShortRightSep = {
    provider = function()
      return icons.sep.right_filled
    end,
    highlight = "GalaxyViModeInv",
  },
}
--[[ local gl = require('galaxyline')
local gps = require('nvim-gps')
local gls = gl.section
gl.short_line_list = {
    'LuaTree',
    'NvimTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug',
    'plugins'
}



-- then change in colors line_bg = get_color_bg

local colors = {

    bg = "#0000ffff",
    line_bg = "#0000ffff",
    fg = '#F8F8F2',
    fg_green = '#65a380',

    yellow = '#fabd2f',
    cyan = '#61afef',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef';
    red = '#ec5f67'
}


local function file_readonly(readonly_icon)
  if vim.bo.filetype == 'help' then
    return ''
  end
  local icon = readonly_icon or ''
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ''
end
-- get current file name
local function get_current_file_name()
  -- local file = vim.fn.expand('%:t')
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly(readonly_icon)) ~= 0 then
    return file .. file_readonly(readonly_icon)
  end
  local icon = modified_icon or ''
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. ' ' .. icon .. '  '
    end
  end
  return file .. ' '
end


local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end


local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end



local function get_debug_status()
  local status = dap.status()
  if not status or status == '' then
      return ''
  end
  return  '  ' .. status
end

function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
  local has_func, func_name = pcall(vim.api.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

function get_function_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_current_func()
    end
  return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

--current_func_status with treesitter
-- local function get_current_func_from_treesitter()
--   local opts = {
--     indicator_size = 100,
--     type_patterns = {'class', 'function', 'method', },
--     transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
--     separator = '  ',
--   }
--   local status = vim.fn['nvim_treesitter#statusline'](opts)
--   if not status or status == '' then
--       return ''
--   end
--       return status
--   end

-- local function get_current_context()
--   if vim.fn.exists('nvim_treesitter#statusline') == 1 then
--     return get_current_func_from_treesitter()
--     end
--   return ''
-- end
-- TreesitterContext = get_current_func_from_treesitter
TrailingWhiteSpace = trailing_whitespace



local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = {colors.blue,colors.line_bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color() according the vim mode
      local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c= 'COMMAND',
          V= 'VISUAL',
          [''] = 'VISUAL',
          v ='VISUAL',
          c  = 'COMMAND',
          ['r?'] = ':CONFIRM',
          rm = '--MORE',
          R  = 'REPLACE',
          Rv = 'VIRTUAL',
          s  = 'SELECT',
          S  = 'SELECT',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t  = 'TERMINAL',
          ['!']  = 'SHELL',
      }
      local mode_color = {
          n = colors.green,
          i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
          c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
          [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
          cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
          ['!']  = colors.green,t = colors.green,
          c  = colors.purple,
          ['r?'] = colors.red,
          ['r']  = colors.red,
          rm = colors.red,
          R  = colors.yellow,
          Rv = colors.magenta,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode] .. '   '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
-- gls.left[3] ={
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {require("galaxyline.providers.fileinfo").get_file_icon_color,colors.line_bg},
--   },
-- }
-- gls.left[4] = {
--   FileName = {
--     provider = {get_current_file_name,'FileSize'},
--     condition = buffer_not_empty,
--     highlight = {colors.fg,colors.line_bg,'bold'}
--   }
-- }

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.providers.vcs').check_git_workspace,
    highlight = {colors.yellow,colors.line_bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.providers.vcs').check_git_workspace,
    highlight = {colors.yellow,colors.line_bg,'bold'},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end
gls.left[13] = {
  Space = {
    provider = function () return '' end
  }
}

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '   ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '   ',
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '   ',
    highlight = {colors.red,colors.line_bg},
  }
}

gls.left[10] = {
    TrailingWhiteSpace = {
     provider = TrailingWhiteSpace,
     icon = '   ',
     highlight = {colors.yellow,colors.bg},
    }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return '' end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '   ',
    highlight = {colors.yellow,colors.bg},
  }
}
gls.left[14] = {
nvimGPS = {
        provider = function()
            return '  ' .. gps.get_location()
        end,
        condition = function()
            return gps.is_available()
        end,
        highlight = {colors.cyan,colors.bg},
    }
}


gls.right[1] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require("galaxyline.providers.fileinfo").get_file_icon_color,colors.line_bg},
  },
}
gls.right[2] = {
  FileName = {
    provider = {get_current_file_name,'FileSize'},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'}
  }
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.line_bg,colors.line_bg},
    highlight = {colors.cyan,'bold'},
  }
}

-- gls.right[4] = {
--   ScrollBar = {
--     provider = 'ScrollBar',
--     highlight = {colors.blue,colors.purple},
--   }
-- }
--
-- gls.right[3] = {
--   Vista = {
--     provider = VistaPlugin,
--     separator = ' ',
--     separator_highlight = {colors.bg,colors.line_bg},
--     highlight = {colors.fg,colors.line_bg,'bold'},
--   }
-- }

gls.short_line_left[1] = {
  BufferType = {
    provider =  'FileTypeName',
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.fg,colors.blue}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.fg,colors.blue}
  }
}
 ]]

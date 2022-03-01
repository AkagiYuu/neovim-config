-- require('kanagawa').setup({
--     commentStyle = "NONE",
--     functionStyle = "NONE",
--     keywordStyle = "italic",
--     statementStyle = "bold",
--     typeStyle = "NONE",
--     variablebuiltinStyle = "italic",
--     specialReturn = true,       -- special highlight for the return keyword
--     specialException = true,    -- special highlight for exception handling keywords
--     transparent = true,        -- do not set background color
--     overrides = {
--         CursorLine = { bg = "NONE" }
--     },
-- })
-- vim.cmd("colorscheme kanagawa")
-- vim.g.vscode_style = "dark"
-- vim.g.vscode_transparent = 1
-- vim.g.vscode_disable_nvimtree_bg = true
-- vim.cmd[[colorscheme vscode]]
local catppuccin = require("catppuccin")
catppuccin.setup({
    transparent_background = true,
    term_colors = true,
    integration = {
        lsp_trouble = true,
        lsp_saga = true,
        which_key = true,
        dashboard = false,
        lightspeed = true,
        ts_rainbow = true,
        nvimtree = {
            transparent_panel = true,
        }
    }
})
catppuccin.remap({ CursorLine = {bg = "NONE"} })
vim.cmd[[colorscheme catppuccin]]

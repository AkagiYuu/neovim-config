require('kanagawa').setup({
    commentStyle = "NONE",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,        -- do not set background color
    overrides = {
        CursorLine = { bg = "NONE" },
        TelescopeBorder = { bg = "NONE" }
    },
})
pcall(vim.cmd, "colorscheme kanagawa")
-- local catppuccin = require("catppuccin")
-- catppuccin.setup({
--     transparent_background = true,
--     term_colors = true,
--     styles = {
-- 		comments = "bold",
-- 		variables = "NONE",
-- 	},
--     integration = {
--         lsp_trouble = true,
--         lsp_saga = true,
--         which_key = true,
--         dashboard = false,
--         lightspeed = true,
--         ts_rainbow = true,
--         nvimtree = {
--             transparent_panel = true,
--         }
--     }
-- })
-- catppuccin.remap({ CursorLine = {bg = "NONE"} })
-- vim.cmd[[colorscheme catppuccin]]

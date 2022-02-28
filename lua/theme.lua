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
        CursorLine = { bg = "NONE" }
    },
})
vim.cmd("colorscheme kanagawa")

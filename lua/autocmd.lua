local nvim_create_autocmd = vim.api.nvim_create_autocmd

nvim_create_autocmd("User", {
    command = "set scrolloff=7",
    pattern = "LightspeedLeave",
})

nvim_create_autocmd({
    "CursorHold",
    "FocusGained",
    "FocusLost"
},{
    command = "checktime",
})

local signature = require('plugins.config.lspsaga_config').lspsaga_open_signature_help
nvim_create_autocmd("InsertCharPre", {
    callback = function()
        signature()
    end
})
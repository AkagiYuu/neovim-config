-- vim.opt.listchars = "eol:↴"
require("indent_blankline").setup {
    show_current_context = true,
    -- show_current_context_start = true,
    -- use_treesitter = true,
    filetype_exclude = {
        "help",
        "lspinfo",
        "packer",
        "checkhealth",
        "dashboard",
        "NvimTree",
        "telescope",
        "",
    },
    show_trailing_blankline_indent = false,
    max_indent_increase = 1,
    strict_tabs = true,
}

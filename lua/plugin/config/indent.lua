vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- vim.cmd[[set list]]
vim.opt.listchars = "eol:↴"
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
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    --     "IndentBlanklineIndent3",
    --     "IndentBlanklineIndent4",
    --     "IndentBlanklineIndent5",
    --     "IndentBlanklineIndent6",
    -- },
    max_indent_increase = 1,
    show_end_of_line = true,
    strict_tabs = true,
}

local telescope = require("telescope")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")

local vertical = {
    layout_strategies = "vertical",
    layout_config = {
        prompt_position = "top",
        anchor = "N",
    },
}


telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        layout_strategy = "flex",
        dynamic_preview_title = true,

        mappings = {
            i = {
                ["<A-p>"] = action_layout.toggle_preview,
                ["<C-Up>"] = actions.preview_scrolling_up,
                ["<C-Down>"] = actions.preview_scrolling_down,
                ["<Esc>"] = actions.close,
            },
        },
        preview = {
            timeout = 1000,
        },
    },
    pickers = {
        commands = vertical,
        keymaps = vertical,
        lsp_references = {
            theme = "cursor",
        },
    },
})

telescope.load_extension('fzf')
telescope.load_extension("file_browser")

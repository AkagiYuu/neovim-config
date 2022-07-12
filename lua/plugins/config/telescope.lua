local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')

-- local vertical = {
--     layout_strategies = 'vertical',
--     layout_config = {
--         prompt_position = 'top',
--         anchor = 'N',
--     },
-- }

telescope.setup {
    defaults = {
        prompt_prefix = '🔭 ',
        selection_caret = '➜ ',
        layout_strategy = 'flex',
        layout_config = {
            height = 0.9,
            width = 0.8,
            prompt_position = 'top'
        },
        dynamic_preview_title = true,

        mappings = {
            i = {
                ['<A-p>'] = action_layout.toggle_preview,
                ['<C-Up>'] = 'preview_scrolling_up',
                ['<C-Down>'] = 'preview_scrolling_down',
                ['<Esc>'] = 'close',
            },
        },
        preview = {
            timeout = 1000,
        },
    },
    -- pickers = {
    --     commands = vertical,
    --     keymaps = vertical,
    --     lsp_references = {
    --         theme = 'cursor',
    --     },
    -- },
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension("persisted")

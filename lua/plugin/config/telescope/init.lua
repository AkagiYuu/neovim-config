local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local trouble = require('trouble.providers.telescope')


require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        promt_prefix = '=',

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        mappings = {
            n = {
                ["<A-p>"] = action_layout.toggle_preview,
                ["<T>"] = trouble.open_with_trouble,
            },
            i = {
                ["<A-p>"] = action_layout.toggle_preview,
                ["<esc>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist,
                ["<T>"] = trouble.open_with_trouble,
            }
        }
    },
       extensions = {
        fzy_native = {
            overide_generic_sorter = false,
            overide_file_sorter = true
        }
    },
}

require("telescope").load_extension('file_browser')
require('telescope').load_extension('fzy_native')
require("telescope").load_extension("notify")

local map = vim.keymap.set

map('n', '<C-f>', function() require('telescope.builtin').current_buffer_fuzzy_find() end, {
    desc = 'Find in current buffer',
})
map('n', '<leader>f<Enter>', function() require('telescope.builtin').builtin() end, {
    desc = 'All picker'
})
map('n', '<leader>fr', function() require('telescope.builtin').resume() end, {
    desc = 'Resume'
})
map('n', '<leader>f/', function() require('telescope.builtin').current_buffer_fuzzy_find() end, {
    desc = ' Find'
})
map('n', '<leader>f?', function() require('telescope.builtin').help_tags() end, {
    desc = ' Help'
})
map('n', '<leader>fa', function() require('telescope.builtin').autocommands() end, {
    desc = 'Auto commands'
})
map('n', '<leader>fb', function() require('telescope').extensions.file_browser.file_browser() end, {
    desc = 'File browser'
})
map('n', '<leader>fc', function() require('telescope.builtin').commands() end, {
    desc = ' Commands'
})
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end, {
    desc = 'File'
})
map('n', '<leader>fw', function() require('telescope.builtin').live_grep() end, {
    desc = 'Live grep'
})
map('n', '<leader>fh', function() require('telescope.builtin').highlights() end, {
    desc = 'Hightlights'
})
map('n', '<leader>fk', function() require('telescope.builtin').keymaps() end, {
    desc = 'Keymaps'
})
map('n', '<leader>fo', function() require('telescope.builtin').oldfiles() end, {
    desc = 'Recently opened files'
})
map('n', '<leader>ft', function() require('telescope.builtin').filetypes() end, {
    desc = 'Available filetypes'
})
map('n', '<leader>fv', function() require('telescope.builtin').vim_options() end, {
    desc = 'Vim options'
})

map('n', '<leader>fgc', function() require('telescope.builtin').git_commits() end, {
    desc = 'View commit'
})
map('n', '<leader>fgb', function() require('telescope.builtin').git_branches() end, {
    desc = 'View branches'
})
map('n', '<leader>fg?', function() require('telescope.builtin').git_status() end, {
    desc = 'Git status'
})

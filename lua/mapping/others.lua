local map = vim.keymap.set

map('n', '<F3>', ':NvimTreeToggle<cr>', {
    desc = 'Toggle file tree',
    silent = true,
})

map('n', '<C-\\>', ':ToggleTerm<CR>', {
    silent = true,
    desc = 'Open terminal',
})

map('v', '<leader>re', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {
    silent = true,
    desc = 'Extract function',
})
map('v', '<leader>rf', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {
    silent = true,
    desc = 'Extract function to file',
})
map('v', '<leader>rv', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {
    silent = true,
    desc = 'Extract variable',
})
map('v', '<leader>ri', [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {
    silent = true,
    desc = 'Inline variable',
})
map('n', '<leader>rb', function()
    require('refactoring').refactor('Extract Block')
end, {
    silent = true,
    desc = 'Extract block',
})
map('n', '<leader>rbf', function()
    require('refactoring').refactor('Extract Block To File')
end, {
    silent = true,
    desc = 'Extract block to file',
})
map('n', '<leader>ri', function()
    require('refactoring').refactor('Inline Variable')
end, {
    silent = true,
    desc = 'Inline variable',
})

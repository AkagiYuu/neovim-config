local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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



vim.keymap.set('n', 'vU', function()
    vim.opt.opfunc = 'v:lua.STSSwapUpNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap master node up'
})
vim.keymap.set('n', 'vD', function()
    vim.opt.opfunc = 'v:lua.STSSwapDownNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap master node down'
})

vim.keymap.set('n', 'vu', function()
    vim.opt.opfunc = 'v:lua.STSSwapCurrentNodePrevNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap current node down'
})
vim.keymap.set('n', 'vd', function()
    vim.opt.opfunc = 'v:lua.STSSwapCurrentNodeNextNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap current node down'
})

vim.keymap.set('n', 'vx', '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set('n', 'vn', '<cmd>STSSelectCurrentNode<cr>', opts)

vim.keymap.set('x', 'J', '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set('x', 'K', '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set('x', 'H', '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set('x', 'L', '<cmd>STSSelectChildNode<cr>', opts)

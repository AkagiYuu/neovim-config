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



map('n', 'vU', function()
    vim.opt.opfunc = 'v:lua.STSSwapUpNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap master node up'
})
map('n', 'vD', function()
    vim.opt.opfunc = 'v:lua.STSSwapDownNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap master node down'
})

map('n', 'vu', function()
    vim.opt.opfunc = 'v:lua.STSSwapCurrentNodePrevNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap current node down'
})
map('n', 'vd', function()
    vim.opt.opfunc = 'v:lua.STSSwapCurrentNodeNextNormal_Dot'
    return 'g@l'
end, {
    expr = true,
    desc = 'Swap current node down'
})

local opts = { noremap = true, silent = true }
map('n', 'vx', '<cmd>STSSelectMasterNode<cr>', opts)
map('n', 'vn', '<cmd>STSSelectCurrentNode<cr>', opts)

map('x', 'J', '<cmd>STSSelectNextSiblingNode<cr>', opts)
map('x', 'K', '<cmd>STSSelectPrevSiblingNode<cr>', opts)
map('x', 'H', '<cmd>STSSelectParentNode<cr>', opts)
map('x', 'L', '<cmd>STSSelectChildNode<cr>', opts)

map('n', '<C-j>', function () require('trevj').format_at_cursor() end)

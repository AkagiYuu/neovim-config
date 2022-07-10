local nvim_create_autocmd = vim.api.nvim_create_autocmd

nvim_create_autocmd('User', {
    pattern = 'LightspeedLeave',
    command = 'set scrolloff=8',
})

nvim_create_autocmd({ 'FocusGained', 'FocusLost' }, { command = 'checktime' })

nvim_create_autocmd('BufWritePost', {
    pattern = '**/lua/plugins/init.lua',
    command = 'source <afile> | PackerCompile',
})

nvim_create_autocmd('TermOpen', { command = 'setlocal nospell' })

nvim_create_autocmd('QuitPre', { command = 'wshada' })

nvim_create_autocmd('User', {
    pattern = 'PackerCompileDone',
    callback = function()
        vim.notify('packer.compile: Complete', vim.log.levels.INFO, { title = 'packer.nvim' })
    end,
    desc = 'Notify after packer.compile completes',
})

nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    desc = 'Highlight on yank',
})

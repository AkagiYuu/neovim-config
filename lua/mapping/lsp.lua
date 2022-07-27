local map = vim.keymap.set

--#region Built-in
map('n', '<C-F12>', vim.lsp.buf.implementation, {
    desc = 'Search for implementation',
})
map('n', '<F12>', vim.lsp.buf.definition, {
    desc = 'Search for definition',
})
map('n', '<A-f>', function()
    local disable_server = {
        tsserver = true,
        html = true,
    }
    vim.lsp.buf.format {
        async = true,
        filter = function(client)
            if disable_server[client.name] then
                return false
            end

            return true
        end,
    }
end, {
    desc = 'Format',
})
map('v', '<A-f>', vim.lsp.buf.range_formatting, {
    desc = 'Format',
})
--#endregion

--#region Lspsaga
map('n', '<S-F12>', function()
    require('lspsaga.finder').lsp_finder()
    print('test')
end, {
    desc = 'Search for implementation and definition',
})
map('n', '<F2>', function()
    require('lspsaga.rename').lsp_rename()
end, {
    desc = 'Rename',
})
map('n', '<A-cr>', function()
    require('lspsaga.codeaction').code_action()
end, {
    desc = 'Code action',
})
map('x', '<A-cr>', function()
    require('lspsaga.codeaction').range_code_action()
end, {
    desc = 'Code action',
})

map('n', 'K', function()
    local ok, ufo = pcall(require, 'ufo')
    local winid = nil
    if ok then
        winid = ufo.peekFoldedLinesUnderCursor()
    end

    if not winid then
        require('lspsaga.hover').render_hover_doc()
    end
end, {
    desc = 'Hover doc',
})
map('n', '<C-f>', function()
    require('lspsaga.action').smart_scroll_with_saga(1)
end, {
    desc = 'Hover doc scroll down',
})
-- scroll up hover doc
map('n', '<C-b>', function()
    require('lspsaga.action').smart_scroll_with_saga(-1)
end, {
    desc = 'Hover doc scroll up',
})

map('n', '<leader>sh', function()
    require('lspsaga.signaturehelp').signature_help()
end, {
    desc = 'Signature help',
})
map('n', '<leader>pd', function()
    require('lspsaga.provider').preview_definition()
end, {
    desc = 'Preview definition',
})

map('n', '<leader>dl', function() require('lspsaga.diagnostic').show_line_diagnostics() end, {
    desc = 'Show line diagnostics',
})
map('n', '<leader>dp', function() require('lspsaga.diagnostic').goto_prev() end, {
    desc = 'Goto previous diagnostic',
})
map('n', '<leader>dn', function() require('lspsaga.diagnostic').goto_next() end, {
    desc = 'Goto next diagnostic',
})
map('n', '<leader>dt', function()
    local virtual_lines_enable = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config {
        virtual_lines = virtual_lines_enable,
        virtual_text = not virtual_lines_enable
    }
end, { desc = 'Toggle virtual lines', })
--#endregion

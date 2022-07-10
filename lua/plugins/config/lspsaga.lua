local saga = require('lspsaga')
-- local kind = require('lspsaga.lspkind')
-- local cmp_kind = require('theme.icon').cmp_kind

-- kind[1][2] = cmp_kind.File
-- kind[2][2] = cmp_kind.Module
-- kind[5][2] = cmp_kind.Class
-- kind[12][2] = cmp_kind.Function
-- kind[13][2] = cmp_kind.Variable
-- kind[23][2] = cmp_kind.Struct
-- kind[26][2] = cmp_kind.TypeParameter

saga.init_lsp_saga {
    move_in_saga = {
        prev = '<Up>',
        next = '<Down>',
    },
    code_action_keys = {
        quit = 'q',
        exec = '<CR>',
    },
    rename_action_quit = '<Esc>',
    border_style = 'single',
    -- symbol_in_winbar = {
    --     in_custom = true
    -- }
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = '   ',
        show_file = true,
        click_support = function(line_start, line_end, clicks, button, modifiers)
            if  button == 'l' then
                if clicks == 2 then
                    -- double left click to visual select node
                    vim.cmd("execute 'normal vv' | " .. line_start .. 'mark < | ' .. line_end .. 'mark > | normal gvV')
                else
                    vim.cmd(':' .. line_start) -- jump to node's starting line
                end
            elseif button == 'r' then
                if modifiers == 's' then
                    -- shift right click to print "lspsaga"
                    print 'lspsaga'
                end
                vim.cmd(':' .. line_end) -- jump to node's ending line
            elseif button == 'm' then
                -- middle click to visual select node
                vim.cmd("execute 'normal vv' | " .. line_start .. 'mark < | ' .. line_end .. 'mark > | normal gvV')
            end
        end,
    },
}

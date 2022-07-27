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
    -- symbol_in_winbar = {
    --     in_custom = false,
    --     enable = not vim.g.started_by_firenvim,
    --     separator = '   ',
    --     show_file = true,
    --     click_support = function(node, clicks, button, modifiers)
    --         -- To see all avaiable details: vim.pretty_print(node)
    --         local st = node.range.start
    --         local en = node.range['end']
    --         if  button == 'l' then
    --             if clicks == 2 then
    --                 -- double left click to do nothing
    --             else -- jump to node's starting line+char
    --                 vim.fn.cursor(st.line + 1, st.character + 1)
    --             end
    --         elseif button == 'r' then
    --             if modifiers == 's' then
    --                 print 'lspsaga' -- shift right click to print "lspsaga"
    --             end -- jump to node's ending line+char
    --             vim.fn.cursor(en.line + 1, en.character + 1)
    --         elseif button == 'm' then
    --             -- middle click to visual select node
    --             vim.fn.cursor(st.line + 1, st.character + 1)
    --             vim.cmd.normal('v')
    --             vim.fn.cursor(en.line + 1, en.character + 1)
    --         end
    --     end,
    -- },
}

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

local function get_file_name(include_path)
    local file_name = require('lspsaga.symbolwinbar').get_file_name()
    if vim.fn.bufname '%' == '' then return '' end
    if include_path == false then return file_name end
    local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
    -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
    local path_list = vim.split(vim.fn.expand '%:~:.:h', sep)
    local file_path = ''
    for _, cur in ipairs(path_list) do
        file_path = (cur == '.' or cur == '~') and '' or
            file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
    end
    return file_path .. file_name
end

local function config_winbar()
    local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
    local sym
    if ok then sym = lspsaga.get_symbol_node() end
    local win_val = ''
    win_val = get_file_name(false) -- set to true to include path
    if sym ~= nil then win_val = win_val .. sym end
    vim.wo.winbar = win_val
end

local events = { 'CursorHold', 'BufEnter', 'BufWinEnter', 'CursorMoved', 'WinLeave', 'User LspasgaUpdateSymbol' }

local exclude = {
    -- ['packer'] = true,
    ['toggleterm'] = true
}

-- vim.api.nvim_create_autocmd(events, {
--     pattern = '*',
--     callback = function()
--         -- Ignore float windows and exclude filetype
--         if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
--             vim.wo.winbar = ''
--         else
--             config_winbar()
--         end
--     end,
-- })

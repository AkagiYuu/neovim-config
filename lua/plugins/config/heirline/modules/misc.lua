local M = {}

M.search_results = function()
    local lines = vim.api.nvim_buf_line_count(0)
    if lines > 50000 then
        return ''
    end
    local search_term = vim.fn.getreg('/')
    if search_term == '' then
        return ''
    end
    if search_term:find('@') then
        return ''
    end

    local search_count = vim.fn.searchcount {
        recompute = 1,
        maxcount = -1,
    }
    local active = false
    if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
        active = true
    end
    if not active then
        return ''
    end

    search_term = search_term:gsub([[\<]], ''):gsub([[\>]], '')
    return '/' .. search_term .. '[' .. search_count.current .. '/' .. search_count.total .. ']'
end

M.locallist_count = function()
    local ll = vim.fn.getloclist(vim.fn.winnr(), {
        idx = 0,
        size = 0,
    })
    local count = ll.size
    local current = ll.idx
    return ('  %d/%d '):format(current, count)
end

M.fold_method = function()
    local name = ({
        marker = 'MKR',
        manual = 'MNL',
        syntax = 'SYN',
        indent = 'IND',
        expr = 'EXP',
    })[vim.wo.foldmethod] or vim.wo.foldmethod or 'N/A'
    return string.format('%s[%d]', name, vim.wo.foldlevel)
end

return M

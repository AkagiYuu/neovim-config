local map = vim.keymap.set

map('x', '$', 'g_', { silent = true })

--#region Resize
map('n', '<C-Up>', ':resize -2<CR>', { silent = true })
map('n', '<C-Down>', ':resize +2<CR>', { silent = true })
--#endregion

-- --region Scroll
-- map('n', '<S-ScrollWheelUp>', '<ScrollWheelLeft>', {
--     silent = true,
--     desc = 'Scroll left',
-- })
-- map('n', '<S-ScrollWheelDown>', '<ScrollWheelRight>', {
--     silent = true,
--     desc = 'Scroll right',
-- })
-- --endregion

-- --#region Switch window
-- map("n", "<C-h>", "<C-w>h", {
-- 	silent = true,
-- 	desc = "Move to left window",
-- })
-- map("n", "<C-j>", "<C-w>j", {
-- 	silent = true,
-- 	desc = "Move to window below",
-- })
-- map("n", "<C-k>", "<C-w>k", {
-- 	silent = true,
-- 	desc = "Move to window above",
-- })
-- map("n", "<C-l>", "<C-w>l", {
-- 	silent = true,
-- 	desc = "Move to right window",
-- })
-- --#endregion

--#region Move lines
map('n', '<A-j>', ':m .+1<CR>==', {
    silent = true,
    desc = 'Move line down',
})
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {
    silent = true,
    desc = 'Move line down',
})
map('v', '<A-j>', ":m '>+1<CR>gv=gv", {
    silent = true,
    desc = 'Move line down',
})
map('n', '<A-k>', ':m .-2<CR>==', {
    silent = true,
    desc = 'Move line up',
})
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {
    silent = true,
    desc = 'Move line up',
})
map('v', '<A-k>', ":m '<-2<CR>gv=gv", {
    silent = true,
    desc = 'Move line up',
})
--#endregion

--#region Indent
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })
--#endregion

map('t', '<esc>', [[<C-\><C-n>]])

map('v', 'p', '"_dP')

map('n', '<M-c>', function()
    vim.opt.conceallevel = vim.opt.conceallevel:get() > 0 and 0 or 2
end)
